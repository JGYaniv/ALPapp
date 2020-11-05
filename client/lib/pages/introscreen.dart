import 'package:flutter/material.dart';
  
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:splashscreen/splashscreen.dart';

import 'package:ALPapp/pages/index.dart';
import 'signup.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User result = FirebaseAuth.instance.currentUser;
    print('result');
    print(result);
    return new SplashScreen(
        navigateAfterSeconds: result != null ? IndexPage(uid: result.uid) : SignUp(),
        seconds: 5,
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