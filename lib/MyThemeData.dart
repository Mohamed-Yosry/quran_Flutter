import 'dart:ui';

import 'package:flutter/material.dart';

class MyThemeData{
  static final lightTheme = ThemeData(
    brightness: Brightness.light,

    bottomNavigationBarTheme: BottomNavigationBarThemeData( backgroundColor: Color.fromRGBO(223, 170, 97, 1)),

    textTheme: TextTheme(
      headline2: TextStyle(
          fontSize: 30,
          color: Colors.black,
          decoration: TextDecoration.underline
      ),
      bodyText1: TextStyle(
        fontSize: 20,
        color: Colors.black,
      ),
    ),

  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,

    bottomNavigationBarTheme: BottomNavigationBarThemeData( backgroundColor: Color.fromRGBO(8, 19, 61, 1.0)),

    textTheme: TextTheme(
      headline2: TextStyle(
          fontSize: 30,
          color: Colors.yellowAccent,
          decoration: TextDecoration.underline
      ),
      bodyText1: TextStyle(
        fontSize: 20,
        color: Colors.yellowAccent,
      ),
    ),

  );

}