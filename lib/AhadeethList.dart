import 'package:flutter/material.dart';
import 'package:quran_flutter/ahadethContent.dart';

class HadeethsList extends StatelessWidget {
  int hadeethNum=0;
  List<Hadeeth> AHadeeths=[new Hadeeth('الحديث رقم'),
    new Hadeeth('الحديث رقم'),
    new Hadeeth('الحديث رقم'),
    new Hadeeth('الحديث رقم'),
    new Hadeeth('الحديث رقم'),
    new Hadeeth('الحديث رقم'),
    new Hadeeth('الحديث رقم'),
    new Hadeeth('الحديث رقم'),
    new Hadeeth('الحديث رقم'),
    new Hadeeth('الحديث رقم'),
    new Hadeeth('الحديث رقم'),
    new Hadeeth('الحديث رقم'),
    new Hadeeth('الحديث رقم'),
    new Hadeeth('الحديث رقم'),
    new Hadeeth('الحديث رقم'),
    new Hadeeth('الحديث رقم'),
    new Hadeeth('الحديث رقم'),
    new Hadeeth('الحديث رقم'),
    new Hadeeth('الحديث رقم'),
    new Hadeeth('الحديث رقم'),
    new Hadeeth('الحديث رقم'),
    new Hadeeth('الحديث رقم'),
    new Hadeeth('الحديث رقم'),
    new Hadeeth('الحديث رقم'),
    new Hadeeth('الحديث رقم'),
    new Hadeeth('الحديث رقم'),
    new Hadeeth('الحديث رقم'),
    new Hadeeth('الحديث رقم'),
    new Hadeeth('الحديث رقم'),
    new Hadeeth('الحديث رقم'),
    new Hadeeth('الحديث رقم'),
    new Hadeeth('الحديث رقم'),
    new Hadeeth('الحديث رقم'),
    new Hadeeth('الحديث رقم'),
    new Hadeeth('الحديث رقم'),
    new Hadeeth('الحديث رقم'),
    new Hadeeth('الحديث رقم'),
    new Hadeeth('الحديث رقم'),
    new Hadeeth('الحديث رقم'),
    new Hadeeth('الحديث رقم'),
    new Hadeeth('الحديث رقم'),
    new Hadeeth('الحديث رقم'),
    new Hadeeth('الحديث رقم'),
    new Hadeeth('الحديث رقم'),
    new Hadeeth('الحديث رقم'),
    new Hadeeth('الحديث رقم'),
    new Hadeeth('الحديث رقم'),
    new Hadeeth('الحديث رقم'),
    new Hadeeth('الحديث رقم'),
    new Hadeeth('الحديث رقم'),
  ];

  @override
  Widget build(BuildContext context) {
    return new Stack(
        children:[
          new Container(
            decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                "assets/2.png"),
                 fit: BoxFit.cover,
              ),
             ),
          ),
          new Column(
              children: [
                new Container(
                  padding: EdgeInsets.only(top:30, bottom: 40),
                  child: new Text("إسلامي",style: TextStyle(fontSize: 30, color: Colors.black), textAlign: TextAlign.center,),
                  alignment: Alignment.center,
                ),
                new Container(
                  height: 200.0,
                  width: 300.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                    image: AssetImage('assets/img.png'),
                    fit: BoxFit.fill,
                  ),
                 shape: BoxShape.circle,
                  ),
                ),
                new Container(
                  margin: EdgeInsets.only(top: 30),
                  height: 45,
                  //alignment: Alignment.center,
                  decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.orange, width: 2),
                      bottom: BorderSide(color: Colors.orange, width: 2))),
                  child: new Row (
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        new Text("الأحاديث",textDirection: TextDirection.rtl, style: new TextStyle(
                                  fontSize: 23, color: Colors.black,), textAlign: TextAlign.center,),
                      ],
                  )

                ),

                new Expanded(
                  child: ListView.builder(
                    itemCount: AHadeeths.length,
                    itemBuilder: (context, index){
                      hadeethNum=index+1;
                      return Card(
                        child: ListTile
                          (
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder:(BuildContext context){
                                return ahadethContent(AHadeeths[index].HadeethName+" "+(index+1).toString(), index);
                              }
                              ));

                            },
                            title: new Text(AHadeeths[index].HadeethName+' $hadeethNum',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                            )
                          )
                        );
                    },
                  )
                )
                ],
          ),
      ]

    );
  }

}

class Hadeeth
{
  final String HadeethName;
  Hadeeth(this.HadeethName);
}
