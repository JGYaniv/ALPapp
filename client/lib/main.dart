import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ALPapp/pages/index.dart';
import 'package:ALPapp/theme/standard_theme.dart';

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
      ),
    );
  }
}