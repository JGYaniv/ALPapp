import 'package:ALPapp/pages/home/home_page.dart';
import 'package:ALPapp/pages/signup/signup_login_page.dart';
import 'package:ALPapp/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthService authService = Provider.of<AuthService>(context);
    return authService.isAuthenticated ? IndexPage() : SignUpPage();
  }
}
