import 'dart:ui';

import 'package:flutter/material.dart';

class MyThemeData{
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
   colorScheme: ColorScheme.light(),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color.fromRGBO(223, 170, 97, 1),
      selectedIconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),

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
      bodyText2: TextStyle(
        fontSize: 15,
        color: Colors.black,
      ),
    ),



  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,

    iconTheme: IconThemeData(
      color: Colors.yellowAccent,
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(

        backgroundColor: Color.fromRGBO(8, 19, 61, 1.0),
        selectedIconTheme: IconThemeData(
          color: Colors.yellowAccent,
        )
        ),

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
      bodyText2: TextStyle(
        fontSize: 15,
        color: Colors.yellowAccent,
      ),
    ),

  );

}