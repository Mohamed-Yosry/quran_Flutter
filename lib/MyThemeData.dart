import 'dart:ui';

import 'package:flutter/cupertino.dart';
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

      accentColor: Color.fromRGBO(201, 179, 150, 1),
      buttonColor:  Color.fromRGBO(183, 143, 95, 1)

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

      accentColor: Color.fromRGBO(21, 27, 49, 1),

      buttonColor: Color.fromRGBO(250, 204, 29, 1),

  );

}