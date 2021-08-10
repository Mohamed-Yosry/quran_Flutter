import 'package:flutter/material.dart';
import 'package:quran_flutter/sowarListPage.dart';
class BottomBar extends StatefulWidget {

  @override
  BottomBarState createState() => BottomBarState();
}

class BottomBarState extends State<BottomBar> {

  int curruntIndex=2;
  final List <Widget> pages=[
    SurahsList(),
    SurahsList(),
    SurahsList(),
    SurahsList(),
  ];


  void inc(int x) {
    setState(() {
      curruntIndex=x;
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
