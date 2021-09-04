import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'AppConfigProvider.dart';

class AhadethContent extends StatefulWidget {
  String name;
  int noHadeth;
  AhadethContent(this.name, this.noHadeth);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ahadethContent(this.name, this.noHadeth);
  }
}

class _ahadethContent extends State<AhadethContent> {
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back, color: provider.isDarkModeEnable()? Colors.white:Colors.black,size: 25,), onPressed: (){goBack();},),
        title: Text(AppLocalizations.of(context)!.islamy, style: TextStyle(
          color: provider.isDarkModeEnable()? Colors.white: Colors.black,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: provider.isDarkModeEnable()?AssetImage("assets/bg.png"):AssetImage("assets/bg3.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          margin: EdgeInsets.only(right: 30, left: 30, bottom: 80,top: 85),
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fitWidth,
              image: provider.isDarkModeEnable()?AssetImage("assets/Rectangle 3.png"):AssetImage("assets/bg2.png"),
            ),
          ),
          child: Container(
            child: Column(
                children:[
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    child:
                    Text(name, style:Theme.of(context).textTheme.headline2 ,textAlign: TextAlign.center,),
                  ),
                  Container(
                    height: 1,
                    width: 270,
                    color: provider.isDarkModeEnable()? Color.fromRGBO(252,196,64,1): Color.fromRGBO(183, 147, 95, 1),
                  ),
                  Expanded(
                    child:
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: SingleChildScrollView(
                          child: Container(
                              padding: EdgeInsets.only(right: 10,bottom: 30),
                              child: Text(data , style: Theme.of(context).textTheme.headline4,textDirection: TextDirection.rtl,))
                      ),
                    ),
                  ),
                ]
            ),
          ),
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