import 'package:sqflite/sqflite.dart';

class DBService {
  static DBService instance;
  static Database _db;

  Database get db => _db;

  DBService._() {
    Sqflite.devSetDebugModeOn(true); //The method is deprecated on purpose
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

  addData(Map<String, dynamic> json) {}

  _onCreateDB(Database database, int version) async {
    print("VERSION: ${await database.getVersion()}");

    //Create DB

    await database.execute("CREATE TABLE books ("
        "isbn TEXT PRIMARY KEY,"
        "title TEXT,"
        "author TEXT"
        ")");

    // // Create FTS
    //TODO FTS 
    //   await database.execute("CREATE VIRTUAL TABLE fts using fts5("
    //       "isbn)");

    //   // await database.execute(
    //   //   "CREATE VIRTUAL TABLE fts USING fts5("
    //   //   "content = books,"
    //   //   "content_rowid = isbn,"
    //   //   "isbn UNINDEXED,"
    //   //   "title,"
    //   //   "author"
    //   //   ")",
    //   // );

    //   // //Create Trigger

    // //   await database.execute("CREATE TRIGGER books_ai AFTER INSERT ON books BEGIN"
    // //       "INSERT INTO fts(rowid, title, author) VALUES (new.isbn, new.title, new.author);"
    // //       "END;"
    // //       "CREATE TRIGGER books_ad AFTER DELETE ON books BEGIN"
    // //       "INSERT INTO fts(fts, rowid, title, author) VALUES('delete', old.isbn, old.title, old.author);"
    // //       "END;"
    // //       "CREATE TRIGGER books_au AFTER UPDATE ON books BEGIN"
    // //       "INSERT INTO fts(fts, rowid, title, author) VALUES('delete', old.isbn, old.title, old.author);"
    // //       "INSERT INTO fts(rowid, title, author) VALUES (new.isbn, new.title, new.author);"
    // //       "END;");
    // // }
  }
}
