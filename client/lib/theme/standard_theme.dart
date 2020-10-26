import 'package:flutter/material.dart';

class StandardThemeData{
  static ThemeData themeData() {
    return ThemeData(
          primarySwatch: Colors.amber,
          canvasColor: Colors.yellow,
          visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}