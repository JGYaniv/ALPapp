import 'package:sqflite/sqflite.dart';

class DbService {
  static DbService _instance;
  static Database _db;
  static String _dbPath;

  bool _isRebuildingFTSIndex = true;

  static DbService get instance => _instance ?? DbService._();

  bool get isRebuildingFTSIndex => _isRebuildingFTSIndex;
  Database get db => _db ?? DbService._().db;

  DbService._() {
    Sqflite.devSetDebugModeOn(
        true); //The method is deprecated on purpose //TODO: remove during production
    _createDb();
  }

  static initialise() async {
    _instance ??= DbService._();
  }

  Future<String> _getDbPath() async {
    String databasesPath = await getDatabasesPath();
    _dbPath = databasesPath + '/db.alpapp';
    return _dbPath;
  }

  checkDbExists() async {}

  checkTableExists(String tableName) async {
    List list = await _db
        .query('sqlite_master', where: 'name=?', whereArgs: [tableName]);

    return list.isNotEmpty;
  }

  _createDb() async {
    _db = await openDatabase(
      await _getDbPath(),
      version: 1,
      onCreate: _onCreateDb,
    );
  }

  _onCreateDb(Database database, int version) async {
    print("VERSION: ${await database.getVersion()}");

    //Create table Books
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
          (value) => _isRebuildingFTSIndex == false,
        );

    //Create Triggers
    await database.execute(
        "CREATE TRIGGER books_ai AFTER INSERT ON books BEGIN "
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
