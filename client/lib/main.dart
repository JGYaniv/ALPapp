import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ALPapp/theme/standard_theme.dart';
import 'package:ALPapp/pages/index.dart';
import 'package:ALPapp/pages/show.dart';
import 'package:ALPapp/pages/introscreen.dart';

// void main() {
//   runApp(App());
// }

// need to do: https://medium.com/firebase-tips-tricks/how-to-use-firebase-realtime-database-with-flutter-ebd98aba2c91

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        home: IntroScreen(),
        // home: IndexPage(),
        routes: {
          '/show': (context) => ShowPage(),
        }
      ),
    );
  }
}



