import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'AppConfigProvider.dart';

class ahadethContent extends StatefulWidget {
  String name;
  int noHadeth;
  ahadethContent(this.name, this.noHadeth);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ahadethContent(this.name, this.noHadeth);
  }
}

class _ahadethContent extends State<ahadethContent> {
  String name;
  int noHadeth;
  String data = "";
  _ahadethContent(this.name, this.noHadeth);
  //late final List<String> items;
  fetchFileData() async{
    String resp;
    resp = await rootBundle.loadString("ahadeth/ahadeth.txt");
    List<String> items = resp.split('#');
    resp = items[noHadeth];
    setState(() {
      data = resp;
    });
  }
  late AppConfigProvider provider;
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
                margin: EdgeInsets.only(right: 10,top:25),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        goBack();
                      },
                    ),
                    Expanded(
                      child: Center(
                        child:Text(AppLocalizations.of(context)!.islamy,style: TextStyle(fontSize: 30), textAlign: TextAlign.center,),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10,top: 30),
                child:
                Text(name, style: Theme.of(context).textTheme.headline2 ,textAlign: TextAlign.center,),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: 15, left: 15, bottom: 50,top: 20),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: provider.isDarkModeEnable()?AssetImage("assets/Rectangle 3.png"):AssetImage("assets/bg2.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: SingleChildScrollView(
                      child: Container(margin:EdgeInsets.only(right: 10),
                          child: Text(data , style: Theme.of(context).textTheme.headline4, textDirection: TextDirection.rtl,))
                  ),
                ),
              ),
            ]
        ),
      ),
    );
  }

  @override
  void initState() {
    fetchFileData();
    super.initState();
  }
  void goBack() {
    Navigator.pop(context);
  }
}