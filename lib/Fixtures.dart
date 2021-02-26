import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class Fixtures extends StatefulWidget {
  @override
  _FixturesState createState() => _FixturesState();
}

class _FixturesState extends State<Fixtures> {

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =new GlobalKey<RefreshIndicatorState>();

  final String url = "https://api-football-v1.p.rapidapi.com/v2/fixtures/league/524?timezone=Europe/London";
  List data;
  
  @override
  void initState() {
    super.initState();
    this.getJsonData();
  }

  Future<String> getJsonData() async {
    var response = await http.get(
      Uri.encodeFull(url),
      headers: {
        "Accept": "application/json",
        "x-rapidapi-key": "a0738fcae1mshd365df0b4191573p114144jsncc8e27163125"
        }
    );

    print(response.body);

    setState(() {
     var convertDataToJson = jsonDecode(response.body);
     data = convertDataToJson['api']['fixtures'];
     print('Length : $data.length');
    });

    return "Sucsses";
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xffF3F3F3),
      statusBarIconBrightness: Brightness.dark
      )); 

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
                    style: TextStyle(
                      color: new Color(0xff000000),
                        fontFamily: 'Montserrat',
                        fontSize: 39.0,
                        fontWeight: FontWeight.w900
                        
                    ),
                  ),
                ),
              ),
          ],
        ),
      );

      final topAppBar = AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: title,
      leading: Image.asset('assets/images/logo.png',
              height: 92.0,
              width: 62.0, alignment: Alignment(7, 8)),
    );

    Widget scoreCard(String titlehome, int scorehome, String titleaway, int scoreway, int index){
      return new Container(
            child: new Center(
              child: new Column(
                crossAxisAlignment:  CrossAxisAlignment.stretch,
                children: <Widget>[
                  new Card(
                    elevation: 3.0,
                    margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: new Row(
                        children: <Widget>[
                          Container(
                                //margin: EdgeInsets.all(10.0),
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(data[index]['homeTeam']['logo']),
                                    fit: BoxFit.contain
                                  ),
                                  
                                ),
                              ),
                              Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text(titlehome),
                              SizedBox(height: 5.0,),
                              Text(scorehome.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                            child: Text(
                              ":",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                            ),
                          ),
                           Column(
                            children: <Widget>[
                              Text(titleaway),
                              SizedBox(height: 5.0,),
                              Text(scoreway.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
                            ],
                          ),
                          Spacer(),
                          Container(
                                //margin: EdgeInsets.all(10.0),
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(data[index]['awayTeam']['logo']),
                                    fit: BoxFit.contain
                                  ),
                                  
                                ),
                              ),
                        ],
                      )
                    ),
                  ),
                ],
              ),
            ),
          );
    }
    

    Widget _maincard() {
      return new Container(
        child: data == null ? new Center(child: CircularProgressIndicator(backgroundColor: Color(0xffF3F3F3), valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),),) : 
        CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 40,),
                    Padding(
                      padding: const EdgeInsets.only(left: 35.0),
                      child: Text(
                        "Livescores",
                        style: TextStyle(color: Colors.grey, fontSize: 65, fontWeight: FontWeight.bold,),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(height: 40,)
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => scoreCard(data[index]['homeTeam']['team_name'], data[index]['goalsHomeTeam'], data[index]['awayTeam']['team_name'], data[index]['goalsAwayTeam'], index),
                childCount: data.length
              ),
            )
          ],
        )
      );
    }

    return Scaffold(
      backgroundColor: Color(0xffF3F3F3),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: topAppBar,
      ),
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: _refresh,
        child: _maincard(),
      ),
    );
  }

  Future<Null> _refresh() async {
    await new Future.delayed(const Duration(seconds: 2));
    data.clear();
    var response = await http.get(
          Uri.encodeFull(url),
          headers: {
            "Accept": "application/json",
            "x-rapidapi-key": "a0738fcae1mshd365df0b4191573p114144jsncc8e27163125"
            }
        );
    setState(() {

        print(response.body);

        setState(() {
        var convertDataToJson = jsonDecode(response.body);
        data = convertDataToJson['api']['fixtures'];
        print('Length : $data.length');
        });

        return "Sucsses";
    });
  }
}