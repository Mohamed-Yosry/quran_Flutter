import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;


  void toggleTheme(){
    if(themeMode == ThemeMode.light)
      themeMode = ThemeMode.dark;
    else
      themeMode = ThemeMode.light;
    notifyListeners();
  }
  bool isDarkModeEnable(){
    return themeMode == ThemeMode.dark;
  }
}