import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:quran_flutter/AppConfigProvider.dart';

class SideMenu extends StatefulWidget {
  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  late AppConfigProvider provider;
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
    return Drawer(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 48, horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: (){
                changeLanguage();
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12),
                  child: Text('language')),
            ),
            InkWell(
              onTap: (){
                changeTheme();
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12),
                  child: Text('theme'),
                ),
            ),
          ],
        ),
      ),
    );
  }
  void changeLanguage() {
    Navigator.pop(context);
    showModalBottomSheet(context: context, builder: (buildContext){
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InkWell(
              onTap: (){
                provider.cahngeLanguage('ar');
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Text('عربي',textAlign: TextAlign.center,),
              ),
            ),
            InkWell(
              onTap: (){
                provider.cahngeLanguage('en');
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Text('English',textAlign: TextAlign.center,),
              ),
            ),
          ],
        ),
      );
    });
  }

  void changeTheme() {
    Navigator.pop(context);
    showModalBottomSheet(context: context, builder: (buildContext){
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InkWell(
              onTap: (){
                if(provider.isDarkModeEnable())
                  provider.toggleTheme();
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Text('Light',textAlign: TextAlign.center,),
              ),
            ),
            InkWell(
              onTap: (){
                if(!provider.isDarkModeEnable())
                  provider.toggleTheme();
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Text('Dark',textAlign: TextAlign.center,),
              ),
            ),
          ],
        ),
      );
    });
  }
}
