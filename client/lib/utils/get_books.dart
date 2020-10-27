import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../pages/show.dart';

class GetBooks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference books = FirebaseFirestore.instance.collection('books');

    return StreamBuilder<QuerySnapshot>(
      stream: books.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("loading...");
        }

        return new ListView(
          children: snapshot.data.docs.map((DocumentSnapshot document) {
            return new ListTile(
              title: new Text(document.data()['title']),
              // Within the `FirstScreen` widget
              onTap: () {
                // Navigate to the show page using a named route.
                Navigator.pushNamed(
                  context, 
                  '/show',
                  // arguments: new Text(document.data()['title']),
                  arguments: ScreenArguments(
                    document.data()['title'],
                  ),
                );
              }
            );
          }).toList(),
        );

      },
    );
  }
}