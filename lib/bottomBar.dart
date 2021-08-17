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



        showSelectedLabels: true,
        showUnselectedLabels: false,
        items: [
          /*BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'add',
          ),*/
          BottomNavigationBarItem(
              icon: Image.asset("assets/radio.png"),
              // ignore: deprecated_member_use
              title:Text("راديو",style:Theme.of(context).textTheme.bodyText2),
              //label: 'ssss',
              activeIcon: Image.asset("assets/radio.png",color: Theme.of(context).iconTheme.color,)

            //activeIcon: Image.asset("assets/radio_selected.png",color: Theme.of(context).iconTheme.color,)
          ),


          BottomNavigationBarItem(
              icon: Image.asset("assets/sebha.png"),
              title:Text('سبحة',style:Theme.of(context).textTheme.bodyText2),
              activeIcon: Image.asset("assets/sebha.png",color: Theme.of(context).iconTheme.color,)
          ),

          BottomNavigationBarItem(
              icon: Image.asset("assets/hadeth.png"),
              title:Text('أحاديث',style:Theme.of(context).textTheme.bodyText2),
              activeIcon: Image.asset("assets/hadeth.png",color: Theme.of(context).iconTheme.color,)
          ),

          BottomNavigationBarItem(
              icon: Image.asset("assets/quran.png",),
              title:Text('قرآن',style:Theme.of(context).textTheme.bodyText2),
              activeIcon: Image.asset("assets/quran.png",color: Theme.of(context).iconTheme.color,)
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.settings,color: Colors.white70,size: 50,),
              title:Text('إعدادات',style:Theme.of(context).textTheme.bodyText2),
              activeIcon: Icon(Icons.settings,/*color: Colors.black87,*/size: 50,)
          ),
        ],
        onTap: inc,
        currentIndex: curruntIndex,
        type: BottomNavigationBarType.fixed,
      ),

    );
  }
}
