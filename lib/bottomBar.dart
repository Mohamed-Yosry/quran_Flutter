import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_flutter/SideMenu.dart';
import 'package:quran_flutter/sebha.dart';
import 'AhadeethList.dart';
import 'AppConfigProvider.dart';
import 'sowarListPage.dart';

class BottomBar extends StatefulWidget {

  @override
  BottomBarState createState() => BottomBarState();
}

class BottomBarState extends State<BottomBar> {

  int curruntIndex = 3;
  final List <Widget> pages=[
    SurahsList(),
    sebha(),
    HadeethsList(),
    SurahsList(),
    SideMenu()
  ];


  void inc(int x) {
    setState(() {
      curruntIndex = x;
    });
  }
  AppConfigProvider provider;
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
    return Scaffold(

      body:Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: provider.isDarkModeEnable()?AssetImage(
                      "assets/bg.png"):AssetImage(
                      "assets/bg3.png"),
                  fit: BoxFit.cover,
                ),
              ),
            child:pages[curruntIndex],
          ),

      bottomNavigationBar: BottomNavigationBar(

        items: [
          BottomNavigationBarItem(
              icon: Image.asset("assets/radio.png"),
              title:Text(''),
              activeIcon: Image.asset("assets/radio_selected.png")
          ),


          BottomNavigationBarItem(
              icon: Image.asset("assets/sebha.png"),
              title:Text(''),
              activeIcon: Image.asset("assets/sebha_selected.png")
          ),

          BottomNavigationBarItem(
              icon: Image.asset("assets/hadeth.png"),
              title:Text(''),
              activeIcon: Image.asset("assets/hadeth_selected.png")
          ),

          BottomNavigationBarItem(
              icon: Image.asset("assets/quran.png"),
              title:Text(''),
              activeIcon: Image.asset("assets/quran_selected.png")
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.settings,color: Colors.white70,size: 50,),
              title:Text(''),
              activeIcon: Icon(Icons.settings,color: Colors.black87,size: 50,)
          ),
        ],
        onTap: inc,
        currentIndex: curruntIndex,
        type: BottomNavigationBarType.fixed,
      ),

    );
  }
}
