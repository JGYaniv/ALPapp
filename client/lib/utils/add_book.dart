import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddBook extends StatelessWidget {
  final TextEditingController controller;

  AddBook(this.controller);

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection
    CollectionReference books = FirebaseFirestore.instance.collection('books');

    Future<void> addBook() {
      // Call the user's CollectionReference to add a new user
      return books
          .add({
            'title': controller.text,
          })
          .then((value) => print("$controller.text Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    return FlatButton(
      onPressed: addBook,
      child: Text(
        "Add Book",
      ),
    );
  }
}