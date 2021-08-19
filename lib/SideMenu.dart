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
    return Container(
      alignment: Alignment.center,
      //padding: EdgeInsets.symmetric(vertical: 75, horizontal: 100),
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              changeLanguage();
            },
            child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 70,
                ),
                child: Text(
                  'language',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30),
                )),
          ),
          InkWell(
            onTap: () {
              changeTheme();
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Text(
                'theme',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void changeLanguage() {
    //Navigator.pop(context);
    showModalBottomSheet(
        context: context,
        builder: (buildContext) {
          return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                InkWell(
                  onTap: () {
                    //Navigator.pop(context);
                    provider.cahngeLanguage('ar');
                  },
                  child: Container(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Row(
                          children: [
                            Text('عربي', textAlign: TextAlign.center,),
                            provider.isar()? Icon(Icons.album,size: 25,):
                            Icon(Icons.album_outlined, size: 25,),
                          ],
                        )),
                ),
                InkWell(
                  onTap: () {
                    //Navigator.pop(context);
                    provider.cahngeLanguage('en');
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      children: [
                        Text('English',textAlign: TextAlign.center,),
                        provider.isar()? Icon(Icons.album_outlined,size: 25,):
                        Icon(Icons.album, size: 25,),
                      ],
          )),
                ),
              ],
            ),
          );
        });
  }

  void changeTheme() {
    //Navigator.pop(context);
    showModalBottomSheet(
        context: context,
        builder: (buildContext) {
          return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                InkWell(
                  onTap: () {
                    if (provider.isDarkModeEnable()) provider.toggleTheme();
                    //Navigator.pop(context);
                  },
                  child: Container(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        children: [
                          Text('Light',style: TextStyle(
                                color: provider.isDarkModeEnable()? Colors.white: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                          provider.isDarkModeEnable()
                              ? Icon(Icons.light_mode_outlined,size: 25,)
                              : Icon(Icons.light_mode,size: 25,),
                        ],
                      )),
                ),
                InkWell(
                  onTap: () {
                    if (!provider.isDarkModeEnable()) provider.toggleTheme();
                    //Navigator.pop(context);
                  },
                  child: Container(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        children: [
                          Text(
                            'Dark',
                            style: TextStyle( color: provider.isDarkModeEnable()? Colors.red: Colors.indigo),
                            textAlign: TextAlign.center,
                          ),
                          provider.isDarkModeEnable()
                              ? Icon(Icons.dark_mode,size: 25, )
                              : Icon(Icons.dark_mode_outlined,size: 25,),
                        ],
                      )),
                ),
              ],
            ),
          );
        });
  }
}
