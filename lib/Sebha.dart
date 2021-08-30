import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:provider/provider.dart';

import 'AppConfigProvider.dart';

class Sebha extends StatefulWidget {

  Sebha();
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _sebha();
  }
}

class _sebha extends State<Sebha> {
  int counter = 0;
  List<String> s = ["سبحان الله","الله أكبر","الحمد لله"];
  int index = 0;
  _sebha();

  @override
  late  AppConfigProvider provider;
    @override
    Widget build(BuildContext context) {
      provider = Provider.of<AppConfigProvider>(context);

    // TODO: implement build
    return Scaffold(

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: provider.isDarkModeEnable()?AssetImage("assets/bg.png"):AssetImage("assets/bg3.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
            children:[
              Container(
                margin: EdgeInsets.only(right: 10,top:20,bottom: 30),
                child:
                  Center(
                      child:Text(AppLocalizations.of(context)!.islamy,
                        style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                    ),
              ),
              Container(
                //padding: EdgeInsets.all(0),
                child: Stack(
                  children: [
                    Container(margin: EdgeInsets.only(right: 50),child:provider.isDarkModeEnable()?Image.asset("assets/headofseb7a.png",width: 80,height:80,):Image.asset("assets/sebhaHead.png",width: 80,height:80,)),
                    Container(margin: EdgeInsets.only(top: 60),child:new RotatedBox(
                      child: IconButton(icon: provider.isDarkModeEnable()? Image.asset("assets/bodyofseb7a.png"):Image.asset("assets/sebhaBody.png"),onPressed: () {
                        increament();
                      },iconSize: 200,),
                      quarterTurns: counter,
                    ))
                  ],
                )

              ),
              Container(
                margin: EdgeInsets.only(bottom: 10,top: 4),
                child:Text(AppLocalizations.of(context)!.tasbeehCounter,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
              ),
              Container(
                decoration:BoxDecoration(
                border: Border.all(),
                   borderRadius: BorderRadius.all(Radius.circular(12)),

                    color: Theme.of(context).splashColor,
                      ),

                width: 50, height: 50,
                alignment: Alignment.center,
                margin: EdgeInsets.only(bottom: 20,top: 20),
                child:Text("$counter" ,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
              ),
        Container(
          padding: EdgeInsets.only(top: 20),
          child: RaisedButton(
                  child: Text(
                    s[index],
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  padding: EdgeInsets.only(right: 15, left: 15, top: 15),
                  shape: StadiumBorder(),
                  onPressed: (){},
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
