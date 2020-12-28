import 'dart:convert';

import 'package:ALPapp/models/book.dart';
import 'package:ALPapp/api/graphql_config.dart';
import 'package:ALPapp/api/book.dart' as bookgql;

// firestore service
class BookService {
  Api api = Api();

  Book addBook(Book book) {
    //Add new Book to the books collection
    print(bookgql.addBook(book));
    api.getGQL(body: bookgql.addBook(book));
  }

  Future<List<String>> getAllBooks() async {
    List<String> _list = [];

    var _temp = await api.getGQL(body: bookgql.allBooks(title: true));

    _temp["allBooks"].forEach((element) {
      print(element["title"].toString());
      _list.add(element["title"].toString());
    });

    print(_list);
    return _list;
  }
}
