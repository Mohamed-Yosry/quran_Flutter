import 'package:flutter/material.dart';
import 'package:quran_flutter/chapletPage.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _itemCount = 0;
  @override
  Widget build(BuildContext context) {
    return   new Stack(
        children:[
          new Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    "assets/bg3@2x.png"),
                fit: BoxFit.fill,



              ),
            ),
          ),
          new Column(
            children: [
              new Container(
                padding: EdgeInsets.only(top:30),
                child: new Text("إسلامي",style: TextStyle(fontSize: 25, color: Colors.black,decorationStyle:TextDecorationStyle.dashed ), textAlign: TextAlign.center,),
                alignment: Alignment.center,
              ),
              new Container(
                height: 100.0,
                width: 80.0,

                decoration: BoxDecoration(

                  image: DecorationImage(
                    image: AssetImage('assets/head of seb7a@2x.png'),
                  ),

                ),
              ),
              new Container(
                height: 200.0,
                width: 200.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/body of seb7a@3x.png'),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              new Container(
                padding: EdgeInsets.only(top:55),
                child: new Text("عدد التسبيحات",style: TextStyle(fontSize: 20, color: Colors.black), textAlign: TextAlign.center,),

              ),



            ],

          )
        ]
    );
  }
}
