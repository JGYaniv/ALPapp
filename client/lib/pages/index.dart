// import 'package:ALPapp/pages/show.dart';
// import 'package:ALPapp/services/auth_service.dart';
// import 'package:ALPapp/services/book_service.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
// import 'package:ALPapp/services/graphql_service.dart';
// import 'package:ALPapp/pages/add_book_form.dart';

class IndexPage extends StatelessWidget {

  final String _query = """
      {
        allBooks{
          isbn
          title
          author
        }
      }
    """;

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(documentNode: gql(_query)),
      builder: (
        QueryResult result, {
          VoidCallback refetch,
          FetchMore fetchMore,
        }
      ) {
        if (result.loading) {
          return Container(
            child: Center(
              child: Text("Loading"),
            ),
          );
        }

        final List books = result.data["allBooks"];

        if (books == null || books.isEmpty) {
          return Container(
            child: Center(
              child: Text("No books found"),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(title: Text('graphingQL!')),
            body: ListView.builder(
              itemCount: books.length,
              padding: const EdgeInsets.all(24),
              itemBuilder: (context, index) {
                final book = books[index];

                return Container(
                  margin: const EdgeInsets.only(bottom: 24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 10),
                        color: Colors.grey.shade300,
                        blurRadius: 30,
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(
                        child: Text(
                          book['title'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color(0xFF005288),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            )
          );
        }
      }
    );
  }
}

  //   return Scaffold(
  //       appBar:
  //           AppBar(title: Text('You have $_counter books'), actions: <Widget>[
  //         IconButton(
  //           icon: const Icon(Icons.sync),
  //           onPressed: () {},
  //         )
  //       ]),
  //       floatingActionButton: AddRecordButton(),
  //       drawer: IndexDrawer(authService: authService),
  //       body: StreamBuilder(
  //         builder:
  //             (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
  //           if (snapshot.hasError) {
  //             return Text("Something went wrong");
  //           }

  //           if (snapshot.connectionState == ConnectionState.waiting) {
  //             return Text("loading...");
  //           }

  //           return new ListView(
  //             children: snapshot.data.docs.map((DocumentSnapshot document) {
  //               return new ListTile(
  //                   title: new Text(document.data()['title']),
  //                   // Within the `FirstScreen` widget
  //                   onTap: () {
  //                     // Navigate to the show page using a named route.
  //                     Navigator.pushNamed(
  //                       context,
  //                       '/show',
  //                       // arguments: new Text(document.data()['title']),
  //                       arguments: ScreenArguments(
  //                         document.data()['title'],
  //                       ),
  //                     );
  //                   });
  //             }).toList()
  //           );
  //         },
  //       )
  //     );
  // }

// class IndexDrawer extends StatelessWidget {
//   const IndexDrawer({
//     Key key,
//     @required this.authService,
//   }) : super(key: key);

//   final AuthService authService;

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         // Important: Remove any padding from the ListView.
//         padding: EdgeInsets.zero,
//         children: <Widget>[
//           Container(
//             height: 50.0,
//             child: DrawerHeader(
//                 child: Text('Drawer Header'),
//                 decoration: BoxDecoration(color: Colors.amber),
//                 margin: EdgeInsets.all(0.0),
//                 padding: EdgeInsets.all(0.0)),
//           ),
//           RaisedButton(
//             color: Colors.amber,
//             child: Text(
//               'Logout',
//               style: TextStyle(
//                 fontSize: 18.0,
//                 color: Colors.black,
//               ),
//             ),
//             onPressed: () => authService.signOut(context: context),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class AddRecordButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return FloatingActionButton(
//       onPressed: () {
//         showModalBottomSheet<void>(
//           context: context,
//           builder: (BuildContext context) {
//             return Container(
//               height: 400,
//               color: Colors.amber,
//               child: AddBookForm(),
//             );
//           },
//         );
//       },
//       tooltip: 'Add Book',
//       child: Icon(Icons.add),
//     );
//   }
// }
