import 'package:sqflite/sqflite.dart';

class DBService {
  static DBService instance;
  static Database _db;

  bool _isRebuildingFTSIndex = true;

  bool get isRebuildingFTSIndex => _isRebuildingFTSIndex;
  Database get db => _db;

  DBService._() {
    Sqflite.devSetDebugModeOn(true); //The method is deprecated on purpose //TODO: remove during production
    _createDB();
  }

  _createDB() async {
    String databasesPath = await getDatabasesPath();
    String dbPath = databasesPath + '/db.alpapp';

    _db = await openDatabase(
      dbPath,
      version: 1,
      onCreate: _onCreateDB,
    );
  }

  static DBService getInstance() {
    if (instance == null) {
      instance = DBService._();
    }

    return instance;
  }

  addData(Map<String, dynamic> json) {
    
  }

  _onCreateDB(Database database, int version) async {
    print("VERSION: ${await database.getVersion()}");

    //Create DB
    await database.execute("CREATE TABLE books("
        "isbn TEXT PRIMARY KEY,"
        "title TEXT,"
        "author TEXT"
        ")");

    // Create FTS
    await database.execute("CREATE VIRTUAL TABLE fts USING fts4("
                                     "isbn,title,author)");

    //Build Index
    await database.execute("INSERT INTO fts(fts) values('rebuild')").then(
      (value) async {
        _isRebuildingFTSIndex == false;
             },
    );

    //Create Trigger
    await database.execute("CREATE TRIGGER books_ai AFTER INSERT ON books BEGIN "
        "INSERT INTO fts(isbn, title, author) VALUES (new.isbn, new.title, new.author); "
        "END;"
        "CREATE TRIGGER books_ad AFTER DELETE ON books BEGIN "
        "INSERT INTO fts(fts, isbn, title, author) VALUES('delete', old.isbn, old.title, old.author); "
        "END; "
        "CREATE TRIGGER books_au AFTER UPDATE ON books BEGIN "
        "INSERT INTO fts(fts, isbn, title, author) VALUES('delete', old.isbn, old.title, old.author); "
        "INSERT INTO fts(isbn, title, author) VALUES (new.isbn, new.title, new.author); "
        "END; ");
  }
}
