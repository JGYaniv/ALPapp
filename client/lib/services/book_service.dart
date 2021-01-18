import 'package:ALPapp/models/book.dart';
import 'package:ALPapp/services/api_services/_api_service.dart';
import 'package:ALPapp/services/api_services/book_api.dart' as bookAPI;
import 'package:ALPapp/services/_db_service.dart';
import 'package:sqflite/sqflite.dart';

class BookService {
  ApiService api = ApiService();
  Database db = DbService.instance.db;

//Add new Book to the books collection
  addBook(Book book) {
    db.insert('books', book.toJson(),
        conflictAlgorithm: ConflictAlgorithm.abort);
    // TODO: Composite key for books table
    api.call(
      commands: bookAPI.addBook(book),
    ); // TODO: Offline first, log transactions
  }

//Get all books
  Future<List<String>> getAllBooks() async {
    
    List<String> _list = [];

    //Call the graphql endpoint
    var response = await api.call(
      commands: bookAPI.allBooks(
        isbn: true,
        title: true,
        author: true,
      ),
    );

    response["allBooks"].forEach(
      (element) {
        _list.add(element["title"].toString());

        if (element["title"] != null &&
            element["isbn"] != null &&
            element["author"] != null) {
          db.insert("books", element,
              conflictAlgorithm: ConflictAlgorithm.ignore);
        }
      },
    );

    return _list;
  }

  Future<Book> getBook(String isbn) async {
    List<Map> _list =
        await db.query('books', where: 'isbn=?', whereArgs: [isbn]);
    return Book.fromJson(_list.first);
  }
}
