import 'package:ALPapp/models/book.dart';
import 'package:ALPapp/api/graphql_config.dart';
import 'package:ALPapp/api/book.dart' as bookgql;
import 'package:ALPapp/services/db_service.dart';
import 'package:sqflite/sqflite.dart';

// firestore service
class BookService {
  Api api = Api();

//Add new Book to the books collection
  addBook(Book book) {
    api.getGQL(body: bookgql.addBook(book));
  }

//Get all books
  Future<List<String>> getAllBooks() async {
    List<String> _list = [];
    Database db = await DBService.getInstance().db;

    var _temp = await api.getGQL(
        body: bookgql.allBooks(isbn: true, title: true, author: true));

    _temp["allBooks"].forEach(
      (element) {
        _list.add(element["title"].toString());

        if (element["title"] != null &&
            element["isbn"] != null &&
            element["author"] != null) {
          db.insert(
            "fts",
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
}
