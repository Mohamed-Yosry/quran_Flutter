import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_flutter/AooConfigProvider.dart';
import 'package:quran_flutter/MyThemeData.dart';

import 'bottomBar.dart';

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
          themeMode: provider.themeMode,
          theme: MyThemeData.lightTheme,
          darkTheme: MyThemeData.darkTheme,
          home:BottomBar(),
        );

      }
    );


  }
}
