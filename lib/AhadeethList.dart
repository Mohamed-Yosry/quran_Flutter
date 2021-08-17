import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'ahadethContent.dart';

class HadeethsList extends StatelessWidget {
  int hadeethNum=0;
  List<Hadeeth> AHadeeths=[];

  @override
  Widget build(BuildContext context) {
    for(int i=1;i<51;i++)
    {
      AHadeeths.add(new Hadeeth(AppLocalizations.of(context)!.hadeethName+" "));
    }
    return new Stack(
        children:[
          new Column(
              children: [
                new Container(
                  padding: EdgeInsets.only(top:30, bottom: 40),
                  child: new Text(AppLocalizations.of(context)!.islamy,
                    style: TextStyle(fontSize: 30, color: Colors.black), textAlign: TextAlign.center,),
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
                        new Text(AppLocalizations.of(context)!.ahadeeth_theTitle,
                          textDirection: TextDirection.rtl, style: new TextStyle(
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
