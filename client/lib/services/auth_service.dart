import 'package:ALPapp/main.dart';
import 'package:ALPapp/services/db_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class AuthService with ChangeNotifier {
  //For ChangeNotifierProvider
  FirebaseAuth _auth = FirebaseAuth.instance;
  User _user;
  String _loginType = "email";
  Database _db = DBService.getInstance().db;

//getters
  bool get isAuthenticated => _user != null;

  AuthService() {
    //get currentUser if exists
    _user = _auth.currentUser;

    _auth.authStateChanges().listen((event) {
      _onAuthStateChanges(event);
    });
  }

//OnAuthStateChanges : User Login/Logout
  _onAuthStateChanges(User newUser) {
    if (newUser != null) {
      _user = newUser;
      notifyListeners();
    }
  }

  //SignIn methods
  signInWithMail({String email, String password}) {
    _auth.signInWithEmailAndPassword(email: email, password: password);
    _loginType = "email";
    notifyListeners();
  }

  signInWithGoogle() {}

//SignUp

  signUpWithMail({String email, String password, String userName}) {
    _auth.createUserWithEmailAndPassword(email: email, password: password);
    notifyListeners();
    print(_user);
    //TODO Implement librarian preferences model: Name, Library
  }

//signOut: clears _user and pushes AuthPage to the Navigator Stack
  signOut({BuildContext context}) {
    _auth.signOut();
    _user = null;

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => App(),
        ),
        (route) => false);

    notifyListeners();
  }
}
