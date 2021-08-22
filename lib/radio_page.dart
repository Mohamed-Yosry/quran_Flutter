import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:provider/provider.dart';

import 'AppConfigProvider.dart';

class RadioChannel extends StatefulWidget {

  RadioChannel();
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RadioChannel();
  }
}

class _RadioChannel extends State< RadioChannel> {


  _RadioChannel();

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
                margin: EdgeInsets.only(right: 10,top:4,bottom: 30),
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
                      Container(margin: EdgeInsets.only(top: 60),child:  Image.asset("assets/radio_image.png")

                    )
                    ],
                  )

              ),
              Container(
                margin: EdgeInsets.only(bottom: 10,top: 4),
                child:Text(AppLocalizations.of(context)!.quranradio,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
              ),
              Container(
                  padding: EdgeInsets.only(right: 25),
                  margin: EdgeInsets.only(top: 20),child:Row(

                   children: [
                        IconButton(icon: provider.isDarkModeEnable()? Image.asset("assets/nextDark.png"): Image.asset("assets/500.png")
                          ,onPressed: () {
                    },iconSize: 110,),
                     IconButton(icon:  provider.isDarkModeEnable()? Image.asset("assets/playDark.png"):Image.asset("assets/play.png"),onPressed: () {
                     },iconSize: 110,),
                     IconButton(icon:  provider.isDarkModeEnable()? Image.asset("assets/preDark.png"):Image.asset("assets/previos.png"),onPressed: () {
                     },iconSize: 110,),
                  ],
                ))


            ]
        ),
      ),
    );
  }

  void goBack() {
    Navigator.pop(context);
  }


}
