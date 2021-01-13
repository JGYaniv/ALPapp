import 'package:ALPapp/pages/core/auth_page.dart';
import 'package:ALPapp/services/_db_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ALPapp/services/auth_service.dart'; //data layer for authentication
import 'package:ALPapp/services/book_service.dart'; //data layer for book model

import 'package:ALPapp/theme/standard_theme.dart';
import 'package:ALPapp/pages/util_pages/book_details_page.dart';
import 'package:ALPapp/pages/home/add_find_reader.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await DbService.initialise();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthService>(
          create: (_) => AuthService(),
        ),
        Provider<BookService>(
          create: (_) => BookService(),
        )
      ],
      child: MaterialApp(
          title: 'ALPapp',
          theme: StandardThemeData.themeData(),
          home: AuthPage(),
          routes: {
            '/show': (context) => ShowPage(),
            '/readers': (context) => AddFindReader(),
          }),
    );
  }
}
