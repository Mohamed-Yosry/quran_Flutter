import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfigProvider extends ChangeNotifier{
  String locale="ar";
  ThemeMode themeMode = ThemeMode.light;

  final String Theme = "theme";
  final String Lang = "language";

  late SharedPreferences _prefs;
  late bool _darkTheme=false;

  AppConfigProvider() {
    _loadFromPrefs();
  }


  bool isDarkModeEnable(){
    return themeMode == ThemeMode.dark;
  }
  bool isar(){
    return locale == "ar";
  }


  toggleTheme() {
    if(themeMode == ThemeMode.light)
      themeMode = ThemeMode.dark;
    else
      themeMode = ThemeMode.light;
    notifyListeners();

    _darkTheme = !_darkTheme;
    _saveToPrefs();
    notifyListeners();
  }




  _initPrefs() async {
    if(true)
      _prefs = await SharedPreferences.getInstance();
  }

  _loadFromPrefs() async {
    await _initPrefs();
    _darkTheme = _prefs.getBool(Theme) ?? false;
      locale=_prefs.getString(Lang) ?? "ar";

    if(_darkTheme){
     themeMode = ThemeMode.dark;
    }
    else{

      themeMode = ThemeMode.light;
    }


    notifyListeners();
  }


  _saveToPrefs()async {
    await _initPrefs();
    _prefs.setString(Lang, locale);
    _prefs.setBool(Theme, _darkTheme);
  }


  void cahngeLanguage(String language) async{
    if(language==locale)
      return;

    locale=language;
    _saveToPrefs();
    notifyListeners();
  }

  int getLanguage(){

    if(locale=="ar"){
      return 1;
    }
    else if(locale=="en"){
      return 2;

    }

    return 0;
  }
}

