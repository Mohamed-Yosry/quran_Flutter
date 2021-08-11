import 'package:flutter/material.dart';
import 'package:quran_flutter/sebha.dart';

import 'AhadeethList.dart';
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
  ];


  void inc(int x) {
    setState(() {
      curruntIndex = x;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[curruntIndex],

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(223, 170, 97, 1),

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

        ],
        onTap: inc,
        currentIndex: curruntIndex,
        type: BottomNavigationBarType.fixed,

      ),
    );
  }
}
