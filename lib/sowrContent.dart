import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'AppConfigProvider.dart';

class sowerContent extends StatefulWidget {
  String name;
  String path;

  sowerContent(this.name,this.path);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _sowerContent(this.name,this.path);
  }
}

class _sowerContent extends State<sowerContent> {
  String name;
  String path;
  String data = "";
  _sowerContent(this.name, this.path);

  fetchFileData() async{
    String resp;
    resp = await rootBundle.loadString(path);
    List<String> items = resp.split('\n');
    resp = "";
    for (int i = 0; i < items.length; i++ ){
      if(items[i].length > 1 || items[i] == "ص ") {
        resp += items[i];
        resp += "(";
        resp += (i + 1).toString();
        resp += ")";
      }
    }
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
                Text("سورة " + name, style:Theme.of(context).textTheme.headline2 ,textAlign: TextAlign.center,),
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
                          child: Text(data , style: Theme.of(context).textTheme.bodyText1,textDirection: TextDirection.rtl,))
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
