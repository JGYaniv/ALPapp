import 'package:ALPapp/models/book.dart';
import 'package:ALPapp/api/graphql_config.dart';
import 'package:ALPapp/api/book.dart' as api;
import 'package:graphql_flutter/graphql_flutter.dart';

// firestore service
class BookService {
  GraphQLClient _client = GraphQLConfiguration().getClient();

  Book addBook(Book book) {
    //Add new Book to the books collection
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

      _list = _temp
          .map((e) => e["title"].toString())
          .toList(); //TODO Revisit [graphql_flutter] docs again
      return _list;
    }, onError: (result) {
      print(result.error);
    });
  }
}
