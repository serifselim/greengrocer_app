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
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),

      caption: TextStyle(
        fontSize: 11.0,
        color: Color(0xFFBDBDBD)
      )
    ),
  );
}
