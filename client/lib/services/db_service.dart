import 'package:sqflite/sqflite.dart';

class DBService {
  static DBService instance;
  static Database _db;

  Database get db => _db;

  DBService._() {
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
    //Create DB
    await database.execute("""CREATE TABLE books (
        "isbn TEXT PRIMARY KEY",
        "title TEXT,"
        "author TEXT,"
        )""");

    // Create FTS
    await database.execute("""CREATE VIRTUAL TABLE fts USING fts4(
                  "content = "books" ,"
                  "isbn,"
                  "title,"
                  "author,"
                  "notindexed = isbn") """);

    //Create Trigger

    await database
        .execute("""CREATE TRIGGER books_bu BEFORE UPDATE ON books BEGIN
                  DELETE FROM fts WHERE docid=old.rowid;
                  END;
              
                  CREATE TRIGGER books_bd BEFORE DELETE ON books BEGIN
                  DELETE FROM fts WHERE docid=old.rowid;
                  END;

                  CREATE TRIGGER books_au AFTER UPDATE ON books BEGIN
                  INSERT INTO fts(docid, title, author) 
                  VALUES(new.rowid, new.title, new.author);
                  END;

                  CREATE TRIGGER books_ai AFTER INSERT ON books BEGIN
                  INSERT INTO fts(docid, title, author)
                  VALUES(new.rowid, new.title, new.author);
                  END;

                  """);
  }
}
