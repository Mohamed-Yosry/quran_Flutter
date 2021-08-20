import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_flutter/AppConfigProvider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SideMenu extends StatefulWidget {
  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {


  late AppConfigProvider provider;
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
    return  Container(

        alignment: Alignment.center,
        //padding: EdgeInsets.symmetric(vertical: 75, horizontal: 100),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Container(
               padding: EdgeInsets.only(top: 150),
               child: Card(

                    //color: Colors.transparent,
                    child:  ListTile(
                       leading: new Image(
                         color: Theme.of(context).accentColor,

                       image: new AssetImage("assets/world.png"),
                      height: 30.0,
                       width: 30.0,

               ),
                          onTap: (){

                            changeLanguage();

                          },
                         title: new Text(AppLocalizations.of(context)!.language,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )
                    )
                 ),
             ),

            Container(
              padding: EdgeInsets.only(top: 0),
              child: Card(

                //color: Colors.transparent,
                  child:  ListTile(
                      leading: new Image(
                        color: Theme.of(context).accentColor,

                        image: new AssetImage("assets/darkmode.png"),
                        height: 30.0,
                        width: 30.0,

                      ),
                      onTap: (){
                      changeTheme();
                      },

                      title: new Text(AppLocalizations.of(context)!.darkmode,
                        textAlign: TextAlign.left,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      )
                  )
              ),
            ),

          ],
        ),

    );
  }
  void changeLanguage() {

    int _value = provider.getLanguage();

    int num = 0;
    //Navigator.pop(context);
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState
                  /*You can rename this!*/) {
                return Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Text("عربي"),
                        leading: Radio(
                          value: 1,
                          groupValue: _value,
                          onChanged: (value) {
                            setState(() {
                              _value =int.parse(value.toString());
                              provider.cahngeLanguage('ar');
                            });
                          },
                          activeColor: Colors.green,
                        ),
                      ),
                      ListTile(
                        title: Text("English"),
                        leading: Radio(
                          value: 2,
                          groupValue: _value,
                          onChanged: (value) {
                            setState(() {
                              _value =int.parse(value.toString());
                              provider.cahngeLanguage('en');

                            });
                          },
                          activeColor: Colors.green,
                        ),
                      ),
                    ],
                  ),
                );
              });


        });

    if(_value==1){
      provider.cahngeLanguage('ar');
    }
    else if(_value==2){
      provider.cahngeLanguage('en');

    }
  }

  void changeTheme() {

    int _value2 = 0;

    if(provider.isDarkModeEnable()){
      _value2=1;

    }
    else{
      _value2=2;
    }
    //Navigator.pop(context);
    showModalBottomSheet(

        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState
                  /*You can rename this!*/) {
                return Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Text("on"),
                        leading: Radio(
                          value: 1,
                          groupValue: _value2,
                          onChanged: (value) {
                            setState(() {
                              _value2 =int.parse(value.toString());
                              if(!provider.isDarkModeEnable()){
                                provider.toggleTheme();
                              }         });
                          },
                          activeColor: Colors.green,
                        ),
                      ),
                      ListTile(
                        title: Text("off"),
                        leading: Radio(
                          value: 2,
                          groupValue: _value2,
                          onChanged: (value) {
                            setState(() {
                              _value2 =int.parse(value.toString());
                              if(provider.isDarkModeEnable()){
                                provider.toggleTheme();

                              }

                            });
                          },
                          activeColor: Colors.green,
                        ),
                      ),
                    ],
                  ),
                );
              });


        });
  }

}
