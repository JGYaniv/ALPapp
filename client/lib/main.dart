import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ALPapp/pages/index.dart';
import 'package:ALPapp/theme/standard_theme.dart';

// importing pages for navigation
import 'pages/index.dart';
import 'pages/show.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context){}),
      ],
      child: MaterialApp(
        title: 'ALPapp',
        theme: StandardThemeData.themeData(),
        home: IndexPage(),
        // adding routes
        // initialRoute: '/',
        routes: {
          // If the home property is specified, the routes table cannot include an entry for "/", since it would be redundant.
          // '/': (context) => IndexPage(),
          '/show': (context) => ShowPage(),
        }
      ),
    );
  }
}



