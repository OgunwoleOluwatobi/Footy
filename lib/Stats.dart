import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class Stats extends StatefulWidget {
  const Stats({Key key}) : super(key: key);
  @override
  _StatsState createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =new GlobalKey<RefreshIndicatorState>();

  final String url = "https://api-football-v1.p.rapidapi.com/v2/topscorers/524";
  List data;
  Timer timer;
  
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
        "x-rapidapi-key": "c663411911mshbe8401af4beb2e7p102e62jsnc2f7246ea6f6"
        }
    );

    print(response.body);

  if(this.mounted) {
    setState(() {
     var convertDataToJson = jsonDecode(response.body);
     data = convertDataToJson['api']['topscorers'];
     //print('Length : $data.length');
    });
  }

    return "Sucsses";
  }

  @override
  Widget build(BuildContext context) {

      var ply_uri = new AssetImage('assets/vardy.png');
      var ply_img = new Image(image: ply_uri, height: 140.0);

        Widget title = new Container(
        margin: EdgeInsets.only(left: 0, top: 8, bottom: 0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            /*Image.asset(
              'assets/logo.png',
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
                    style: Theme.of(context).textTheme.title.copyWith(fontSize: 39.0, fontFamily: 'RobotoBlack')
                  ),
                ),
              ),
          ],
        ),
      );

      final topAppBar = AppBar(
      elevation: 0,
      brightness: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Brightness.light : Brightness.dark,
      backgroundColor: Colors.transparent,
      title: title,
      leading: Image.asset('assets/logo.png',
              height: 92.0,
              width: 62.0, alignment: Alignment(7, 8)),
    );

    final maincard = GestureDetector(
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: 150.0,
                width: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                  image: DecorationImage(
                    image: AssetImage('assets/vardy.png'),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              data == null ? "" : data[0]['player_name'],
              style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black87 : Colors.white70, fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Text(
              data == null ? "" : "Goals: "+data[0]['goals']['total'].toString(),
              style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black54 : Colors.white60, fontSize: 15.0, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20.0,)
            ],
          ),
          /*Positioned(
            top: 190,
            left: 20.0,
            child: Container(
              color: Colors.green,
              padding: const EdgeInsets.all(4.0),
              child: Text(
                "Latest",
                style: TextStyle(color: Colors.white, fontSize:12.0),
              ),
            ),
          ),*/
        ],
      ),
      onTap: () {
      },
    );

    Widget _body(){
      return new Container(
        child: data == null ? new Center(child: CircularProgressIndicator(backgroundColor: Color(0xffF3F3F3), valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),),) : 
        CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 50,),
                    Padding(
                      padding: const EdgeInsets.only(left: 45.0),
                      child: Text(
                            "Stats",
                            style: TextStyle(color: Colors.grey, fontSize: 80, fontWeight: FontWeight.bold,),
                            textAlign: TextAlign.start,
                          ),
                    ),
                    SizedBox(height: 60,)
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: new Column(
                children: <Widget>[
                  new Row(
                    children: <Widget>[
                      new Expanded(
                        flex: 1,
                        child: new Column(
                            children: <Widget>[
                              
                              Card(
                                elevation: 4.0,
                                margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                                child: maincard,
                              ),
                              Text("Topscorer", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white),)
                            ],
                          ),
                        )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      //backgroundColor: Color(0xffF3F3F3),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height*0.07),
        child: topAppBar,
      ),
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: _refresh,
        child: _body(),
      ),
    );
  }

    Future<Null> _refresh() async {
    await new Future.delayed(const Duration(seconds: 2));
    var response = await http.get(
      Uri.encodeFull(url),
      headers: {
        "Accept": "application/json",
        "x-rapidapi-key": "c663411911mshbe8401af4beb2e7p102e62jsnc2f7246ea6f6"
        }
    );

    setState(() {
      print(response.body);

      setState(() {
      var convertDataToJson = jsonDecode(response.body);
      data = convertDataToJson['api']['topscorers'];
      //print('Length : $data.length');
      });

      return "Sucsses";
    });
  }
}