import 'package:ALPapp/pages/auth_page.dart';
import 'package:flutter/material.dart';

import 'package:splashscreen/splashscreen.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        navigateAfterSeconds: AuthPage(),
        seconds: 1,
        title: new Text(
          'Welcome To AlpAPP!',
          style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        // image: Image.asset('assets/images/dart.png', fit: BoxFit.scaleDown),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        onClick: () => print("flutter"),
        loaderColor: Colors.red);
  }
}
