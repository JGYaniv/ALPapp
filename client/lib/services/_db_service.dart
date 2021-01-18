import 'dart:io';
import 'package:sqflite/sqflite.dart';

class DbService {
  static DbService _instance;
  static Database _db;

  //Getters
  static DbService get instance => _instance ?? DbService._();
  Database get db => _db ?? DbService._().db;

  DbService._() {
    // ignore: deprecated_member_use
    Sqflite.devSetDebugModeOn(true);
    _initDb();
  }

  static initialize() async {
    _instance ??= DbService._();
    return _instance;
  }
  _initDb() async {
    String databasesDir = await getDatabasesPath();
    String databasePath = databasesDir + '/db.alpapp';

    dbExists(databasePath)? print("Db Exists"): print("Db doesn't exist");

    _db = await openDatabase(
      databasePath,
      version: 1,
      onCreate: _onCreateDb,
      onOpen: _onOpenDb
    );
  }


  dbExists(String path) {
    return File(path).existsSync();
  }


  tableExists(String tableName) async {
    List list = await _db
        .query('sqlite_master', where: 'name=?', whereArgs: [tableName]);

    return list.isNotEmpty;
  }

  _onOpenDb(Database database){
    print("Database Opened");
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
    await database.execute("INSERT INTO fts(fts) values('rebuild')");

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
