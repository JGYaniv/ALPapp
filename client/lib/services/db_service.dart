import "package:sqflite/sqflite.dart";
import "package:async/async.dart";

class DBService {
  static final DBService _dbService = DBService._();
  static Database _db;
  static bool _isRebuildingFTSIndex = true;

  //Internal constructor for [_dbService]
  DBService._();

  //AsyncMemoizer for preventing caching initDB() return
  static final _initDBMemoizer = AsyncMemoizer();

  //Throw error when accessed before [ensureinitialised()] is called
  static DBService get instance => _dbService;
  static bool get isREbuildingFTSIndex => _isRebuildingFTSIndex;
  static Database get db => _db;

  //To be called at the start of the program
  static ensureInitialized() async {
    // Sqflite.devSetDebugModeOn(true); //Deperecated on purpose
    if (_db == null) {
      await _initDBMemoizer.runOnce(() async {
        await _initDB();
      });
    }
  }

  static _initDB() async {
    String dir = await getDatabasesPath();
    String dbPath = dir + "/db.alpapp";

    _db = await openDatabase(dbPath, version: 1, onCreate: _onCreateDB);
  }

  static _onCreateDB(Database database, int version) async {
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

    //Create Trigger
    await database
        .execute("""CREATE TRIGGER books_bu BEFORE UPDATE ON books BEGIN
                    DELETE FROM fts WHERE isbn=old.isbn;
                    END;""");

    await database
        .execute("""CREATE TRIGGER books_bd BEFORE DELETE ON books BEGIN
                              DELETE FROM fts WHERE isbn=old.isbn;
                              END;""");

    await database
        .execute("""CREATE TRIGGER books_au AFTER UPDATE ON books BEGIN
                              INSERT INTO fts(isbn, title, author) VALUES(new.isbn, new.title, new.author);
                              END;""");

    await database
        .execute("""CREATE TRIGGER books_ai AFTER INSERT ON books BEGIN
                              INSERT INTO fts(isbn, title, author) VALUES(new.isbn, new.title, new.author);
                              END;""");
  }

  static deleteDB() async {
    String dir = await getDatabasesPath();
    String dbPath = dir + "/db.alpapp";
    await deleteDatabase(dbPath);
  }
}
