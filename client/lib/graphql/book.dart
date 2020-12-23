//Queries
import 'package:ALPapp/models/book.dart';

String allBooks({bool isbn = false, bool title = false, bool author = false}) {
  return """
  query{
    allBooks{
      ${isbn ? "isbn," : ""}
      ${title ? "title," : ""}
      ${author ? "author," : ""}  
    }
  }
  """;
}

String getBook(String isbn) {
  return """ 
  query{
      getBook(isbn:$isbn){
      isbn,
      title,
      author,
    }
  }""";
}

//Mutations
String addBook(Book book) {
  return """
      mutation{
          addBook(isbn: ${book.isbn}, title: ${book.title}, author: ${book.author}){
            id
            name
            phone
            address
          }
      }
    """;
}
