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
}