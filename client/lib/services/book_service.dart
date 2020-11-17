import 'package:ALPapp/models/book.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// firestore service
class BookService {
  FirebaseFirestore _db;
  CollectionReference _booksRef;

  BookService() {
    _db = FirebaseFirestore.instance;
    _booksRef = _db.collection('books');
  }

  addBook(Book book) {
    //Add new Book to the books collection
    //TODO Security rules needed
    _booksRef
        .add({
          'title': book.title,
        })
        .then((value) => print("${book.title} Added"))
        .catchError((error) => print("Failed to add book: $error"));
  }

  Stream<QuerySnapshot> getBooks() {
    //To be used with a StreamBuilder
    return _booksRef.snapshots();
  }
}
