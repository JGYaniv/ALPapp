import 'package:ALPapp/pages/show.dart';
import 'package:ALPapp/services/auth_service.dart';
import 'package:ALPapp/services/book_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:ALPapp/pages/add_book_form.dart';
import 'package:provider/provider.dart';

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

  //Removed unecessary Firebase Init
  @override
  Widget build(BuildContext context) {
    // Show error message if initialization failed
    AuthService authService = Provider.of<AuthService>(context);
    BookService bookService = Provider.of<BookService>(context);

    return Scaffold(
        appBar:
            AppBar(title: Text('You have $_counter books'), actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.sync),
            onPressed: () {},
          )
        ]),
        floatingActionButton: AddRecordButton(),
        drawer: IndexDrawer(authService: authService),
        body: StreamBuilder(
          stream: bookService.getBooks(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                    });
              }).toList(),
            );
          },
        ));
  }
}

class IndexDrawer extends StatelessWidget {
  const IndexDrawer({
    Key key,
    @required this.authService,
  }) : super(key: key);

  final AuthService authService;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 50.0,
            child: DrawerHeader(
                child: Text('Drawer Header'),
                decoration: BoxDecoration(color: Colors.amber),
                margin: EdgeInsets.all(0.0),
                padding: EdgeInsets.all(0.0)),
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
            onPressed: () => authService.signOut(context: context),
          ),
        ],
      ),
    );
  }
}

class AddRecordButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
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
