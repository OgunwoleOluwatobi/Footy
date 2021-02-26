import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:footyappp/Home.dart';
import 'package:provider/provider.dart';

import 'ThemeNotifier.dart';

class More extends StatefulWidget {
  const More({Key key}) : super(key: key);
  @override
  _MoreState createState() => _MoreState();
}

class _MoreState extends State<More> {

  @override
  Widget build(BuildContext context) {

        Widget title = new Container(
        margin: EdgeInsets.only(left: 0, top: 8, bottom: 0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            /*Image.asset(
              'assets/images/logo.png',
              height: 92.0,
              width: 62.0,
              //alignment: Alignment(13, 8),
              
              ),*/
              Container(

                margin: EdgeInsets.only(left: 15, top: 10, bottom: 0),
                child: Align(
                  //alignment: Alignment(84, 51),
                  child: Text(
                    "FOOTY",
                    style: Theme.of(context).textTheme.title.copyWith(fontSize: 39.0, fontFamily: 'RobotoBlack'),
                  ),
                ),
              ),
          ],
        ),
      );

      final topAppBar = AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      brightness: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Brightness.light : Brightness.dark,
      title: title,
      leading: Image.asset('assets/images/logo.png',
              height: 92.0,
              width: 62.0, alignment: Alignment(7, 8)),
    );

    Widget _cards() {
      return Container(
        child: Center(
          child: Column(
            children: <Widget>[
              new Card(
                //color: _dark ? Colors.black38 : Colors.white,
                elevation: 0,
                margin: EdgeInsets.only(top: 20, bottom: 5),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SwitchListTile(
                    activeColor: Colors.white,
                    inactiveThumbColor: Colors.black,
                    value: Provider.of<ThemeNotifier>(context).isDarkModeOn,
                    title: Text("Dark Mode", style: TextStyle(
                      color: Provider.of<ThemeNotifier>(context).isDarkModeOn ? Colors.white : Colors.black,
                        //fontFamily: 'Montserrat',
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500
                        
                    ),),
                    onChanged: (val){
                      Provider.of<ThemeNotifier>(context).switchTheme(val);
                    }, 
                  ),
                ),
              ),
              new Card(
                elevation: 0,
                margin: EdgeInsets.only(bottom: 5, top: 5),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: <Widget>[
                      Text("Version 1.0", style:  TextStyle(fontSize: 20),),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
        //backgroundColor: _dark ? Color(0xff252F38) : Color(0xffF3F3F3),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(MediaQuery.of(context).size.height*0.07),
          child: topAppBar,
        ),
        body: new Center(
          child: _cards(),
        ),
    );
  }
}