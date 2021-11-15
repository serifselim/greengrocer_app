import 'package:flutter/material.dart';

ThemeData kTheme() {
  return ThemeData(
    primaryColor: Colors.lightBlue[800],
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      headline2: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
  );
}
