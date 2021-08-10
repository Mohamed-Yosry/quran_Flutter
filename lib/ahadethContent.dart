import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
                        child:Text("اسلامي",style: TextStyle(fontSize: 30), textAlign: TextAlign.center,),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10,top: 30),
                child:
                Text(name, style: TextStyle(fontSize: 30, decoration: TextDecoration.underline,) ,textAlign: TextAlign.center,),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: 15, left: 15, bottom: 50,top: 20),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          "assets/bg2.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: SingleChildScrollView(
                      child: Container(margin:EdgeInsets.only(right: 10),
                          child: Text(data , style: TextStyle(fontSize: 20 ,),textDirection: TextDirection.rtl,))
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
