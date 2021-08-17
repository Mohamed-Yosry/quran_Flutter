import 'package:flutter/material.dart';
//import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:quran_flutter/AppConfigProvider.dart';
import 'package:quran_flutter/MyThemeData.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:quran_flutter/AppConfigProvider.dart';

import 'bottomBar.dart';
//import 'package:flutter_gen/gen_l10n/app_localizations.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (buildContext)=> AppConfigProvider(),
      builder: (buildContext, Widget)
      {
        final provider = Provider.of<AppConfigProvider>(buildContext);
        return MaterialApp(
          locale: Locale.fromSubtags(languageCode: provider.locale),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          themeMode: provider.themeMode,
          theme: MyThemeData.lightTheme,
          darkTheme: MyThemeData.darkTheme,
          home:BottomBar(),
        );

      }
    );


  }
}
