import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class sebha extends StatefulWidget {

  sebha();
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _sebha();
  }
}

class _sebha extends State<sebha> {
  int counter = 0;
  List<String> s = ["سبحان الله","الله أكبر","الحمد لله"];
  int index = 0;
  _sebha();

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "assets/2.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
            children:[
              Container(
                margin: EdgeInsets.only(right: 10,top:25,bottom: 30),
                child:
                  Center(
                      child:Text("اسلامي",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                    ),
              ),
              Container(
                padding: EdgeInsets.all(0),
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 30,bottom:0),child:Image.asset("assets/sebhaHead.png",width: 80,height:80,)),
                    new RotatedBox(
                      child: IconButton(icon: Image.asset("assets/sebhaBody.png"),onPressed: () {
                        increament();
                      },iconSize: 200,),
                      quarterTurns: counter,
                    )
                  ],
                )

              ),
              Container(
                margin: EdgeInsets.only(bottom: 10,top: 20),
                child:Text("عدد التسبيحات",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
              ),
              Container(
                width: 50, height: 50,
                alignment: Alignment.center,
                color: Color.fromRGBO(250, 215, 160, 1),
                margin: EdgeInsets.only(bottom: 20,top: 20),
                child:Text("$counter" ,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
              ),
        Container(
          padding: EdgeInsets.only(bottom: 10),
          child: RaisedButton(
                  child: Text(
                    s[index],
                    style: TextStyle(color: Colors.white, fontSize: 45),
                  ),
                  color: Color.fromRGBO(223, 170, 97, 1),
                  padding: EdgeInsets.only(right: 15, left: 15, top: 15),
                  shape: StadiumBorder(),
                ),
              )
            ]
        ),
      ),
    );
  }

  void goBack() {
    Navigator.pop(context);
  }

  void increament() {
    counter ++;
    if(counter == 33)
    {
      index ++;
      index %= 3;
      counter = 0;
    }
    setState(() {
      counter;
    });
  }
}
