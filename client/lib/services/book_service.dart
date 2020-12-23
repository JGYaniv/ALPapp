import 'package:ALPapp/models/book.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ALPapp/graphql/graphql_config.dart';
import 'package:ALPapp/graphql/book.dart' as api;
import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'dart:convert';

// firestore service
class BookService {
  FirebaseFirestore _db;
  CollectionReference _booksRef;
  GraphQLClient _client = GraphQLConfiguration().getClient();
  BookService() {
    _db = FirebaseFirestore.instance;
    _booksRef = _db.collection('books');
  }

  Book addBook(Book book) {
    //Add new Book to the books collection

    Book _resultBook;
    //TODO Security rules needed
    _booksRef
        .add({
          'title': book.title,
        })
        .then((value) => print("${book.title} Added"))
        .catchError((error) => print("Failed to add book: $error"));

    _client
        .mutate(
      MutationOptions(
        documentNode: gql(api.addBook(book)),
      ),
    )
        .then((QueryResult result) {
      print(result);
    });
  }

  Future<List<String>> getAllBooks() {
    List<String> _list;
    return _client
        .query(QueryOptions(documentNode: gql(api.allBooks(title: true))))
        .then((result) {
      List _temp = result.data["allBooks"];
      _list = _temp.map((e) => e["title"].toString()).toList()
          ; //TODO Revisit [graphql_flutter] docs again
      return _list;
    }, onError: (result) {
      print(result.error);
    });
  }
}
