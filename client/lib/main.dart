import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ALPapp/theme/standard_theme.dart';
import 'package:ALPapp/pages/index.dart';
import 'package:ALPapp/pages/show.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {

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
        routes: {
          '/show': (context) => ShowPage(),
        }
      ),
    );
  }
}



