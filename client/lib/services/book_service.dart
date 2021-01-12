import 'package:ALPapp/models/book.dart';
import 'package:ALPapp/services/api_services/_api_service.dart';
import 'package:ALPapp/services/api_services/book_api.dart' as bookAPI;
import 'package:ALPapp/services/_db_service.dart';
import 'package:sqflite/sqflite.dart';

class BookService {
  ApiService api = ApiService();


//Add new Book to the books collection
  addBook(Book book) {
    api.call(commands: bookAPI.addBook(book)); // TODO: Offline first, log transactions

  }

//Get all books
  Future<List<String>> getAllBooks() async {
    List<String> _list = [];
    Database db = await DBService.getInstance().db;

    var _temp = await api.call(
        commands: bookAPI.allBooks(isbn: true, title: true, author: true));

    _temp["allBooks"].forEach(
      (element) {
        _list.add(element["title"].toString());

        //TODO: check existence of books before writing

        if (element["title"] != null &&
            element["isbn"] != null &&
            element["author"] != null) {
          print(element);
          db.insert(
            "books",
            {
              "isbn": element["isbn"],
              "title": element["title"],
              "author": element["author"],
            },
          );
        }
      },
    );
    return _list;
  }

  getBook(String isbn){
    
  }
}
