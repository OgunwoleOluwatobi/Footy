import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:footyappp/Home.dart';
import 'package:footyappp/views/widgets/utility_widgets.dart';
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
                color: Theme.of(context).scaffoldBackgroundColor,
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
          child: topAppBar(context),
        ),
        body: new Center(
          child: _cards(),
        ),
    );
  }
}