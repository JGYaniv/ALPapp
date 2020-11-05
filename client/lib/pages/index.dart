import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:ALPapp/utils/get_books.dart';
import 'package:ALPapp/pages/add_book_form.dart';

import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

import 'introscreen.dart';


class IndexPage extends StatefulWidget {
  // for auth start
  IndexPage({this.uid});
  final String uid;
  final String title = "Home";
  // for auth end
  
  // IndexPage(); // old 

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int _counter = 0;
  bool _initialized = false;
  bool _error = false;
  // final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch(e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }
  
  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }
  // added signout
  Future<void> _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      runApp(
      new MaterialApp(
        home: IntroScreen(),
      )

  );
    } catch (e) {
      print(e); // TODO: show dialog with error
    }
  }


  @override
  Widget build(BuildContext context) {
      // Show error message if initialization failed
    if(_error) {
      return Text('Error loading FireStore');
    }

    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
      return Text('Loading...');
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('You have $_counter books'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.sync),
            onPressed: (){},
          )
        ]
      ),
      floatingActionButton: AddRecordButton(),
      body: GetBooks(),
      drawer: Drawer(
        child: ListView(
        // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 50.0,
              child: DrawerHeader(
                child: Text('Drawer Header'),
                  decoration: BoxDecoration(
                  color: Colors.amber
                ),
                margin: EdgeInsets.all(0.0),
                padding: EdgeInsets.all(0.0)
              ),
            ),
            RaisedButton(
              color: Colors.amber,
              child: Text(
                'Logout',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                ),
              ),
              onPressed: _signOut,
            ),
          ],
        ),   
      ),
    );
  }
}

class AddRecordButton extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return FloatingActionButton(
      onPressed: (){ 
        showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 400,
                color: Colors.amber,
                child: AddBookForm(),
              );
            },
          );
      },
      tooltip: 'Add Book',
      child: Icon(Icons.add),
    );
  }
}

