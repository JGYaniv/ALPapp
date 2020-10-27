import 'package:flutter/material.dart';

class ShowPage extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    print('hi');
    print(context);
    print(args);
    print(ModalRoute.of(context));
    return Scaffold(
      appBar: AppBar(
        // title: Text("Second Screen"),
        title: Text(args.title),
      ),
      body: Center(
        child: Text(args.title),
      ),
      floatingActionButton: ElevatedButton(
          onPressed: () {
            // Navigate back to index page when tapped.
            Navigator.pushNamed(context, '/');
          },
          child: Text('Go back!'),
        ),
    );
  }
}

class ScreenArguments {
  final String title;


  ScreenArguments(this.title);
}



