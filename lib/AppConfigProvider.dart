import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier{
  String locale="ar";

  void cahngeLanguage(String language)
  async{
    if(language==locale)
      return;

    locale=language;
    notifyListeners();
  }
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