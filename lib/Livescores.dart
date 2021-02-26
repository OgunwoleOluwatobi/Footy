import 'dart:async';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:footyappp/Cards.dart';
import 'package:footyappp/GoalCheck.dart';
import 'package:footyappp/LineupHome.dart';
import 'package:footyappp/Live.dart';
import 'package:footyappp/LiveEvents.dart';
import 'package:footyappp/Scores.dart';
import 'package:footyappp/Standing.dart';
import 'package:http/http.dart' as http;
import 'package:palette_generator/palette_generator.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

import 'CardL.dart';
import 'GoalCheckL.dart';
import 'LineupAway.dart';

class Livescores extends StatefulWidget {
  const Livescores({Key key}) : super(key: key);
  //DropDown() : super();
  @override
  _LivescoresState createState() => _LivescoresState();
}

class Leagues {
  int id;
  String name;

  Leagues(this.id, this.name);

  static List<Leagues> getLeagues() {
    return <Leagues>[
      Leagues(524, 'PL'),
      Leagues(775, 'La Liga'),
      Leagues(891, 'Serie A'),
      Leagues(754, 'Bundesliga'),
      Leagues(525, 'Ligue 1'),
      Leagues(530, 'UCL'),
      Leagues(514, 'UEL'),
    ];
  }
}

class _LivescoresState extends State<Livescores> with SingleTickerProviderStateMixin {

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =new GlobalKey<RefreshIndicatorState>();
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final db = Firestore.instance;
  List<Leagues> _leagues = Leagues.getLeagues();
  List<DropdownMenuItem<Leagues>> _dropdownMenuItems;
  Leagues _selectedLeague;
  Animation<double> animation;
  AnimationController controller;
  

  //final String url = "https://api-football-v1.p.rapidapi.com/v2/fixtures/league/524?timezone=Europe/London";
  final String urli = "https://api-football-v1.p.rapidapi.com/v2/fixtures/live/524-775-891-525-530-514-754-899-780-1326-1063?timezone=Europe/London"; //524-Prem, 775-Laliga, 514-Europa, 530-Champs, 891-seriea, ligue 1-525, 752-Bundesliga
  //var urlie = "https://api-football-v1.p.rapidapi.com/v2/leagues/league/$urlid";
  //final String urls = "https://api-football-v1.p.rapidapi.com/v2/leagueTable/524";
  int urlid;
  List data, datar, datta, dattta, datttta, liveevents;
  int dat;
  int round = 0;
  int rounds = 0;
  int roundn = 0;
  int roundsfirst = 0;
  String leag;
  bool _visi = false;
  double opa = 0.0;
  Map<dynamic, dynamic> _data;
  Timer timer;
  List firstround = [];
  List scndround = [];
  List firstrounds = [];
  List scndrounds = [];
  List ucluelround =[];
  List ucluelrounds =[];
  List<Standing> standlist = [];
  List<Scores> scoreList = [];
  List<Scores> scoreListr = [];
  List<Live> liveList = [];
  List<LiveEvents> liveEventList = [];
  
  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: Duration(seconds: 1), vsync: this);
    final CurvedAnimation curve = CurvedAnimation(parent: controller, curve: Curves.ease);
    animation = Tween(begin: 1.0, end: 0.2).animate(curve);
    animation.addStatusListener((status) {
      if(status == AnimationStatus.completed)
      controller.reverse();
      else if(status == AnimationStatus.dismissed) controller.forward();
    });
    controller.forward();
    _dropdownMenuItems = buildDropdownMenuItems(_leagues);
    _selectedLeague = _dropdownMenuItems[0].value;
    urlid = _selectedLeague.id;
    _configureFirebaseListeners();
    this.getJsonData();
    this.getLiveJsonData();
    timer = Timer.periodic(Duration(seconds: 90), (Timer t) => this.getLiveJsonData());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  _configureFirebaseListeners(){
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print('onMessage: $message');
      },
      onLaunch: (Map<String, dynamic> message) async {
        print('onMessage: $message');
      },
      onResume: (Map<String, dynamic> message) async {
        print('onMessage: $message');
      }
    );
  }

  List<DropdownMenuItem<Leagues>> buildDropdownMenuItems(List leagues) {
    List <DropdownMenuItem<Leagues>> items = List();
    for (Leagues league in leagues) {
      items.add(
        DropdownMenuItem(
          value: league,
          child: Text(league.name,)
        ),
      );
    }
    return items;
  }

  Future<void> _generatePalette(context, String imgpath, String imagepath, int index, List kite) async {
    PaletteGenerator _paletteGenerator = await PaletteGenerator.fromImageProvider(
      NetworkImage(imgpath),
      size: Size(110, 150),
      maximumColorCount: 20
    );
    PaletteGenerator _paletteGeneratorOne = await PaletteGenerator.fromImageProvider(
      NetworkImage(imagepath),
      size: Size(110, 150),
      maximumColorCount: 20
    );

    Navigator.push(context, MaterialPageRoute(builder: (context) => LiveDetails(lived: liveList[index], dattae: kite, palette: _paletteGenerator, paletteOne: _paletteGeneratorOne)));
  }

  Future<void> _generatePaletteOne(context, String imgpath, String imagepath, int index) async {
    PaletteGenerator _paletteGenerator = await PaletteGenerator.fromImageProvider(
      NetworkImage(imgpath),
      size: Size(50, 50),
      maximumColorCount: 20
    );
    PaletteGenerator _paletteGeneratorOne = await PaletteGenerator.fromImageProvider(
      NetworkImage(imagepath),
      size: Size(50, 50),
      maximumColorCount: 20,
      //filters: <PaletteFilter>[avoidRedBlackWhitePaletteFilter]
    );

    Navigator.push(context, MaterialPageRoute(builder: (context) => Details(passed: scoreList[index], livee: liveEventList, palette: _paletteGenerator, paletteOne: _paletteGeneratorOne)));
  }

  Future<void> _generatePaletteOner(context, String imgpath, String imagepath, int index) async {
    PaletteGenerator _paletteGenerator = await PaletteGenerator.fromImageProvider(
      NetworkImage(imgpath),
      size: Size(50, 50),
      maximumColorCount: 20
    );
    PaletteGenerator _paletteGeneratorOne = await PaletteGenerator.fromImageProvider(
      NetworkImage(imagepath),
      size: Size(50, 50),
      maximumColorCount: 20,
      //filters: <PaletteFilter>[avoidRedBlackWhitePaletteFilter]
    );

    Navigator.push(context, MaterialPageRoute(builder: (context) => Details(passed: scoreListr[index], livee: liveEventList, palette: _paletteGenerator, paletteOne: _paletteGeneratorOne)));
  }

 

  onChangedDropdownItem(Leagues selectedLeagues) {
    setState(() {
      urlid = selectedLeagues.id;
      _selectedLeague = selectedLeagues;
      _refresh();
      
    });
  }

  Future<String> getJsonData() async {
    var response = await http.get(
      Uri.encodeFull('https://api-football-v1.p.rapidapi.com/v2/fixtures/league/$urlid?timezone=Europe/London'),
      headers: {
        "Accept": "application/json",
        "x-rapidapi-key": "YOUR-API-KEY"
        }
    );

    var responses = await http.get(
      Uri.encodeFull('https://api-football-v1.p.rapidapi.com/v2/leagueTable/$urlid'),
      headers: {
        "Accept": "application/json",
        "x-rapidapi-key": "YOUR-API-KEY"
        }
    );

    var restwo = await http.get(
      Uri.encodeFull('https://api-football-v1.p.rapidapi.com/v2/leagues/league/$urlid'),
      headers: {
        "Accept": "application/json",
        "x-rapidapi-key": "YOUR-API-KEY"
        }
    );

    print(response.body);
    print(responses.body);
    //print(resone.body);
    print(restwo.body);

    if(this.mounted) {
      setState(() {
      _data = jsonDecode(response.body);
      print("This id the data......$_data");
      //var convertDataToJsonone = jsonDecode(resone.body);
      var convertDataToJsontwo = jsonDecode(restwo.body);
      var convertDataToJsonthree = jsonDecode(responses.body);
      data = _data['api']['fixtures'];
      datar = data.reversed.toList();
      Scores scores;
      Scores scoresr;
      //data.forEach((dat) =>
      for (var i = 0; i < data.length; i++) {
        if(data[i]['goalsHomeTeam'] == null && data[i]['goalsAwayTeam'] == null) {
          if (data[i]['league']['name'] == 'Champions League' || data[i]['league']['name'] == 'Europa League') {
            if (ucluelround.length == 0) {
              ucluelround.add(data[i]['round']);
              leag = data[i]['league']['name'];
            }else {
              if(ucluelround[ucluelround.length - 1] != data[i]['round']) {
                ucluelround.add(data[i]['round']);
              }
            }
            rounds = ucluelround.length;
          }else{
            var ronds = data[i]['round'];
            var rondSplits = ronds.split(" ");
            rounds = int.parse(rondSplits[3]);
            print("SSSSSSSSSSSSSS $rounds");
            if(roundsfirst == 0){
              roundsfirst = int.parse(rondSplits[3]);
            }
          }
        }
        var halft = data[i]['score']['halftime'];
        var half = halft == null ? ['0', '0'] : halft.split("-");
        scores = new Scores(_data['api']['fixtures'][i]['fixture_id'], _data['api']['fixtures'][i]['homeTeam']['team_id'], _data['api']['fixtures'][i]['awayTeam']['team_id'], _data['api']['fixtures'][i]['league']['name'],_data['api']['fixtures'][i]['league']['logo'], _data['api']['fixtures'][i]['homeTeam']['team_name'], _data['api']['fixtures'][i]['awayTeam']['team_name'], _data['api']['fixtures'][i]['homeTeam']['logo'], _data['api']['fixtures'][i]['awayTeam']['logo'], _data['api']['fixtures'][i]['goalsHomeTeam'], _data['api']['fixtures'][i]['goalsAwayTeam'], _data['api']['fixtures'][i]['elapsed'], int.parse(half[0]), int.parse(half[1]));
        scoreList.add(scores);
      }

      for (var i = 0; i < datar.length; i++) {
        if(datar[i]['goalsHomeTeam'] != null && datar[i]['goalsAwayTeam'] != null) {
          if (datar[i]['league']['name'] == 'Champions League' || datar[i]['league']['name'] == 'Europa League') {
            if (ucluelround.length == 0) {
              ucluelrounds.add(data[i]['round']);
            }else {
              if(ucluelround[ucluelround.length - 1] != data[i]['round']) {
                ucluelrounds.add(data[i]['round']);
              }
            }
            round =ucluelrounds.length;
          }else{
            var rond = datar[i]['round'];
            var rondSplit = rond.split(" ");
            if(round == 0){
              round = int.parse(rondSplit[3]);
              print("RRRRRRRRRRRRRRR $round");
            }
          }
        }
        var halft = datar[i]['score']['halftime'];
        var half = halft == null ? ['0', '0'] : halft.split("-");
        scoresr = new Scores(datar[i]['fixture_id'],datar[i]['homeTeam']['team_id'], datar[i]['awayTeam']['team_id'], datar[i]['league']['name'],datar[i]['league']['logo'], datar[i]['homeTeam']['team_name'], datar[i]['awayTeam']['team_name'], datar[i]['homeTeam']['logo'], datar[i]['awayTeam']['logo'], datar[i]['goalsHomeTeam'], datar[i]['goalsAwayTeam'], datar[i]['elapsed'], int.parse(half[0]), int.parse(half[1]));
        scoreListr.add(scoresr);
      }

      for (var m = roundsfirst; m <= rounds; m++) {
        firstrounds.clear();
        for (var j = 0; j < datar.length; j++) {
          if (data[j]['league']['name'] == 'Champions League' || data[j]['league']['name'] == 'Europa League') {
            if(data[j]['goalsHomeTeam'] == null && data[j]['goalsAwayTeam'] == null && data[j]['round'] == ucluelround[m]) {
                firstrounds.add(data[j]['goalsAwayTeam']);
              }
          }else {
            if(data[j]['goalsHomeTeam'] == null && data[j]['goalsAwayTeam'] == null && data[j]['round'] == "Regular Season - $m") {
              print(roundsNo(m));
              firstrounds.add(data[j]['goalsAwayTeam']);
            }
          }
        }
        print(firstrounds);
        scndrounds.add(firstrounds.length);
      }
      print(scndrounds);

      for (var m = 0; m < round; m++) {
        firstround.clear();
        for (var j = 0; j < datar.length; j++) {
          if (data[j]['league']['name'] == 'Champions League' || data[j]['league']['name'] == 'Europa League') {
            if(datar[j]['goalsHomeTeam'] != null && datar[j]['goalsAwayTeam'] != null && datar[j]['round'] == ucluelrounds[m]) {
                firstround.add(datar[j]['goalsAwayTeam']);
              }
          }else {
            if(datar[j]['goalsHomeTeam'] != null && datar[j]['goalsAwayTeam'] != null && datar[j]['round'] == "Regular Season - ${roundNo(m)}") {
              print(roundNo(m));
              firstround.add(datar[j]['goalsAwayTeam']);
            }
          }
        }
        print(firstround);
        scndround.add(firstround.length);
      }
      print(scndround);
        
      //);
      
      print("data****************: $data");
      datttta = convertDataToJsonthree['api']['standings'][0];
      print('###############: $datttta.length');
      /*Standing stand = new Standing(convertDataToJsonthree['api']['standings']['rank'], convertDataToJsonthree['api']['standings']['teamName'], convertDataToJsonthree['api']['standings']['all']['win'], convertDataToJsonthree['api']['standings']['all']['draw'], convertDataToJsonthree['api']['standings']['all']['lose'], convertDataToJsonthree['api']['standings']['points'], convertDataToJsonthree['api']['standings']['logo']);
      print(stand);
      standlist.add(stand);*/
      //datta = convertDataToJsonone['api']['fixtures'];
      dattta = convertDataToJsontwo['api']['leagues'];
      //print('Length : $data.length');
      });
    }

    return "Sucsses";
  }
  int roundNo(int id) {
      return round - id;
  }

  int roundsNo(int id) {
      return roundsfirst + id;
  }

  Future<String> getLiveJsonData() async {
    //liveList.clear();
    var resone = await http.get(
      Uri.encodeFull(urli),
      headers: {
        "Accept": "application/json",
        "x-rapidapi-key": "YOUR-API-KEY"
        }
    );
    print(resone.body);
    if(this.mounted) {
      setState(() {
      var convertDataToJsonone = jsonDecode(resone.body);
      dat = convertDataToJsonone['api']['results'];
      datta = convertDataToJsonone['api']['fixtures'];

      Live live;
      liveList.clear();
      //data.forEach((dat) =>
      for (var i = 0; i < datta.length; i++) {
        live = new Live(datta[i]['league']['name'],datta[i]['league']['logo'], datta[i]['homeTeam']['team_name'], datta[i]['awayTeam']['team_name'], datta[i]['homeTeam']['logo'],datta[i]['awayTeam']['logo'], datta[i]['goalsHomeTeam'], datta[i]['goalsAwayTeam'], datta[i]['elapsed'], datta[i]['status'], datta[i]['homeTeam']['team_id'], datta[i]['awayTeam']['team_id'], datta[i]['fixture_id']);
        liveList.add(live);
      }

      var scores = db.collection('LiveScores');

      Future <List <DocumentSnapshot>> list(int times) async {
        var coll = await db.collection('LiveScores').where('timestamp', isEqualTo: times).getDocuments();
        
        var collt = coll.documents;
        print(collt);
        return collt;
      }
      for (var i = 0; i < datta.length; i++) {

        int time = datta[i]['event_timestamp'];
        print('[[[[[[[[[[[: $list(time)');
        list(time).then((value) async {
          if (value.isEmpty) {
            print('Empty*******************');
            await scores.add({
            'timestamp': datta[i]['event_timestamp'],
            'team1n': datta[i]['homeTeam']['team_name'],
            'team2n': datta[i]['awayTeam']['team_name'],
            'team1': datta[i]['goalsHomeTeam'],
            'team2': datta[i]['goalsAwayTeam'],
            'team1id': datta[i]['homeTeam']['team_id'],
            'team2id': datta[i]['awayTeam']['team_id'],
            'index': i,
            'timescored': 0,
            'scorer': "",
            'assist': "",
            'scorerteamid': null,
            });
          }
          if(value.isNotEmpty){
            print('Not Empty*******************');
            
            value.forEach((val) async => 
              val['team1'] != datta[i]['goalsHomeTeam'] && val['team1n'] == datta[i]['homeTeam']['team_name'] ? await scores.document(val.documentID).updateData({
                'team1': datta[i]['goalsHomeTeam'],
                'scorer': ""
                }) : val['team2'] != datta[i]['goalsAwayTeam'] && val['team2n'] == datta[i]['awayTeam']['team_name'] ? await scores.document(val.documentID).updateData({
                  'team2': datta[i]['goalsAwayTeam'],
                  'scorer': ""
                  }) : val['team1'] == datta[i]['goalsHomeTeam'] && val['team1n'] == datta[i]['homeTeam']['team_name'] && val['team2'] == datta[i]['goalsAwayTeam'] && val['team2n'] == datta[i]['awayTeam']['team_name'] && datta[i]['statusShort'] == "FT" ? await scores.document(val.documentID).delete() : print(val['team1n']),
            );
            List events = datta[i]['events'];
            for (var j = 0; j < events.length; j++) {
              value.forEach((val) async =>
                events[j]['type'] == 'Goal' ? val['scorer'] == "" &&   val['team1n'] == datta[i]['homeTeam']['team_name'] && events[j]['elapsed'] > val['timescored'] ? await scores.document(val.documentID).updateData({
                  'timescored': events[j]['elapsed'],
                  'scorer': events[j]['player'],
                  'assist': events[j]['assist'],
                  'scorerteamid': events[j]['team_id']
                }) : null : null,
              );
            }


          }
        });
        
      }
      //print('Length : $data.length');
      });
    }

    return "Sucsses";
  } 

  int _cIndex = 0;
  void _incrementTab(index) {
    setState(() {
      _cIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    //var logoUri = new AssetImage('assets/images/small.png');
     //var logoImage = new Image(image: logoUri);
     

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

                margin: EdgeInsets.only(left: 8, top: 10, bottom: 0),
                child: Align(
                  //alignment: Alignment(84, 51),
                  child: Text(
                    "FOOTY",
                    style: Theme.of(context).textTheme.title.copyWith(fontSize: 35.0, fontFamily: 'RobotoBlack')
                  ),
                ),
              ),
              SizedBox(width: 50,),
                  Padding(
                    padding: EdgeInsets.only(bottom: 3),
                    child: Row(
                      children: <Widget>[
                        Container(
                        width: 50,
                        height: 40,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: dattta == null ? AssetImage('assets/images/fill.png') : dattta[0]['name'] == 'Premier League' ? Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? AssetImage('assets/images/prem_black.png') : AssetImage('assets/images/permier_white.png') : dattta[0]['name'] == 'Champions League' ? Theme.of(context).scaffoldBackgroundColor != Color(0xffF3F3F3) ? AssetImage('assets/images/ucl_white.png') : NetworkImage(dattta[0]['logo']) :  NetworkImage(dattta[0]['logo']),//NetworkImage(dattta[0]['logo']),
                              fit: BoxFit.contain
                            ),
                          )
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 3, left: 5),
                          child: DropdownButton(
                            underline: SizedBox(),
                            value: _selectedLeague,
                            items: _dropdownMenuItems,
                            //focusColor: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,
                            onChanged: onChangedDropdownItem,
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white)
                            ),
                        ),
                      ],
                    ),),
          ],
        ),
      );

      final topAppBar = AppBar(
      elevation: 0,
      brightness: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Brightness.light : Brightness.dark,
      backgroundColor: Colors.transparent,
      title: title,
      leading: Image.asset('assets/images/logo.png', height: 90.0, width: 60.0, alignment: Alignment(5, 8)),
    );

    Widget resultCard(String titlehome, int scorehome, String titleaway, int scoreway, int time, int index, List letv){
      return scorehome != null && scoreway != null ? new GestureDetector(
      child: Container(
            child: new Center(
              child: new Column(
                crossAxisAlignment:  CrossAxisAlignment.stretch,
                children: <Widget>[
                  new Card(
                    elevation: 2.0,
                    margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: new Row(
                          children: <Widget>[
                            Container(
                                  //margin: EdgeInsets.all(10.0),
                                  width: 40,
                                  height:40,
                                  child: Image.network(datar[index]['homeTeam']['logo'], fit: BoxFit.contain,),
                                ),
                                Spacer(),
                            Container(
                              width: 120,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Center(child: Container(width: 120, child: Text(titlehome, style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white, fontSize: 16, fontWeight: FontWeight.w500), textAlign: TextAlign.center,))),
                                  SizedBox(height: 5.0,),
                                  scorehome == null ? Text(" ") : Container(
                                    width: 100,
                                    child: Text(scorehome.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20.0, left: 5.0, right: 5.0),
                              child: Text(
                                ":",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white, ),
                              ),
                            ),
                             Container(
                               width: 120,
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(children: <Widget>[
                                    Container(width: 120,child: Text(titleaway, style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white, fontSize: 16, fontWeight: FontWeight.w500), textAlign: TextAlign.center,)),
                                  SizedBox(width: 0,),
                                  //time == 0 ? Text('') : Text(time.toString()+'\'', style: TextStyle(color: Colors.grey),),
                                  ],),
                                  SizedBox(height: 5.0,),
                                  scoreway == null ? Text(" ") : Container(
                                    width: 100,
                                    child: Text(scoreway.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                                ],
                            ),
                             ),
                            Spacer(),
                            Container(
                                  //margin: EdgeInsets.all(10.0),
                                  width: 40,
                                  height: 40,
                                  child: Image.network(datar[index]['awayTeam']['logo'], fit: BoxFit.contain,),
                                ),
                          ],
                        )
                      ),
                      
                  ),
                ],
              ),
            ),
          ),
          onTap: (){
            _generatePaletteOner(context, scoreListr[index].img, scoreListr[index].image, index);
          },
        ) : SizedBox(height: 0,);
    }

    Widget scoreCard(String titlehome, int scorehome, String titleaway, int scoreway, int time, int index, List letv){
      return scorehome == null && scoreway == null ? new GestureDetector(
      child: Container(
            child: new Center(
              child: new Column(
                crossAxisAlignment:  CrossAxisAlignment.stretch,
                children: <Widget>[
                  new Card(
                    elevation: 2.0,
                    margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: new Row(
                          children: <Widget>[
                            Container(
                                  //margin: EdgeInsets.all(10.0),
                                  width: 40,
                                  height:40,
                                  child: Image.network(data[index]['homeTeam']['logo'], fit: BoxFit.contain,),
                                ),
                                Spacer(),
                            Container(
                              width: 120,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Center(child: Container(width: 120, child: Text(titlehome, style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white, fontSize: 16, fontWeight: FontWeight.w500), textAlign: TextAlign.center,))),
                                  SizedBox(height: 5.0,),
                                  scorehome == null ? Text(" ") : Container(
                                    width: 100,
                                    child: Text(scorehome.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20.0, left: 5.0, right: 5.0),
                              child: Text(
                                ":",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white, ),
                              ),
                            ),
                             Container(
                               width: 120,
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(children: <Widget>[
                                    Container(width: 120,child: Text(titleaway, style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white, fontSize: 16, fontWeight: FontWeight.w500), textAlign: TextAlign.center,)),
                                  SizedBox(width: 0,),
                                  //time == 0 ? Text('') : Text(time.toString()+'\'', style: TextStyle(color: Colors.grey),),
                                  ],),
                                  SizedBox(height: 5.0,),
                                  scoreway == null ? Text(" ") : Container(
                                    width: 100,
                                    child: Text(scoreway.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                                ],
                            ),
                             ),
                            Spacer(),
                            Container(
                                  //margin: EdgeInsets.all(10.0),
                                  width: 40,
                                  height: 40,
                                  child: Image.network(data[index]['awayTeam']['logo'], fit: BoxFit.contain,),
                                ),
                          ],
                        )
                      ),
                      
                  ),
                ],
              ),
            ),
          ),
          onTap: (){
            _generatePaletteOne(context, scoreList[index].img, scoreList[index].image, index);
          },
        ) : SizedBox(height: 0,);
    }

    Widget liveCard(String titlehome, int scorehome, String titleaway, int scoreway, int time, int inum, List kite){
      return new GestureDetector(
      child: Container(
            child: new Center(
              child: new Column(
                crossAxisAlignment:  CrossAxisAlignment.stretch,
                children: <Widget>[
                  new Card(
                    elevation: 2.0,
                    margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: new Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                      //margin: EdgeInsets.all(10.0),
                                      width: 40,
                                      height: 40,
                                      child: Image.network(datta[inum]['homeTeam']['logo'], fit: BoxFit.contain,),
                                    ),
                                    //Spacer(),
                                    SizedBox(width: 15,),
                                Container(
                                  width: 110,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Container(width: 110, child: Text(titlehome, style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white, fontSize: 16, fontWeight: FontWeight.w500), textAlign: TextAlign.center,)),
                                      SizedBox(height: 5.0,),
                                      scorehome == null ? Text(" ") : Container(
                                        width: 100,
                                        child: Text(scorehome.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 20.0, left: 1.0, right: 1.0),
                                  child: Text(
                                    ":",
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white),
                                  ),
                                ),
                                Container(
                                  width: 142,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                        Container(width: 110,child: Text(titleaway, style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white, fontSize: 16, fontWeight: FontWeight.w500), textAlign: TextAlign.center,)),
                                      SizedBox(width: 2.0,),
                                      time == 0 ? Text('') : Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            width: 30,
                                            child: 
                                            Text(time.toString()+'\'', style: TextStyle(color: Colors.lightGreen), textAlign: TextAlign.center,),
                                          ),
                                          SizedBox(height: 5,),
                                          FadeTransition(
                                            opacity: animation,
                                            child: Container(
                                              width: 20,
                                              child: Icon(FontAwesomeIcons.solidCircle, size: 6.0, color: Colors.lightGreen,)
                                            ),
                                          ),
                                        ],
                                      ),
                                      ],),
                                      SizedBox(height: 5.0,),
                                      scoreway == null ? Text(" ") : Container(
                                        width: 100,
                                        child: Container(width: 100, child: Text(scoreway.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,))),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 10,),
                                //Spacer(),
                                Container(
                                      //margin: EdgeInsets.all(10.0),
                                      width: 40,
                                      height: 40,
                                      child: Image.network(datta[inum]['awayTeam']['logo'], fit: BoxFit.contain,),
                                    ),
                                    //events = datta[inum]['events'],
                                
                              ],
                            )
                            //Row(
                              //children: <Widget>[
                                //events = datta[inum]['events'],
                                //Container(
                                  //child: Text(events.toString()),
                                //),
                                /*ListView.builder(
                                  key: new Key(inum.toString()),
                                  itemCount: datta[inum]['events'].length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.only(top: 5, bottom: 5),
                                      child: datta[inum]['events'][index]['team_id']==datta[inum]['homeTeam']['team_id'] ? 
                                      datta[inum]['events'][index]['type'] == 'Goal' ? 
                                      Row(
                                        children: <Widget>[
                                          Column(
                                            children: <Widget>[
                                              Text("Goal: "+ datta[inum]['events'][index]['player']),
                                              Text("Assist: "+ datta[inum]['events'][index]['assist']),
                                              ],
                                              ), 
                                              SizedBox(width: 10,), 
                                              Text(datta[inum]['events'][index]['elapsed'])
                                              ],
                                              ) : 
                                              Row(
                                                children: <Widget>[
                                                  Text(datta[inum]['events'][index]['type']+ ": "+ datta[inum]['events'][index]['player']),
                                                  SizedBox(width: 10,), 
                                                  Text(datta[inum]['events'][index]['elapsed'])
                                                ],
                                              ) : 
                                              datta[inum]['events'][index]['type'] == 'Goal' ? 
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                children: <Widget>[
                                                  //SizedBox(width: 150,), 
                                                  Column(
                                                  children: <Widget>[
                                                    Text("Goal: "+ datta[inum]['events'][index]['player']),
                                                    Text("Assist: "+ datta[inum]['events'][index]['assist']),
                                                  ],
                                                  ), 
                                                    SizedBox(width: 10,), 
                                                    Text(datta[inum]['events'][index]['elapsed'])
                                                  ]
                                                  ) : 
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                    children: <Widget>[
                                                      //SizedBox(width: 150,), 
                                                      Text(datta[inum]['events'][index]['type']+ ": "+ datta[inum]['events'][index]['player']),
                                                      SizedBox(width: 10,), 
                                                      Text(datta[inum]['events'][index]['elapsed'])
                                                    ]
                                                  ),
                                      
                                    );
                                  },
                                )*/
                              //],
                            //)
                          ],
                        ),
                      ),
                      
                  ),
                ],
              ),
            ),
          ),
          onTap: (){
            //liveevents = data[inum]['events'];
            /*for (var i = 0; i < liveevents.length; i++) {
              LiveEvents levt = new LiveEvents(liveevents[i]['elapsed'], liveevents[i]['teamName'], liveevents[i]['player'], liveevents[i]['assist'], liveevents[i]['type'], liveevents[i]['detail']);
              liveEventList.add(levt); 
            }*/
            _generatePalette(context, liveList[inum].img, liveList[inum].image, inum, kite);
            
          },
        );
    }

    Widget bodyTable(int no, String name, int mp, int win, int draw, int lose, int points, String image, int gf, int ga) {
      return new Container(
        //color: Colors.white24,
        child: new Center(
          child: new Column(
            crossAxisAlignment:  CrossAxisAlignment.stretch,
                children: <Widget>[
                  new Card(
                    //color: Colors.white24,
                    elevation: 0,
                    margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
                    child: Padding(
                      padding: const EdgeInsets.only(left:0.0, top: 0, bottom: 3.0),
                      child: no == datttta.length ? Container(
                        margin: EdgeInsets.only(bottom: 5),
                        child: Row(
                              //mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                no == 1 || no ==2 || no == 3 ? Container(
                                  margin: EdgeInsets.only(right: 11, top: 0),
                                  width: 5,
                                  height: 30,
                                  color: Colors.green,
                                ) : no == 4 ? Container(
                                  margin: EdgeInsets.only(right: 11, top: 0),
                                  width: 5,
                                  height: 30,
                                  color: Color(0xffFA7B17),
                                ) : no == datttta.length-2 || no == datttta.length-1 || no == datttta.length ? Container(
                                  margin: EdgeInsets.only(right: 11, top: 0),
                                  width: 5,
                                  height: 30,
                                  color: Colors.red,
                                ) : Container(margin: EdgeInsets.only(right: 16, top: 0,), height: 30,),
                                Container(width: 15,child: Text(no.toString(), style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white),)),
                                SizedBox(width: 10),
                                Container(
                                  margin: EdgeInsets.only(right: 10.0),
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(image),
                                      fit: BoxFit.contain
                                    ),
                                    
                                  ),
                                ),
                                Container(width: 120,child: name == null ? Text("") : Container(width: 120.0, child: Text(name, style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white),))),
                                SizedBox(width: 23),
                                Container(width: 15,child: mp == null ? Text("") : Text(mp.toString(), style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black54 : Colors.white70), textAlign: TextAlign.center)),
                                SizedBox(width: 16),
                                Container(width: 15,child: win == null ? Text("") : Text(win.toString(), style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black54 : Colors.white70), textAlign: TextAlign.center)),
                                SizedBox(width: 16),
                                Container(width: 15,child: draw == null ? Text("") : Text(draw.toString(), style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black54 : Colors.white70), textAlign: TextAlign.center)),
                                SizedBox(width: 18),
                                Container(width: 15,child: lose == null ? Text("") : Text(lose.toString(), style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black54 : Colors.white70), textAlign: TextAlign.center)),
                                SizedBox(width: 16),
                                Container(width: 20,child: points == null ? Text("") : Text(points.toString(), style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black54 : Colors.white70), textAlign: TextAlign.center,)),
                                SizedBox(width: 16),
                                Container(width: 20,child: gf == null || ga ==null ? Text("") : Text((gf-ga).toString(), style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black54 : Colors.white70), textAlign: TextAlign.center,)),
                              ]
                            ),
                      ) : new Column(
                        children: <Widget>[
                          Row(
                            //mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              no == 1 || no ==2 || no == 3 ? Container(
                                margin: EdgeInsets.only(right: 11, top: 0),
                                width: 5,
                                height: 30,
                                color: Colors.green,
                              ) : no == 4 ? Container(
                                margin: EdgeInsets.only(right: 11, top: 0),
                                width: 5,
                                height: 30,
                                color: Color(0xffFA7B17),
                              ) : no == datttta.length-2 || no == datttta.length-1 || no == datttta.length ? Container(
                                margin: EdgeInsets.only(right: 11, top: 0),
                                width: 5,
                                height: 30,
                                color: Colors.red,
                              ) : Container(margin: EdgeInsets.only(right: 16, top: 0,), height: 30,),
                              Container(width: 15,child: Text(no.toString(), style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white),)),
                              SizedBox(width: 10),
                              Container(
                                margin: EdgeInsets.only(right: 10.0),
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(image),
                                    fit: BoxFit.contain
                                  ),
                                  
                                ),
                              ),
                              Container(width: 120,child: name == null ? Text("") : Container(width: 120.0, child: Text(name, style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white),))),
                              SizedBox(width: 23),
                              Container(width: 15,child: mp == null ? Text("") : Text(mp.toString(), style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black54 : Colors.white70), textAlign: TextAlign.center)),
                              SizedBox(width: 16),
                              Container(width: 15,child: win == null ? Text("") : Text(win.toString(), style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black54 : Colors.white70), textAlign: TextAlign.center)),
                              SizedBox(width: 16),
                              Container(width: 15,child: draw == null ? Text("") : Text(draw.toString(), style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black54 : Colors.white70), textAlign: TextAlign.center)),
                              SizedBox(width: 18),
                              Container(width: 15,child: lose == null ? Text("") : Text(lose.toString(), style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black54 : Colors.white70), textAlign: TextAlign.center)),
                              SizedBox(width: 16),
                              Container(width: 20,child: points == null ? Text("") : Text(points.toString(), style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black54 : Colors.white70), textAlign: TextAlign.center,)),
                              SizedBox(width: 16),
                              Container(width: 20,child: gf == null || ga ==null ? Text("") : Text((gf-ga).toString(), style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black54 : Colors.white70), textAlign: TextAlign.center,)),
                            ]
                          ),
                          Divider(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black38 : Colors.white24),
                        ],
          ),
        ),
      ),
      ]
      )
      )
      );
    }
    /* Trying out Data Tables DataTable(
      columns: <DataColumn>[
        DataColumn(
          label: Text("Club"),
          numeric: true,
          onSort: (i,b) {},
        ),
        DataColumn(
          label: Text("W"),
          numeric: false,
          onSort: (i,b) {},
        ),
        DataColumn(
          label: Text("D"),
          numeric: false,
          onSort: (i,b) {},
        ),
        DataColumn(
          label: Text("L"),
          numeric: false,
          onSort: (i,b) {},
        ),
        DataColumn(
          label: Text("Club"),
          numeric: false,
          onSort: (i,b) {},
        ),
      ], 
      rows: <DataRow>[
        DataRow(cells: <DataCell>[
          DataCell(
            Text("hhdggedjhed")
          ),
          DataCell(
            Text("hhdggedjhed")
          ),
          DataCell(
            Text("hhdggedjhed")
          ),
          DataCell(
            Text("hhdggedjhed")
          ),
          DataCell(
            Text("hhdggedjhed")
          ),
        ])
      ]
    );*/

    //USe if sliver doesnt already have an array of slivers.
    /*List<Widget> _sliverList(int round, int len) {
      var widgetList = new List<Widget>();
      for (int i = round; i > 0; i--)
        widgetList
          ..add(
            SliverAppBar(
              title: Text("Gameweek $i"),
            )
          )
          ..add(
            SliverList(
              delegate: SliverChildBuilderDelegate(
               (context, index) =>
                datar[index]['round'] == "Regular Season - $i" ? resultCard(datar[index]['homeTeam']['team_name'], datar[index]['goalsHomeTeam'], datar[index]['awayTeam']['team_name'], datar[index]['goalsAwayTeam'], datar[index]['elapsed'], index, datar[index]['events']) : SizedBox(height: 0),

               childCount: len, 
              ),
            )
          );
      return widgetList;
    }*/

    

    

    Widget _maincard() {
      return new Container(
        child: _data == null ? new Center(child: CircularProgressIndicator(backgroundColor: Color(0xffF3F3F3), valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),),) : 
        CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 20,),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.only(left: 35.0),
                      child: Text(
                            _cIndex == 0 ? "Results":_cIndex == 1 ? "Fixtures" : _cIndex == 2 ? "Livescore" : "Standings",
                            style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.grey : Colors.white, fontSize: 65, fontWeight: FontWeight.bold,),
                            textAlign: TextAlign.start,
                          ),
                    ),
                    SizedBox(height: 40,)
                  ],
                ),
              ),
            ),
              SliverAppBar(
                pinned: true,
                brightness: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Brightness.light : Brightness.dark,
                floating: false,
                expandedHeight: 60,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Color(0xffF3F3F3) : Color(0xff0D141A),
                automaticallyImplyLeading: false,
                titleSpacing: 0.0,
                
                title: ToggleButtons(
                    fillColor: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.grey.shade300 : Color(0xff12233C),
                    hoverColor: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.grey.shade300 : Color(0xff12233C),
                    renderBorder: true,
                    borderColor:Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Color(0xffF3F3F3) : Color(0xff0D141A),
                    color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.grey : Colors.grey.shade300,
                    selectedColor: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width/4.06,
                        padding: EdgeInsets.fromLTRB(16.0, 14.0, 16.0,14.0),
                        child: Text("Results", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, fontFamily: 'RobotoLight', letterSpacing: 1), textAlign: TextAlign.center,),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width/4.06,
                        padding: EdgeInsets.fromLTRB(16.0, 14.0, 16.0,14.0),
                        child: Text("Fixtures", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, fontFamily: 'RobotoLight', letterSpacing: 1), textAlign: TextAlign.center,),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width/4.04,
                        padding: EdgeInsets.fromLTRB(16.0, 14.0, 16.0,14.0),
                        child: Text("Live", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, fontFamily: 'RobotoLight', letterSpacing: 1), textAlign: TextAlign.center,),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width/4.04,
                        padding: EdgeInsets.fromLTRB(16.0, 14.0, 16.0,14.0),
                        child: Text("Standings", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, fontFamily: 'RobotoLight', letterSpacing: 1), textAlign: TextAlign.center,),
                      ),
                    ],
                    isSelected: [
                      _cIndex == 0 ? true : false,
                      _cIndex == 1 ? true : false,
                      _cIndex == 2 ? true : false,
                      _cIndex == 3 ? true : false,
                    ],
                    onPressed: (index) {
                      _incrementTab(index);
                    },
                  ),
              ),

            /*SliverToBoxAdapter(
              child: ToggleButtons(
                    fillColor: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.grey.shade300 : Color(0xff12233C),
                    hoverColor: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.grey.shade300 : Color(0xff12233C),
                    renderBorder: true,
                    borderColor:Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Color(0xffF3F3F3) : Color(0xff0D141A),
                    color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.grey : Colors.grey.shade300,
                    selectedColor: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(16.0, 16.0, 32.0,16.0),
                        child: Text("Fixtures", style: Theme.of(context).textTheme.title.copyWith(fontSize: 16.0)),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(16.0, 16.0, 32.0,16.0),
                        child: Text("Live", style: Theme.of(context).textTheme.title.copyWith(fontSize: 16.0)),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(16.0, 16.0, 32.0,16.0),
                        child: Text("Standings", style: Theme.of(context).textTheme.title.copyWith(fontSize: 16.0)),
                      ),
                    ],
                    isSelected: [
                      _cIndex == 0 ? true : false,
                      _cIndex == 1 ? true : false,
                      _cIndex == 2 ? true : false,
                    ],
                    onPressed: (index) {
                      _incrementTab(index);
                    },
                  ),
            ),*/
            _cIndex == 2 ? datta == null || dat == 0 ? SliverToBoxAdapter(
              child: Container(height: MediaQuery.of(context).size.height*0.5,
                child: new Center(child: Text("No Live Match Available.", style:  TextStyle(fontSize: 30, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,) )),) : SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => 
                  datta == null || dat == 0 ? new Center(child: Text("No Live Match Available", style:  TextStyle(fontSize: 30, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,) ) : liveCard(datta[index]['homeTeam']['team_name'], datta[index]['goalsHomeTeam'], datta[index]['awayTeam']['team_name'], datta[index]['goalsAwayTeam'], datta[index]['elapsed'], index, datta[index]['events']),
                      
                childCount: datta?.length
              ),
            ) : _cIndex == 1 ? leag == 'Champions League' || leag == 'Europa League' ? SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, i) =>
                  Container(
                  margin: EdgeInsets.only(bottom: 0),
                  width: MediaQuery.of(context).size.width,
                  child: scndrounds[i] != 0 ? StickyHeader(
                    header: new Container(
                      margin: EdgeInsets.only(bottom: 4),
                      height: 50.0,
                      color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Color(0xffE2E2E2) : Color(0xff121C25),
                      padding: new EdgeInsets.symmetric(horizontal: 16.0),
                      alignment: Alignment.centerLeft,
                      child: new Text(ucluelround[i],
                        style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white, fontSize: 22, fontFamily: 'RobotoMed',),
                      ),
                    ),
                    content: new Container(
                      height: (scndrounds[i]*86).toDouble(),
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: data.length,
                        itemBuilder: (context, index) => data[index]['round'] == ucluelround[i] ? scoreCard(data[index]['homeTeam']['team_name'], data[index]['goalsHomeTeam'], data[index]['awayTeam']['team_name'], data[index]['goalsAwayTeam'], data[index]['elapsed'], index, data[index]['events']) : SizedBox(height: 0),
                      )
                    ),
                  ) : SizedBox(height: 0,),
                ),    
                childCount: ucluelround.length,
              ),
            ): SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, i) =>
                  Container(
                  margin: EdgeInsets.only(bottom: 0),
                  //height: MediaQuery.of(context).size.height/1.65,
                  width: MediaQuery.of(context).size.width,
                  child: //ListView.builder(
                    //itemCount: round+1,
                    //itemBuilder: (context, i) {
                      scndrounds[i] != 0 ? StickyHeader(
                        header: new Container(
                          margin: EdgeInsets.only(bottom: 4),
                          height: 50.0,
                          color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Color(0xffE2E2E2) : Color(0xff121C25),
                          padding: new EdgeInsets.symmetric(horizontal: 16.0),
                          alignment: Alignment.centerLeft,
                          child: new Text('Gameweek ${roundsNo(i)}',
                            style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white, fontSize: 22, fontFamily: 'RobotoMed',),
                          ),
                        ),
                        content: new Container(
                          height: (scndrounds[i]*86).toDouble(),
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: data.length,
                            itemBuilder: (context, index) => data[index]['round'] == "Regular Season - ${roundsNo(i)}" ? scoreCard(data[index]['homeTeam']['team_name'], data[index]['goalsHomeTeam'], data[index]['awayTeam']['team_name'], data[index]['goalsAwayTeam'], data[index]['elapsed'], index, data[index]['events']) : SizedBox(height: 0),
                          )
                        ),
                      ) : SizedBox(height: 0,),
                    //}
                //)
                ), 
                  //_data == null ? new Center(child: CircularProgressIndicator(backgroundColor: Color(0xffF3F3F3), valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),),) : 
                  /*scoreCard(data[index]['homeTeam']['team_name'], data[index]['goalsHomeTeam'], data[index]['awayTeam']['team_name'], data[index]['goalsAwayTeam'], data[index]['elapsed'], index, data[index]['events']),*/
                      
                childCount: rounds - roundsfirst,
              ),
            ) :
            
             _cIndex == 0 ?
             /*SliverToBoxAdapter(
               child: Container(
                 margin: EdgeInsets.only(bottom: 15),
                 height: MediaQuery.of(context).size.height/1.65,
                 width: MediaQuery.of(context).size.width,
                 child: ListView.builder(
                   itemCount: round+1,
                   itemBuilder: (context, i) {
                    return StickyHeader(
                      header: new Container(
                        
                        height: 50.0,
                        color: Colors.transparent,
                        padding: new EdgeInsets.symmetric(horizontal: 16.0),
                        alignment: Alignment.centerLeft,
                        child: new Text('Gameweek ${roundNo(i)}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      content: new Container(
                        height: 800,
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: datar.length,
                          itemBuilder: (context, index) => datar[index]['round'] == "Regular Season - ${roundNo(i)}" ? resultCard(datar[index]['homeTeam']['team_name'], datar[index]['goalsHomeTeam'], datar[index]['awayTeam']['team_name'], datar[index]['goalsAwayTeam'], datar[index]['elapsed'], index, datar[index]['events']) : SizedBox(height: 0),
                        )
                      ),
                    );
                  }
               )),
             )*/
             //_sliverList(round, datar.length)
             leag == 'Champions League' || leag == 'Europa League' ? SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, i) =>
                  Container(
                  margin: EdgeInsets.only(bottom: 0),
                  width: MediaQuery.of(context).size.width,
                  child: StickyHeader(
                    header: new Container(
                      margin: EdgeInsets.only(bottom: 4),
                      height: 50.0,
                      color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Color(0xffE2E2E2) : Color(0xff121C25),
                      padding: new EdgeInsets.symmetric(horizontal: 16.0),
                      alignment: Alignment.centerLeft,
                      child: new Text(ucluelrounds[i],
                        style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white, fontSize: 22, fontFamily: 'RobotoMed',),
                      ),
                    ),
                    content: new Container(
                      height: (scndround[i]*86).toDouble(),
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: datar.length,
                        itemBuilder: (context, index) => datar[index]['round'] == ucluelrounds[i] ? resultCard(datar[index]['homeTeam']['team_name'], datar[index]['goalsHomeTeam'], datar[index]['awayTeam']['team_name'], datar[index]['goalsAwayTeam'], datar[index]['elapsed'], index, datar[index]['events']) : SizedBox(height: 0),
                      )
                    ),
                  )
                ),    
                childCount: ucluelrounds.length,
              ),
            ): SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, i) => 
                  Container(
                 margin: EdgeInsets.only(bottom: 0),
                 //height: MediaQuery.of(context).size.height/1.65,
                 width: MediaQuery.of(context).size.width,
                 child: //ListView.builder(
                   //itemCount: round+1,
                   //itemBuilder: (context, i) {
                     StickyHeader(
                      header: new Container(
                        margin: EdgeInsets.only(bottom: 4),
                        height: 50.0,
                        color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Color(0xffE2E2E2) : Color(0xff121C25),
                        padding: new EdgeInsets.symmetric(horizontal: 16.0),
                        alignment: Alignment.centerLeft,
                        child: new Text('Gameweek ${roundNo(i)}',
                          style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white, fontSize: 22, fontFamily: 'RobotoMed',),
                        ),
                      ),
                      content: new Container(
                        height: (scndround[i]*86).toDouble(),
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: datar.length,
                          itemBuilder: (context, index) => datar[index]['round'] == "Regular Season - ${roundNo(i)}" ? resultCard(datar[index]['homeTeam']['team_name'], datar[index]['goalsHomeTeam'], datar[index]['awayTeam']['team_name'], datar[index]['goalsAwayTeam'], datar[index]['elapsed'], index, datar[index]['events']) : SizedBox(height: 0),
                        )
                      ),
                    ),
                  //}
               //)
               ),
                  //_data == null ? new Center(child: CircularProgressIndicator(backgroundColor: Color(0xffF3F3F3), valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),),) : 
                  /*resultCard(datar[index]['homeTeam']['team_name'], datar[index]['goalsHomeTeam'], datar[index]['awayTeam']['team_name'], datar[index]['goalsAwayTeam'], datar[index]['elapsed'], index, datar[index]['events']),*/
                      
                childCount: round//data?.length
              ),
            ) : SliverToBoxAdapter(
              child: Column(
                children: <Widget>[
                  Container(
                    //color: Colors.white24,
                    child: new Center(
                      child: new Column(
                        crossAxisAlignment:  CrossAxisAlignment.stretch,
                            children: <Widget>[
                              new Card(
                                //color: Colors.white24,
                                elevation: 0,
                                margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(10.0, 13.0, 13.0, 16.0),
                                  child: new Column(
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Text(
                                            "Pos",
                                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white),
                                            ),
                                          SizedBox(width: 40),
                                          Text("Club", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white),),
                                          SizedBox(width: 105),
                                          Text("MP", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white),),
                                          SizedBox(width: 15),
                                          Text("W", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white),),
                                          SizedBox(width: 15),
                                          Text("D", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white),),
                                          SizedBox(width: 15),
                                          Text("L", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white),),
                                          SizedBox(width: 15),
                                          Text("Pts", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white),),
                                          SizedBox(width: 15),
                                          Text("GD", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white),),
                                        ]
                                      ),
                                    ],
                      ),
        ),
      ),
      /*new Expanded(
        flex: 1,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: datttta.length,
          itemBuilder: (context, index){return bodyTable(datttta[index]['rank'], datttta[index]['teamName'], datttta[index]['all']['win'], datttta[index]['all']['draw'], datttta[index]['all']['lose'], datttta[index]['points'], datttta[index]['logo']);},
          
          ),
      )*/
      ]
      )
      )
                  ),
                ],
              ),
            ),
                  _cIndex == 3 ? //datttta == null ? new Center(child: CircularProgressIndicator(backgroundColor: Color(0xffF3F3F3), valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),),) : 
                  datttta == null ? SliverToBoxAdapter(
              child: Container(height: MediaQuery.of(context).size.height*0.5,
                child: new Center(child: CircularProgressIndicator(backgroundColor: Color(0xffF3F3F3), valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),),
                ) 
                ),
                ) 
                : SliverToBoxAdapter(
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: (datttta.length*49).toDouble(),
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder:
                            (context, index) => 
                                  bodyTable(datttta[index]['rank'], datttta[index]['teamName'],datttta[index]['all']['matchsPlayed'], datttta[index]['all']['win'], datttta[index]['all']['draw'], datttta[index]['all']['lose'], datttta[index]['points'], datttta[index]['logo'], datttta[index]['all']['goalsFor'], datttta[index]['all']['goalsAgainst']),
                            /*bodyTable(standlist[index].no, standlist[index].name, standlist[index].win, standlist[index].draw, standlist[index].lose, standlist[index].points, standlist[index].image),*/

                            itemCount: datttta?.length
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: new Card(
                          elevation: 1.0,
                          margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.all(5.0),
                                    child: Text("Qualification/Relegation", style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white, fontSize: 16, fontFamily: 'RobotoMed',),)
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(5.0),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(right: 10),
                                          width: 10,
                                          height: 10,
                                          color: Colors.green,
                                        ),
                                        Text("UEFA Champions League Group Stage", style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white, fontSize: 15,))
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(5.0),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(right: 10),
                                          width: 10,
                                          height: 10,
                                          color: Color(0xffFA7B17),
                                        ),
                                        Text("Europa League Group Stage", style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white, fontSize: 15,))
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(5.0),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(right: 10),
                                          width: 10,
                                          height: 10,
                                          color: Colors.red,
                                        ),
                                        Text("Relegation", style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white, fontSize: 15,))
                                      ],
                                    ),
                                  ),
                                  /*Container(
                                    margin: EdgeInsets.all(8.0),
                                    child: Row(
                                      children: <Widget>[
                                        Text("MP - Matches Played", style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white, fontSize: 15,)),
                                        Spacer(),
                                        Text("W - Wins", style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white, fontSize: 15,)),
                                        Spacer(),
                                        Text("D - Draws", style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white, fontSize: 15,)),
                                        
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(5.0),
                                    child: Row(
                                      children: <Widget>[
                                        Text("L - Lost", style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white, fontSize: 15,)),
                                        Spacer(),
                                        Text("Pts - Points", style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white, fontSize: 15,)),
                                        Spacer(),
                                        Text("GD - Goal Diffrence", style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white, fontSize: 15,))
                                        
                                      ],
                                    ),
                                  ),*/
                                ],
                              ),
                            ),
                          ),
                        )
                      ),    
                    ],
                  ),
                ) : SliverToBoxAdapter(),
              /*DataTable(
      columns: <DataColumn>[
        DataColumn(
          label: Text("Club"),
          numeric: false,
          onSort: (i,b) {},
        ),
        DataColumn(
          label: Text("W"),
          numeric: false,
          onSort: (i,b) {},
        ),
        DataColumn(
          label: Text("D"),
          numeric: false,
          onSort: (i,b) {},
        ),
        DataColumn(
          label: Text("L"),
          numeric: false,
          onSort: (i,b) {},
        ),
        DataColumn(
          label: Text("Pts"),
          numeric: false,
          onSort: (i,b) {},
        ),
      ], 
      rows: <DataRow>[
        DataRow(cells: <DataCell>[
          DataCell(
            Text("hhdggedjhed"),
          ),
          DataCell(
            Text("27")
          ),
          DataCell(
            Text("12")
          ),
          DataCell(
            Text("12")
          ),
          DataCell(
            Text("36")
          ),
        ])
      ]
    ),*/
          ],
        )
      );
    }

    return Scaffold(
      //backgroundColor: Color(0xffF3F3F3),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height*0.07),
        child: Container(
          margin: EdgeInsets.all(0.0),
          child: topAppBar,
        ),
        
      ),
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: _refresh,
        child: Stack(
          children: <Widget>[
            _maincard(),
            Visibility(
              visible: _visi,
              child: Opacity(
                opacity: opa,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.transparent
                )
              ),
            )
          ],
        )
      ),
    );
  }

  Future<Null> _refresh() async {
    setState(() {
      _visi =true;
      opa = 0.5;
    });
    _refreshIndicatorKey.currentState?.show();
    await new Future.delayed(const Duration(seconds: 2));
    round = 0;
    rounds = 0;
    roundsfirst = 0;
    print(round);
    firstround.clear();
    scndround.clear();
    firstrounds.clear();
    scndrounds.clear();
    liveList.clear();
    scoreList.clear();
    scoreListr.clear();
    _data.clear();
    datar.clear();
    dattta.clear();
    datttta.clear();
    //datta == 0 ? datta.length : datta.clear();

    var resone = await http.get(
      Uri.encodeFull(urli),
      headers: {
        "Accept": "application/json",
        "x-rapidapi-key": "YOUR-API-KEY"
      }
    );
    var response = await http.get(
          Uri.encodeFull('https://api-football-v1.p.rapidapi.com/v2/fixtures/league/$urlid?timezone=Europe/London'),
          headers: {
            "Accept": "application/json",
            "x-rapidapi-key": "YOUR-API-KEY"
            }
        );
        var responses = await http.get(
          Uri.encodeFull('https://api-football-v1.p.rapidapi.com/v2/leagueTable/$urlid'),
          headers: {
            "Accept": "application/json",
            "x-rapidapi-key": "YOUR-API-KEY"
            }
        );
        var restwo = await http.get(
          Uri.encodeFull('https://api-football-v1.p.rapidapi.com/v2/leagues/league/$urlid'),
          headers: {
            "Accept": "application/json",
            "x-rapidapi-key": "YOUR-API-KEY"
            }
        );
    setState(() {
      _visi =true;
      opa = 0.1;
        print(resone.body);
        print("From refresh $response.body");
        print("From refresh $responses.body");
        print("From refresh $restwo.body");

        setState(() {
        
        var convertDataToJsonone = jsonDecode(resone.body);
        dat = convertDataToJsonone['api']['results'];
        datta = convertDataToJsonone['api']['fixtures'];
        var convertDataToJsontwo = jsonDecode(restwo.body);
        var convertDataToJsonthree = jsonDecode(responses.body);
        _data = jsonDecode(response.body);
        print("This id the data......$_data");
        //var convertDataToJsonone = jsonDecode(resone.body);
        data = _data['api']['fixtures'];
        datar = data.reversed.toList();
        Scores scores;
        Scores scoresr;
        //data.forEach((dat) =>
        for (var i = 0; i < data.length; i++) {
          if(data[i]['goalsHomeTeam'] == null && data[i]['goalsAwayTeam'] == null) {
            print("NULLLLLLLLL");
            if (data[i]['league']['name'] == 'Champions League' || data[i]['league']['name'] == 'Europa League') {
              if (ucluelround.length == 0) {
                ucluelround.add(data[i]['round']);
                leag = data[i]['league']['name'];
              }else {
                if(ucluelround[ucluelround.length-1] != data[i]['round']) {
                  ucluelround.add(data[i]['round']);
                }
              }
              print(ucluelround);
              rounds = ucluelround.length;
            }else{
              var ronds = data[i]['round'];
              var rondSplits = ronds.split(" ");
              rounds = int.parse(rondSplits[3]);
              print("SSSSSSSSSSSSSS $rounds");
              if(roundsfirst == 0){
                roundsfirst = int.parse(rondSplits[3]);
              }
            }
          }
          var halft = data[i]['score']['halftime'];
          var half = halft == null ? ['0', '0'] : halft.split("-");
          scores = new Scores(_data['api']['fixtures'][i]['fixture_id'], _data['api']['fixtures'][i]['homeTeam']['team_id'], _data['api']['fixtures'][i]['awayTeam']['team_id'], _data['api']['fixtures'][i]['league']['name'],_data['api']['fixtures'][i]['league']['logo'], _data['api']['fixtures'][i]['homeTeam']['team_name'], _data['api']['fixtures'][i]['awayTeam']['team_name'], _data['api']['fixtures'][i]['homeTeam']['logo'], _data['api']['fixtures'][i]['awayTeam']['logo'], _data['api']['fixtures'][i]['goalsHomeTeam'], _data['api']['fixtures'][i]['goalsAwayTeam'], _data['api']['fixtures'][i]['elapsed'], int.parse(half[0]), int.parse(half[1]));
          scoreList.add(scores);
        }

        for (var i = 0; i < datar.length; i++) {
          if(datar[i]['goalsHomeTeam'] != null && datar[i]['goalsAwayTeam'] != null) {
            if (datar[i]['league']['name'] == 'Champions League' || datar[i]['league']['name'] == 'Europa League') {
              if (ucluelrounds.length == 0) {
                ucluelrounds.add(datar[i]['round']);
              }else {
                if(ucluelrounds[ucluelrounds.length-1] != datar[i]['round']) {
                  ucluelrounds.add(datar[i]['round']);
                }
              }
              print(ucluelrounds);
              round =ucluelrounds.length;
            }else{
              var rond = datar[i]['round'];
              var rondSplit = rond.split(" ");
              if(round == 0){
                round = int.parse(rondSplit[3]);
                print("RRRRRRRRRRRRRRR $round");
              }
            }
          }
          var halft = datar[i]['score']['halftime'];
          var half = halft == null ? ['0', '0'] : halft.split("-");
          scoresr = new Scores(datar[i]['fixture_id'],datar[i]['homeTeam']['team_id'], datar[i]['awayTeam']['team_id'], datar[i]['league']['name'],datar[i]['league']['logo'], datar[i]['homeTeam']['team_name'], datar[i]['awayTeam']['team_name'], datar[i]['homeTeam']['logo'], datar[i]['awayTeam']['logo'], datar[i]['goalsHomeTeam'], datar[i]['goalsAwayTeam'], datar[i]['elapsed'], int.parse(half[0]), int.parse(half[1]));
          scoreListr.add(scoresr);
        }

        if(rounds == 1) {
          for (var j = 0; j < datar.length; j++) {
            if (data[j]['league']['name'] == 'Champions League' || data[j]['league']['name'] == 'Europa League') {
                if(data[j]['goalsHomeTeam'] == null && data[j]['goalsAwayTeam'] == null && data[j]['round'] == ucluelround[0]) {
                    firstrounds.add(data[j]['goalsAwayTeam']);
                  }
              }else {
                if(data[j]['goalsHomeTeam'] == null && data[j]['goalsAwayTeam'] == null && data[j]['round'] == "Regular Season - 0") {
                  print(roundsNo(0));
                  firstrounds.add(data[j]['goalsAwayTeam']);
                }
              }
            }
            print(firstrounds);
            scndrounds.add(firstrounds.length);
          }else {
            for (var m = roundsfirst; m <= rounds; m++) {
            firstrounds.clear();
            for (var j = 0; j < datar.length; j++) {
              if (data[j]['league']['name'] == 'Champions League' || data[j]['league']['name'] == 'Europa League') {
                if(data[j]['goalsHomeTeam'] == null && data[j]['goalsAwayTeam'] == null && data[j]['round'] == ucluelround[m]) {
                    firstrounds.add(data[j]['goalsAwayTeam']);
                  }
              }else {
                if(data[j]['goalsHomeTeam'] == null && data[j]['goalsAwayTeam'] == null && data[j]['round'] == "Regular Season - $m") {
                  print(roundsNo(m));
                  firstrounds.add(data[j]['goalsAwayTeam']);
                }
              }
            }
            print(firstrounds);
            scndrounds.add(firstrounds.length);
          }
        }
        print(scndrounds);

        for (var m = 0; m < round; m++) {
          firstround.clear();
          for (var j = 0; j < datar.length; j++) {
            if (data[j]['league']['name'] == 'Champions League' || data[j]['league']['name'] == 'Europa League') {
              if(datar[j]['goalsHomeTeam'] != null && datar[j]['goalsAwayTeam'] != null && datar[j]['round'] == ucluelrounds[m]) {
                  firstround.add(datar[j]['goalsAwayTeam']);
                }
            }else {
              if(datar[j]['goalsHomeTeam'] != null && datar[j]['goalsAwayTeam'] != null && datar[j]['round'] == "Regular Season - ${roundNo(m)}") {
                print(roundNo(m));
                firstround.add(datar[j]['goalsAwayTeam']);
              }
            }
          }
          print(firstround);
          scndround.add(firstround.length);
        }
        print(scndround);

        print("data****************: $data");

        
        dattta = convertDataToJsontwo['api']['leagues'];
        print('@@@@@@: $dattta.length');
        datttta = convertDataToJsonthree['api']['standings'][0];
        print('###############: $datttta.length');

        Live live;
        liveList.clear();
        //data.forEach((dat) =>
        for (var i = 0; i < datta.length; i++) {
          live = new Live(datta[i]['league']['name'],datta[i]['league']['logo'], datta[i]['homeTeam']['team_name'], datta[i]['awayTeam']['team_name'], datta[i]['homeTeam']['logo'],datta[i]['awayTeam']['logo'], datta[i]['goalsHomeTeam'], datta[i]['goalsAwayTeam'], datta[i]['elapsed'], datta[i]['status'], datta[i]['homeTeam']['team_id'], datta[i]['awayTeam']['team_id'], datta[i]['fixture_id']);
          liveList.add(live);
        }

        var scorest = db.collection('LiveScores');

         Future <List <DocumentSnapshot>> list(int times) async {
        var coll = await db.collection('LiveScores').where('timestamp', isEqualTo: times).limit(1).getDocuments();
        
        var collt = coll.documents;
        print(collt);
        return collt;
      }
      for (var i = 0; i < datta.length; i++) {

        int time = datta[i]['event_timestamp'];
        print('[[[[[[[[[[[: $list(time)');
        list(time).then((value) async {
          if (value.isEmpty) {
            print('Empty*******************');
            await scorest.add({
            'timestamp': datta[i]['event_timestamp'],
            'team1n': datta[i]['homeTeam']['team_name'],
            'team2n': datta[i]['awayTeam']['team_name'],
            'team1': datta[i]['goalsHomeTeam'],
            'team2': datta[i]['goalsAwayTeam'],
            'team1id': datta[i]['homeTeam']['team_id'],
            'team2id': datta[i]['awayTeam']['team_id'],
            'index': i,
            'timescored': 0,
            'scorer': "",
            'assist': "",
            'scorerteamid': null,
            });
          }
          if(value.isNotEmpty){
            print('Not Empty*******************');
            
            value.forEach((val) async => 
              val['team1'] != datta[i]['goalsHomeTeam'] && val['team1n'] == datta[i]['homeTeam']['team_name'] ? await scorest.document(val.documentID).updateData({
                'team1': datta[i]['goalsHomeTeam'],
                'scorer': ""
                }) : val['team2'] != datta[i]['goalsAwayTeam'] && val['team2n'] == datta[i]['awayTeam']['team_name'] ? await scorest.document(val.documentID).updateData({
                  'team2': datta[i]['goalsAwayTeam'],
                  'scorer': ""
                  }) : print(val['team1n']),
            );
            List events = datta[i]['events'];
            for (var j = 0; j < events.length; j++) {
              value.forEach((val) async =>
                events[j]['type'] == 'Goal' ? val['scorer'] == "" &&   val['team1n'] == datta[i]['homeTeam']['team_name'] && events[j]['elapsed'] > val['timescored'] ? await scorest.document(val.documentID).updateData({
                  'timescored': events[j]['elapsed'],
                  'scorer': events[j]['player'],
                  'assist': events[j]['assist'],
                  'scorerteamid': events[j]['team_id']
                }) : null : null,
              );
            }
          }
        });
        
      }
        print('Length : $data.length');
        });

        _visi =false;
        opa = 0.0;

        return "Sucsses";
    });
  }
}


class Details extends StatefulWidget {
  final Scores passed;
  final List<LiveEvents> livee;
  final PaletteGenerator palette;
  final PaletteGenerator paletteOne;
  Details({Key key, @required this.passed, @required this.livee, @required this.palette, @required this.paletteOne}) : super(key: key);
  @override
  _DetailsState createState() => _DetailsState();
}


class _DetailsState extends State<Details> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =new GlobalKey<RefreshIndicatorState>();
  bool _showTitle = false;
   ScrollController _scrollController;
   int urllid;
   int inx = 0;
   double check = 0;
   List datae, datallone, datalltwo, datasone, datastwo;
   var resu;
   List goalh = [];
   List goala = [];
   List addtime = [];
   List addplayerid = [];
   List mutiple = [];
   List checked = [];
   int justChecked = 0;
   List halfck = [];
   List halfckn = [];
   //Map<String, String> _datap = {};
   List<Cards> carde = [];
   List<GoalCheck> goalt = [];
   Map datap, datt, crt, datalone, dataltwo, line;
   double _width = 0;
   double bphn, bpan, sngnh, sngna, sognh, sogna, tsnh, tsna, bsnh, bsna, sibnh, sibna, sobnh, sobna, fnh, fna, cknh, ckna, onh, ona, ycnh, ycna, rcnh, rcna, gksnh, gksna, tpnh, tpna, panh, pana, passacuh, passacua;
   int rcnhi, rcnai, ycnhi, ycnai, panhi, panai, passacuhi, passacuai;
   var formhome, formaway;

   @override
   void initState() { 
     super.initState();
      urllid = widget.passed.fix_id;
      getEvents();
      _scrollController = ScrollController()
        ..addListener((){
          final isNotExpanded = _scrollController.hasClients && _scrollController.offset > 100-kToolbarHeight;
          if (isNotExpanded != _showTitle){
            setState(() {
              _showTitle = isNotExpanded;
            });
          }
        });

   }

   Future<String> getEvents() async {
     var resp = await http.get(
       Uri.encodeFull('https://api-football-v1.p.rapidapi.com/v2/statistics/fixture/$urllid'),
       headers: {
        "Accept": "application/json",
        "x-rapidapi-key": "YOUR-API-KEY"
      }
     );

     var rese = await http.get(
       Uri.encodeFull('https://api-football-v1.p.rapidapi.com/v2/events/$urllid'),
       headers: {
        "Accept": "application/json",
        "x-rapidapi-key": "YOUR-API-KEY"
      }
     );

     var resl = await http.get(
       Uri.encodeFull('https://api-football-v1.p.rapidapi.com/v2/lineups/$urllid'),
       headers: {
        "Accept": "application/json",
        "x-rapidapi-key": "YOUR-API-KEY"
      }
     );

     print(resp.body);
     print(rese.body);
     print(resl.body);

     if (this.mounted) {
       setState(() {
         datap = jsonDecode(resp.body);
         var converte = jsonDecode(rese.body);
         line = jsonDecode(resl.body);
         print(datap['api']['results']);
         List none;
         resu = datap['api']['results'];
         datap['api']['results'] == 0 ? none = datap['api']['statistics'] : datt = datap['api']['statistics'];
         if(converte['api']['results'] != 0){
         var bpph = datt['Ball Possession']['home'];
         var bppa = datt['Ball Possession']['away'];
         var shgh = datt['Shots on Goal']['home'];
         var shga = datt['Shots on Goal']['away'];
         var shogh = datt['Shots off Goal']['home'];
         var shoga = datt['Shots off Goal']['away'];
         var totsh = datt['Total Shots']['home'];
         var totsa = datt['Total Shots']['away'];
         var blksh = datt['Blocked Shots']['home'];
         var blksa = datt['Blocked Shots']['away'];
         var shtibh = datt['Shots insidebox']['home'];
         var shtiba = datt['Shots insidebox']['away'];
         var shtobh = datt['Shots outsidebox']['home'];
         var shtoba = datt['Shots outsidebox']['away'];
         var folh = datt['Fouls']['home'];
         var fola = datt['Fouls']['away'];
         var conkh = datt['Corner Kicks']['home'];
         var conka = datt['Corner Kicks']['away'];
         var offh = datt['Offsides']['home'];
         var offa = datt['Offsides']['away'];
         var ycrdh = datt['Yellow Cards']['home'];
         var ycrda = datt['Yellow Cards']['away'];
         var rcrdh = datt['Red Cards']['home'];
         var rcrda = datt['Red Cards']['away'];
         var golsh = datt['Goalkeeper Saves']['home'];
         var golsa = datt['Goalkeeper Saves']['away'];
         var topah = datt['Total passes']['home'];
         var topaa = datt['Total passes']['away'];
         var accuph = datt['Passes accurate']['home'];
         var accupa = datt['Passes accurate']['away'];
         var passph = datt['Passes %']['home'];
         var passpa = datt['Passes %']['away'];
         var acuh = passph.split("%");
         var acua = passpa.split("%");
         var tata = bpph.split("%");
         var tatb = bppa.split("%");
         //print(tata);
         tata[0] == null ? bphn = 0 : bphn = double.parse(tata[0]);
         tatb[0] == null ? bpan = 0 : bpan = double.parse(tatb[0]);
         shgh == null ? sngnh = 0 : sngnh = double.parse(shgh);
         shga == null ? sngna = 0 : sngna = double.parse(shga);
         shogh == null ? sognh = 0 : sognh = double.parse(shogh);
         shoga == null ? sogna = 0 : sogna = double.parse(shoga);
         totsh == null ? tsnh = 0 : tsnh = double.parse(totsh);
         print(tsnh);
         totsa == null ? tsna = 0 : tsna = double.parse(totsa);
         blksh == null ? bsnh = 0 : bsnh = double.parse(blksh);
         blksa == null ? bsna = 0 : bsna = double.parse(blksa);
         shtibh == null ? sibnh = 0 : sibnh = double.parse(shtibh);
         shtiba == null ? sibna = 0 : sibna = double.parse(shtiba);
         shtobh == null ? sobnh = 0 : sobnh = double.parse(shtobh);
         shtoba == null ? sobna = 0 : sobna = double.parse(shtoba);
         folh == null ? fnh = 0 : fnh = double.parse(folh);
         fola == null ? fna = 0 : fna = double.parse(fola);
         conkh == null ? cknh = 0 : cknh = double.parse(conkh);
         conka == null ? ckna = 0 : ckna = double.parse(conka);
         offh == null ? onh = 0 : onh = double.parse(offh);
         offa == null ? ona = 0 : ona = double.parse(offa);
         ycrdh == null ? ycnh = 0 : ycnh = double.parse(ycrdh);
         ycrda == null ? ycnh = 0 : ycna = double.parse(ycrda);
         ycrdh == null ? ycnhi = 0 : ycnhi = int.parse(ycrdh);
         ycrda == null ? ycnai = 0 : ycnai = int.parse(ycrda);
         rcrdh == null ? rcnh = 0 : rcnh = double.parse(rcrdh);
         rcrda == null ? rcna = 0 : rcna = double.parse(rcrda);
         rcrdh == null ? rcnhi = 0 : rcnhi = int.parse(rcrdh);
         rcrda == null ? rcnai = 0 : rcnai = int.parse(rcrda);
         golsh == null ? gksnh = 0 : gksnh = double.parse(golsh);
         golsa == null ? gksna = 0 : gksna = double.parse(golsa);
         topah == null ? tpnh = 0 : tpnh = double.parse(topah);
         topaa == null ? tpna = 0 : tpna = double.parse(topaa);
         accuph == null ? panh = 0 : panh = double.parse(accuph);
         accupa == null ? pana = 0 : pana = double.parse(accupa);
         accuph == null ? panhi = 0 : panhi = int.parse(accuph);
         accupa == null ? panai = 0 : panai = int.parse(accupa);
         passph == null ? passacuh = 0 : passacuh = double.parse(acuh[0]);
         passpa == null ? passacua = 0 : passacua = double.parse(acua[0]);
         passph == null ? passacuhi = 0 : passacuhi = int.parse(acuh[0]);
         passpa == null ? passacuai = 0 : passacuai = int.parse(acua[0]);
         //crt = datt['Shots on Goal'];
         //print("Map%%%%%%%%%: $crt")

         //Map datap = convertp['api']['statistics'];
         
         datae = converte['api']['events'];
         //print(datap.length);
         //rry = converte['api']['events'];
         datae.sort((a,b) { 
          var atime = a['elapsed'];
          var btime = b['elapsed'];
          return btime.compareTo(atime);
         });
         for (var i = 0; i < datae.length; i++) {
           if(datae[i]['elapsed'] <= 45) {
             halfck.add(datae[i]['elapsed']);
           }
           if(halfck.isEmpty){
             halfckn.add(datae[datae.length-1]['elapsed']);
           }
           print(halfck);
           Cards cardd = new Cards(datae[i]['player_id']);
           datae[i]['detail'] == 'Red Card' ? carde.add(cardd) : null;
         }
         for (var i = 0; i < datae.length; i++) {
           GoalCheck gol = new GoalCheck(datae[i]['player'], datae[i]['team_id'], datae[i]['elapsed'], datae[i]['player_id']);
           if(datae[i]['type'] == 'Goal'){
             goalt.add(gol);
             if (datae[i]['team_id'] == widget.passed.team_idh) {
               goalh.add(datae[i]['team_id']);
               //check = (goalh.length).toDouble();
             } else {
               goala.add(datae[i]['team_id']);
               //check = (goala.length).toDouble();
             }
             addplayerid.add(datae[i]['player_id']);
             addtime.add(datae[i]['elapsed']);
             //check = check + 1;
             print("Check##########: $check");
           }
         }

         if (goalh.length > goala.length) {
            check = (goalh.length).toDouble();
          } else {
            check = (goala.length).toDouble();
          }
         print(carde);
         datalone = line['api']['lineUps'][widget.passed.titlehome];
         datallone = datalone['startXI'];
         datasone = datalone['substitutes'];
         var fhm = datalone['formation'];
         formhome = fhm.split("-");
         print(formhome);
         dataltwo = line['api']['lineUps'][widget.passed.titleaway];
         datalltwo = dataltwo['startXI'];
         datastwo = dataltwo['substitutes'];
         var faw = dataltwo['formation'];
         formaway = faw.split("-");
         print(formaway);
         } else {
           print("nothing");
         }
       });
     }
     return "sucsses";
   }

  int _cIndex = 0;
  int _clIndex = 2;
  void _incrementTab(index) {
    setState(() {
      _cIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    /*final topBar = AppBar(
  elevation: 0,
  backgroundColor: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.white : Color(0xff0D1B26),
  brightness: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Brightness.light : Brightness.dark,
  leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ?  Colors.black : Colors.white),
                  onPressed: (){Navigator.pop(context);},),
                actions: <Widget>[IconButton(
                  icon: Icon(Icons.share, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ?  Colors.black : Colors.white,),
                  onPressed: (){}
                ),
                ],
                flexibleSpace: Container(height: 0,),
  title: _showTitle ? 
  new Row(
    children: <Widget>[
      SizedBox(width: 20,),
      Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(widget.passed.image),
            fit: BoxFit.contain
          ),
        )
      ),
      SizedBox(width: 40,),
      Container(
        child: Text(widget.passed.home.toString(), style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),),
      ),
      SizedBox(width: 18,),
      Container(
        child: Text(":", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),),
      ),
      SizedBox(width: 18,),
      Container(
        child: Text(widget.passed.away.toString(), style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),),
      ),
      SizedBox(width: 40,),
      Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(widget.passed.img),
            fit: BoxFit.contain
          ),
        )
      ),
    ],
  ) : new Row(
    children: <Widget>[
       SizedBox(width: 50),
                  Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? NetworkImage(widget.passed.logo) : AssetImage('assets/images/permier_white.png'),
                            fit: BoxFit.contain
                          ),
                        )
                      ),
                      SizedBox(width: 10),
                      Text(widget.passed.league)
    ],
  ),
);*/
  bool checkCard(int pid) {
    if(carde.isEmpty) {
      return false;
    } else {
      for (var i = 0; i < carde.length; i++) {
        if(pid == carde[i].id){
          return true;
        }
      }
    }
      //print(name);
      //print(pid);
      return false;
  }

  int incno(int indx) {
    return indx + 1;
  }

  int redno(int indx) {
    return indx - 1;
  }

  bool checkmulti(int id) {
    
    mutiple.clear();
    int a = 0;
    for(var i = 0; i < addplayerid.length; i++) {
      if(id == addplayerid[i]){
        a+=1;
      }
    }
    if (a>1) {
      for(var i =0; i < addplayerid.length; i++){
        if(id == addplayerid[i]){
          mutiple.add(addtime[i]);
        }
      }
    }
    
    if(mutiple.isEmpty){
      return false;
    }else{
      justChecked+=1;
      checked.add(id);
      print(checked);
      return true;
    }
  }

  bool checkid(int id) {
    if(checked.isEmpty) {
      return false;
    }
    for(var i = 0; i < checked.length; i++){
      if(id == checked[i]) {
        return true;
      }
    }
    return false;
  }  

  bool setwidth() {
    Future.delayed(const Duration(seconds: 1), (){
      if (this.mounted) {
        setState(() {
          _width = 60;
        });
      }
  });
  return true;
  }

  bool resetwidth() {
    if (this.mounted) {
      setState(() {
        _width =0;
      });
    }
    return true;
  }

  /*bool addto(int pid) {
    //carde.clear();
    Cards cardd = new Cards(pid);
    carde.add(cardd);
    carde.clear();
    return true;
  }*/

  Widget eventCard(int time, int id, String name, String assist, String type, String details, int index, int plid ) {
    return new Container(
      child: new Center(
        child: new Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Card(
              color: Colors.transparent,
              elevation: 0,
              margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
              child: /*Padding(
                padding: const EdgeInsets.only(left:16.0, top: 5.0, bottom: 3.0, right: 16.0,),
                child:*/ id == widget.passed.team_idh ? 
                index > 0 && type == 'Card' && details == 'Red Card' && datae[redno(index)]['detail'] == 'Yellow Card' && datae[redno(index)]['elapsed'] == time && datae[redno(index)]['player_id'] == plid ? SizedBox(height: 0,) 
                 :
                datae.length-1 != index && type == 'Card' && details == 'Red Card' && datae[incno(index)]['detail'] == 'Yellow Card' && datae[incno(index)]['elapsed'] == time && datae[incno(index)]['player_id'] == plid || datae.length-1 != index && type == 'Card' && details == 'Yellow Card' && datae[incno(index)]['detail'] == 'Red Card' && datae[incno(index)]['elapsed'] == time && datae[incno(index)]['player_id'] == plid ?
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(right: 5),
                              width: 40,
                              decoration: BoxDecoration(
                                border: new Border(
                                  right: new BorderSide(
                                    width: 1.0,
                                    color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black38 : Colors.white24,
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(time.toString()+"'", style: TextStyle(fontSize: 17, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black54 : Colors.white60,)),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 5),
                              width: 60,
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      border: new Border(
                                        right: new BorderSide(width: 1.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black12 : Colors.white10),
                                        top: new BorderSide(width: 1.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black12 : Colors.white10),
                                        bottom: new BorderSide(width: 1.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black12 : Colors.white10),
                                        left: new BorderSide(width: 1.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black12 : Colors.white10),
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                    ),
                                    child: Padding(
                                        padding: EdgeInsets.all(6),
                                        child: 
                                        new Image.network(widget.passed.image, width: 5, height: 5, fit: BoxFit.contain,)
                                        ),
                                  ),
                                  Positioned(
                                    //top: 10,
                                    left: 25,
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        border: new Border(
                                          right: new BorderSide(width: 1.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black12 : Colors.white10),
                                          top: new BorderSide(width: 1.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black12 : Colors.white10),
                                          bottom: new BorderSide(width: 1.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black12 : Colors.white10),
                                          left: new BorderSide(width: 1.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black12 : Colors.white10),
                                        ),
                                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                      ),
                                      child: Padding(
                                          padding: EdgeInsets.all(6),
                                          child: Image(
                                                image: AssetImage('assets/images/double_yellow.png'),
                                                fit: BoxFit.contain,
                                              ),
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Text(name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white)),
                            ),
                          ],
                        ),
                      ),
                      Divider(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black38 : Colors.white24, indent: 15.0, endIndent: 5.0,),
                    ],
                  )
                : type == 'Card' && details == 'Yellow Card' && checkCard(plid) == true && datae[redno(index)]['detail'] == 'Red Card' ?
                  SizedBox(height: 0,)
                : Column(
                  children: <Widget>[
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Row(
                         //mainAxisAlignment: MainAxisAlignment.center,
                         //mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(right: 15),
                            width: 40,
                            decoration: BoxDecoration(
                              border: new Border(
                                right: new BorderSide(
                                  width: 1.0,
                                  color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black38 : Colors.white24,
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(time.toString()+"'", style: TextStyle(fontSize: 17, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black54 : Colors.white60,),),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 5),
                            width: 60,
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    border: new Border(
                                      right: new BorderSide(width: 1.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black12 : Colors.white10),
                                      top: new BorderSide(width: 1.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black12 : Colors.white10),
                                      bottom: new BorderSide(width: 1.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black12 : Colors.white10),
                                      left: new BorderSide(width: 1.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black12 : Colors.white10),
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                  ),
                                  child: Padding(
                                      padding: EdgeInsets.all(6),
                                      child: 
                                      new Image.network(widget.passed.image, width: 5, height: 5, fit: BoxFit.contain,)
                                      ),
                                ),
                                Positioned(
                                  //top: 10,
                                  left: 25,
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      border: new Border(
                                        right: new BorderSide(width: 1.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black12 : Colors.white10),
                                        top: new BorderSide(width: 1.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black12 : Colors.white10),
                                        bottom: new BorderSide(width: 1.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black12 : Colors.white10),
                                        left: new BorderSide(width: 1.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black12 : Colors.white10),
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                    ),
                                    child: Padding(
                                        padding: EdgeInsets.all(6),
                                        child: type == 'Card' ? 
                                          details == 'Yellow Card' ?
                                            Image(
                                              image: AssetImage('assets/images/yellow.png'),
                                              fit: BoxFit.contain,
                                            ) : details == 'Red Card' ? Image(
                                              image: AssetImage('assets/images/red.png'),
                                              fit: BoxFit.contain,
                                            ) : null
                                        :
                                          type == 'Goal' ?
                                            details == 'Normal Goal' ? 
                                              Image(
                                                image: AssetImage('assets/images/goal.png'),
                                                fit: BoxFit.contain,
                                              ) : details == 'Own Goal' ? Image(
                                              image: AssetImage('assets/images/own_goal.png'),
                                              fit: BoxFit.contain,
                                            ) : details == 'Missed Penalty' ? Image(
                                              image: AssetImage('assets/images/pen_missed.png'),
                                              fit: BoxFit.contain,
                                            ) : Image(
                                              image: AssetImage('assets/images/pen_scored.png'),
                                              fit: BoxFit.contain,
                                            )
                                          :
                                            Image(
                                                image: AssetImage('assets/images/subst.png'),
                                                fit: BoxFit.contain,
                                              )
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          
                          /*Center(
                            child:*/  type == 'Card' ? 
                                Container(
                              child:Text(name, textAlign: TextAlign.center, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white)))
                                :
                                type == 'Goal' ?
                                  details == 'Normal Goal' ? Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                          Text("Goal: "+name, textAlign: TextAlign.center,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white)),
                                      assist == null ? SizedBox(height: 0,) : Text("Assist: "+assist, textAlign: TextAlign.center, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white)),
                                    ],
                                  ) 
                                  : details == 'Own Goal' ? 
                                    Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                          Text("Own Goal: "+name, textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white)),
                                      assist == null ? SizedBox(height: 0,) : Text("Assist: "+assist, textAlign: TextAlign.center, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white)),
                                    ],
                                  )
                                  : details == 'Missed Penalty' ?
                                    Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                          Text("Missed Penalty: "+name, textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white)),
                                      assist == null ? SizedBox(height: 0,) : Text("Assist: "+assist, textAlign: TextAlign.center, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white)),
                                    ],
                                  ) 
                                  :
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                          Text("Penalty: "+name, textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white)),
                                      assist == null ? SizedBox(height: 0,) : Text("Assist: "+assist, textAlign: TextAlign.center, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white)),
                                    ],
                                  ) 

                                :
                                  Column(
                                  //mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                 children: <Widget>[
                                   Row(
                                     
                                     children: <Widget>[
                                       Text("In: "+name, textAlign: TextAlign.left, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white)),
                                     ],
                                   ),
                                   Text("Out: "+assist, textAlign: TextAlign.left, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white))
                                 ], 
                                ),
                            
                          //),
                        ],
                    ),
                     ),
                    Divider(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black38 : Colors.white24, indent: 15.0, endIndent: 15.0,),
                  ],
                )
                 : index > 0 && type == 'Card' && details == 'Red Card' && datae[redno(index)]['detail'] == 'Yellow Card' && datae[redno(index)]['elapsed'] == time && datae[redno(index)]['player_id'] == plid ? SizedBox(height: 0,) 
                 : 
                 datae.length != index && type == 'Card' && details == 'Red Card' && datae[incno(index)]['detail'] == 'Yellow Card' && datae[incno(index)]['elapsed'] == time && datae[incno(index)]['player_id'] == plid || datae.length != index && type == 'Card' && details == 'Yellow Card' && datae[incno(index)]['detail'] == 'Red Card' && datae[incno(index)]['elapsed'] == time && datae[incno(index)]['player_id'] == plid ?
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          
                          
                          Container(
                            child: Text(name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white)),
                          ),

                          Container(
                            margin: EdgeInsets.only(right: 5),
                            width: 60,
                            child: Stack(
                              children: <Widget>[
                                Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      border: new Border(
                                        right: new BorderSide(width: 1.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black12 : Colors.white10),
                                        top: new BorderSide(width: 1.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black12 : Colors.white10),
                                        bottom: new BorderSide(width: 1.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black12 : Colors.white10),
                                        left: new BorderSide(width: 1.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black12 : Colors.white10),
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                    ),
                                    child: Padding(
                                        padding: EdgeInsets.all(6),
                                        child: Image(
                                              image: AssetImage('assets/images/double_yellow.png'),
                                              fit: BoxFit.contain,
                                            ),
                                        ),
                                  ),
                                Positioned(
                                  //top: 10,
                                  left: 25,
                                  child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    border: new Border(
                                      right: new BorderSide(width: 1.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black12 : Colors.white10),
                                      top: new BorderSide(width: 1.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black12 : Colors.white10),
                                      bottom: new BorderSide(width: 1.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black12 : Colors.white10),
                                      left: new BorderSide(width: 1.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black12 : Colors.white10),
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                  ),
                                  child: Padding(
                                      padding: EdgeInsets.all(6),
                                      child: 
                                      new Image.network(widget.passed.img, width: 5, height: 5, fit: BoxFit.contain,)
                                      ),
                                ),
                                ),
                                
                              ],
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.only(left: 5),
                            width: 40,
                            decoration: BoxDecoration(
                              border: new Border(
                                left: new BorderSide(
                                  width: 1.0,
                                  color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black38 : Colors.white24,
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(time.toString()+"'", style: TextStyle(fontSize: 17, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black54 : Colors.white60,)),
                            ),
                          ),
                        ],
                      ),
                      Divider(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black38 : Colors.white24, indent: 15.0, endIndent: 15.0,),
                    ],
                  )
                : type == 'Card' && details == 'Yellow Card' && checkCard(plid) == true && datae[redno(index)]['detail'] == 'Red Card' ?
                  SizedBox(height: 0,)
                : Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.end,
                         //mainAxisAlignment: MainAxisAlignment.center,
                         //mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          
                          
                          
                          /*Center(
                            child:*/  type == 'Card' ? 
                                Container(
                              child:Text(name, textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white)))
                                :
                                type == 'Goal' ?
                                  details == 'Normal Goal' ? Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                          Text("Goal: "+name, textAlign: TextAlign.right, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white)),
                                      assist == null ? SizedBox(height: 0,) : Text("Assist: "+assist, textAlign: TextAlign.right, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white)),
                                    ],
                                  ) 
                                  : details == 'Own Goal' ? 
                                    Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                          Text("Own Goal: "+name, textAlign: TextAlign.right, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white)),
                                      assist == null ? SizedBox(height: 0,) : Text("Assist: "+assist, textAlign: TextAlign.right, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white)),
                                    ],
                                  )
                                  : details == 'Missed Penalty' ?
                                    Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                          Text("Missed Penalty: "+name, textAlign: TextAlign.right, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white)),
                                      assist == null ? SizedBox(height: 0,) : Text("Assist: "+assist, textAlign: TextAlign.right, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white)),
                                    ],
                                  ) 
                                  :
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                          Text("Penalty: "+name, textAlign: TextAlign.right, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white)),
                                      assist == null ? SizedBox(height: 0,) : Text("Assist: "+assist, textAlign: TextAlign.right, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white)),
                                    ],
                                  ) 

                                :
                                  Column(
                                  //mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                 children: <Widget>[
                                   Row(
                                     
                                     children: <Widget>[
                                       Text("In: "+name, textAlign: TextAlign.right, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white)),
                                     ],
                                   ),
                                   Text("Out: "+assist, textAlign: TextAlign.right,style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white))
                                 ], 
                                ),
                            
                          //),

                          Container(
                            margin: EdgeInsets.only(left: 5),
                            width: 60,
                            child: Stack(
                              children: <Widget>[
                                Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      border: new Border(
                                        right: new BorderSide(width: 1.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black12 : Colors.white10),
                                        top: new BorderSide(width: 1.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black12 : Colors.white10),
                                        bottom: new BorderSide(width: 1.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black12 : Colors.white10),
                                        left: new BorderSide(width: 1.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black12 : Colors.white10),
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                    ),
                                    child: Padding(
                                        padding: EdgeInsets.all(6),
                                        child: type == 'Card' ? 
                                          details == 'Yellow Card' ?
                                            Image(
                                              image: AssetImage('assets/images/yellow.png'),
                                              fit: BoxFit.contain,
                                            ) : details == 'Red Card' ? Image(
                                              image: AssetImage('assets/images/red.png'),
                                              fit: BoxFit.contain,
                                            ) : null
                                        :
                                          type == 'Goal' ?
                                            details == 'Normal Goal' ? 
                                              Image(
                                                image: AssetImage('assets/images/goal.png'),
                                                fit: BoxFit.contain,
                                              ) : details == 'Own Goal' ? Image(
                                              image: AssetImage('assets/images/own_goal.png'),
                                              fit: BoxFit.contain,
                                            ) : details == 'Missed Penalty' ? Image(
                                              image: AssetImage('assets/images/pen_missed.png'),
                                              fit: BoxFit.contain,
                                            ) : Image(
                                              image: AssetImage('assets/images/pen_scored.png'),
                                              fit: BoxFit.contain,
                                            )
                                          :
                                            Image(
                                                image: AssetImage('assets/images/subst.png'),
                                                fit: BoxFit.contain,
                                              )
                                        ),
                                  ),
                                Positioned(
                                  //top: 10,
                                  left: 25,
                                  child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    border: new Border(
                                      right: new BorderSide(width: 1.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black12 : Colors.white10),
                                      top: new BorderSide(width: 1.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black12 : Colors.white10),
                                      bottom: new BorderSide(width: 1.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black12 : Colors.white10),
                                      left: new BorderSide(width: 1.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black12 : Colors.white10),
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                  ),
                                  child: Padding(
                                      padding: EdgeInsets.all(6),
                                      child: 
                                      new Image.network(widget.passed.img, width: 5, height: 5, fit: BoxFit.contain,)
                                      ),
                                ),
                                ),
                                
                              ],
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.only(left: 15),
                            width: 40,
                            decoration: BoxDecoration(
                              border: new Border(
                                left: new BorderSide(
                                  width: 1.0,
                                  color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black38 : Colors.white24,
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(time.toString()+"'", style: TextStyle(fontSize: 17, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black54 : Colors.white60,)),
                            ),
                          ),
                        ],
                    ),
                     ),
                    Divider(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black38 : Colors.white24, indent: 15.0, endIndent: 15.0,),
                  ],
                )
                
              //),
            ),
          ],
        ),
      ),
    );
  }

  statCard(String sngh, String snga, String sfgh, String sfga, String tsh, String tsa, String bsh, String bsa, String sibh, String siba, String sobh, String soba, String fh, String fa, String ckh, String cka, String oh, String oa, String bph, String bpa, String ych, String yca, String rch, String rca, String gksh, String gksa, String tph, String tpa, String pah, String paa) {
    return Container(
      margin: EdgeInsets.only(top: 3, bottom: 10, left: 2, right: 2),
      child: Card(
        elevation: 5.0,
        color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.white : Color(0xff0D1B26),
        //margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 15, left: 10, right: 10),
            child: Column(
              //mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(widget.passed.image),
                            fit: BoxFit.contain
                          ),
                        )
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width*0.21,),
                      Container(
                        width: 100,
                        child: Center(child: Text("TEAM STATS", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,))),
                      SizedBox(width: MediaQuery.of(context).size.width*0.21,),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(widget.passed.img),
                            fit: BoxFit.contain
                          ),
                        )
                      ),
                    ],
                  ),
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 8),
                      width: 40,
                      height: 40,
                      child: Center(child: Text(bph.toString(), style: TextStyle(fontSize: 15, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.21,),
                    Container(
                      width: 100,
                      //margin: EdgeInsets.only(top: 3, bottom: 3),
                      child: Center(child: Text("Ball Possession", style: TextStyle(fontSize: 15, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.21,),
                    Container(
                      width: 40,
                      height: 40,
                      child: Center(child: Text(bpa.toString(), style: TextStyle(fontSize: 15, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 175,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            //margin: EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topLeft: Radius.circular(10)),
                              color: Color.fromRGBO(232, 232, 232, 0.2),
                            ),
                            height: 5,
                            width: 175,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child:Container(
                            //alignment: Alignment(20, 30),
                            //margin: EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topLeft: Radius.circular(10)),
                              color: Colors.red,
                            ),
                            height: 5,
                            width: bphn + 75,
                          ) ,
                          ),
                        ],
                      ),
                    ),
                    Stack(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), topRight: Radius.circular(10)),
                            color: Color.fromRGBO(232, 232, 232, 0.2),
                          ),
                          height: 5,
                          width: 175,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), topRight: Radius.circular(10)),
                            color: Colors.blue,
                          ),
                          height: 5,
                          width: bpan+75,
                        ),
                      ],
                    ),
                  ],
                ),

                 Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 8),
                      width: 40,
                      height: 40,
                      child: Center(child: Text(tsh.toString(), style: TextStyle(fontSize: 15, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.21,),
                    Container(
                      width: 100,
                      //margin: EdgeInsets.only(top: 3, bottom: 3),
                      child: Center(child: Text("Total Shots", style: TextStyle(fontSize: 15, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.21,),
                    Container(
                      width: 40,
                      height: 40,
                      child: Center(child: Text(tsa.toString(), style: TextStyle(fontSize: 15, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 175,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            //margin: EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topLeft: Radius.circular(10)),
                              color: Color.fromRGBO(232, 232, 232, 0.2),
                            ),
                            height: 5,
                            width: 175,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child:Container(
                            //alignment: Alignment(20, 30),
                            //margin: EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topLeft: Radius.circular(10)),
                              color: Colors.red,
                            ),
                            height: 5,
                            width: tsnh == 0 ? 1 : tsnh + 75,
                          ) ,
                          ),
                        ],
                      ),
                    ),
                    Stack(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), topRight: Radius.circular(10)),
                            color: Color.fromRGBO(232, 232, 232, 0.2),
                          ),
                          height: 5,
                          width: 175,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), topRight: Radius.circular(10)),
                            color: Colors.blue,
                          ),
                          height: 5,
                          width: tsna == 0 ? 1 : tsna +75,
                        ),
                      ],
                    ),
                  ],
                ),

                 Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 8),
                      width: 40,
                      height: 40,
                      child: Center(child: Text(sngh.toString(), style: TextStyle(fontSize: 15, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.21,),
                    Container(
                      width: 100,
                      //margin: EdgeInsets.only(top: 3, bottom: 3),
                      child: Center(child: Text("Shots On Goal", style: TextStyle(fontSize: 15, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.21,),
                    Container(
                      width: 40,
                      height: 40,
                      child: Center(child: Text(snga.toString(), style: TextStyle(fontSize: 15, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 175,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            //margin: EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topLeft: Radius.circular(10)),
                              color: Color.fromRGBO(232, 232, 232, 0.2),
                            ),
                            height: 5,
                            width: 175,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child:Container(
                            //alignment: Alignment(20, 30),
                            //margin: EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topLeft: Radius.circular(10)),
                              color: Colors.red,
                            ),
                            height: 5,
                            width: sngnh == 0 ? 1 : sngnh + 75,
                          ) ,
                          ),
                        ],
                      ),
                    ),
                    Stack(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), topRight: Radius.circular(10)),
                            color: Color.fromRGBO(232, 232, 232, 0.2),
                          ),
                          height: 5,
                          width: 175,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), topRight: Radius.circular(10)),
                            color: Colors.blue,
                          ),
                          height: 5,
                          width: sngna == 0 ? 1 : sngna +75,
                        ),
                      ],
                    ),
                  ],
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 8),
                      width: 40,
                      height: 40,
                      child: Center(child: Text(sfgh.toString(), style: TextStyle(fontSize: 15, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.21,),
                    Container(
                      width: 100,
                      //margin: EdgeInsets.only(top: 3, bottom: 3),
                      child: Center(child: Text("Shots Off Goal", style: TextStyle(fontSize: 15, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.21,),
                    Container(
                      width: 40,
                      height: 40,
                      child: Center(child: Text(sfga.toString(), style: TextStyle(fontSize: 15, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 175,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            //margin: EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topLeft: Radius.circular(10)),
                              color: Color.fromRGBO(232, 232, 232, 0.2),
                            ),
                            height: 5,
                            width: 175,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child:Container(
                            //alignment: Alignment(20, 30),
                            //margin: EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topLeft: Radius.circular(10)),
                              color: Colors.red,
                            ),
                            height: 5,
                            width: sognh == 0 ? 1 : sognh + 75,
                          ) ,
                          ),
                        ],
                      ),
                    ),
                    Stack(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), topRight: Radius.circular(10)),
                            color: Color.fromRGBO(232, 232, 232, 0.2),
                          ),
                          height: 5,
                          width: 175,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), topRight: Radius.circular(10)),
                            color: Colors.blue,
                          ),
                          height: 5,
                          width: sogna == 0 ? 1 : sogna +75,
                        ),
                      ],
                    ),
                  ],
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 8),
                      width: 40,
                      height: 40,
                      child: Center(child: Text((passacuhi).toString()+"%", style: TextStyle(fontSize: 15, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.21,),
                    Container(
                      width: 100,
                      //margin: EdgeInsets.only(top: 3, bottom: 3),
                      child: Center(child: Text("Pass Acurracy", style: TextStyle(fontSize: 15, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.21,),
                    Container(
                      width: 40,
                      height: 40,
                      child: Center(child: Text((passacuai).toString()+"%", style: TextStyle(fontSize: 15, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 175,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            //margin: EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topLeft: Radius.circular(10)),
                              color: Color.fromRGBO(232, 232, 232, 0.2),
                            ),
                            height: 5,
                            width: 175,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child:Container(
                            //alignment: Alignment(20, 30),
                            //margin: EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topLeft: Radius.circular(10)),
                              color: Colors.red,
                            ),
                            height: 5,
                            width: passacuh == 0 ? 1 : (passacuh) + 75,
                          ) ,
                          ),
                        ],
                      ),
                    ),
                    Stack(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), topRight: Radius.circular(10)),
                            color: Color.fromRGBO(232, 232, 232, 0.2),
                          ),
                          height: 5,
                          width: 175,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), topRight: Radius.circular(10)),
                            color: Colors.blue,
                          ),
                          height: 5,
                          width: passacua == 0 ? 1 : (passacua) +75,
                        ),
                      ],
                    ),
                  ],
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 8),
                      width: 40,
                      height: 40,
                      child: Center(child: Text(tph.toString(), style: TextStyle(fontSize: 15, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.21,),
                    Container(
                      width: 100,
                      //margin: EdgeInsets.only(top: 3, bottom: 3),
                      child: Center(child: Text("Total Passes", style: TextStyle(fontSize: 15, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.21,),
                    Container(
                      width: 40,
                      height: 40,
                      child: Center(child: Text(tpa.toString(), style: TextStyle(fontSize: 15, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 175,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            //margin: EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topLeft: Radius.circular(10)),
                              color: Color.fromRGBO(232, 232, 232, 0.2),
                            ),
                            height: 5,
                            width: 175,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child:Container(
                            //alignment: Alignment(20, 30),
                            //margin: EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topLeft: Radius.circular(10)),
                              color: Colors.red,
                            ),
                            height: 5,
                            width: tpnh == 0 ? 1 : (tpnh/10) + 75,
                          ) ,
                          ),
                        ],
                      ),
                    ),
                    Stack(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), topRight: Radius.circular(10)),
                            color: Color.fromRGBO(232, 232, 232, 0.2),
                          ),
                          height: 5,
                          width: 175,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), topRight: Radius.circular(10)),
                            color: Colors.blue,
                          ),
                          height: 5,
                          width: tpna == 0 ? 1 : (tpna/10) +75,
                        ),
                      ],
                    ),
                  ],
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 8),
                      width: 40,
                      height: 40,
                      child: Center(child: Text(ckh.toString(), style: TextStyle(fontSize: 15, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.21,),
                    Container(
                      width: 100,
                      //margin: EdgeInsets.only(top: 3, bottom: 3),
                      child: Center(child: Text("Corners", style: TextStyle(fontSize: 15, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.21,),
                    Container(
                      width: 40,
                      height: 40,
                      child: Center(child: Text(cka.toString(), style: TextStyle(fontSize: 15, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 175,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            //margin: EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topLeft: Radius.circular(10)),
                              color: Color.fromRGBO(232, 232, 232, 0.2),
                            ),
                            height: 5,
                            width: 175,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child:Container(
                            //alignment: Alignment(20, 30),
                            //margin: EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topLeft: Radius.circular(10)),
                              color: Colors.red,
                            ),
                            height: 5,
                            width: cknh == 0 ? 1 : cknh + 75,
                          ) ,
                          ),
                        ],
                      ),
                    ),
                    Stack(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), topRight: Radius.circular(10)),
                            color: Color.fromRGBO(232, 232, 232, 0.2),
                          ),
                          height: 5,
                          width: 175,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), topRight: Radius.circular(10)),
                            color: Colors.blue,
                          ),
                          height: 5,
                          width: ckna == 0 ? 1 : ckna+75,
                        ),
                      ],
                    ),
                  ],
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 8),
                      width: 40,
                      height: 40,
                      child: Center(child: Text((onh.toInt()).toString(), style: TextStyle(fontSize: 15, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.21,),
                    Container(
                      width: 100,
                      //margin: EdgeInsets.only(top: 3, bottom: 3),
                      child: Center(child: Text("Offsides", style: TextStyle(fontSize: 15, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.21,),
                    Container(
                      width: 40,
                      height: 40,
                      child: Center(child: Text((ona.toInt()).toString(), style: TextStyle(fontSize: 15, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 175,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            //margin: EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topLeft: Radius.circular(10)),
                              color: Color.fromRGBO(232, 232, 232, 0.2),
                            ),
                            height: 5,
                            width: 175,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child:Container(
                            //alignment: Alignment(20, 30),
                            margin: EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topLeft: Radius.circular(10)),
                              color: Colors.red,
                            ),
                            height: 5,
                            width: onh == 0 ? 1 : onh + 75,
                          ) ,
                          ),
                        ],
                      ),
                    ),
                    Stack(
                      children: <Widget>[
                        Container(
                          //margin: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), topRight: Radius.circular(10)),
                            color: Color.fromRGBO(232, 232, 232, 0.2),
                          ),
                          height: 5,
                          width: 175,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), topRight: Radius.circular(10)),
                            color: Colors.blue,
                          ),
                          height: 5,
                          width: ona == 0 ? 1 : ona +75,
                        ),
                      ],
                    ),
                  ],
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 8),
                      width: 40,
                      height: 40,
                      child: Center(child: Text(fh.toString(), style: TextStyle(fontSize: 15, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.21,),
                    Container(
                      width: 100,
                      //margin: EdgeInsets.only(top: 3, bottom: 3),
                      child: Center(child: Text("Fouls", style: TextStyle(fontSize: 15, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.21,),
                    Container(
                      width: 40,
                      height: 40,
                      child: Center(child: Text(fa.toString(), style: TextStyle(fontSize: 15, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 175,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            //margin: EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topLeft: Radius.circular(10)),
                              color: Color.fromRGBO(232, 232, 232, 0.2),
                            ),
                            height: 5,
                            width: 175,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child:Container(
                            //alignment: Alignment(20, 30),
                            //margin: EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topLeft: Radius.circular(10)),
                              color: Colors.red,
                            ),
                            height: 5,
                            width: fnh == 0 ? 1 : fnh + 75,
                          ) ,
                          ),
                        ],
                      ),
                    ),
                    Stack(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), topRight: Radius.circular(10)),
                            color: Color.fromRGBO(232, 232, 232, 0.2),
                          ),
                          height: 5,
                          width: 175,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), topRight: Radius.circular(10)),
                            color: Colors.blue,
                          ),
                          height: 5,
                          width: fna == 0 ? 1 : fna +75,
                        ),
                      ],
                    ),
                  ],
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 8),
                      width: 40,
                      height: 40,
                      child: Center(child: Text(ycnhi.toString(), style: TextStyle(fontSize: 15, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.21,),
                    Container(
                      width: 100,
                      //margin: EdgeInsets.only(top: 3, bottom: 3),
                      child: Center(child: Text("Yellow Cards", style: TextStyle(fontSize: 15, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.21,),
                    Container(
                      width: 40,
                      height: 40,
                      child: Center(child: Text(ycnai.toString(), style: TextStyle(fontSize: 15, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 175,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            //margin: EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topLeft: Radius.circular(10)),
                              color: Color.fromRGBO(232, 232, 232, 0.2),
                            ),
                            height: 5,
                            width: 175,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child:Container(
                            //alignment: Alignment(20, 30),
                            //margin: EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topLeft: Radius.circular(10)),
                              color: Colors.red,
                            ),
                            height: 5,
                            width: ycnh == 0|| ycnh == null ? 1 : ycnh + 75,
                          ) ,
                          ),
                        ],
                      ),
                    ),
                    Stack(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), topRight: Radius.circular(10)),
                            color: Color.fromRGBO(232, 232, 232, 0.2),
                          ),
                          height: 5,
                          width: 175,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), topRight: Radius.circular(10)),
                            color: Colors.blue,
                          ),
                          height: 5,
                          width: ycna == 0 || ycna == null ? 1 : ycna +75,
                        ),
                      ],
                    ),
                  ],
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 8),
                      width: 40,
                      height: 40,
                      child: Center(child: Text(rcnhi.toString(), style: TextStyle(fontSize: 15, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.21,),
                    Container(
                      width: 100,
                      //margin: EdgeInsets.only(top: 3, bottom: 3),
                      child: Center(child: Text("Red Cards", style: TextStyle(fontSize: 15, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.21,),
                    Container(
                      width: 40,
                      height: 40,
                      child: Center(child: Text(rcnai.toString(), style: TextStyle(fontSize: 15, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 175,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            //margin: EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topLeft: Radius.circular(10)),
                              color: Color.fromRGBO(232, 232, 232, 0.2),
                            ),
                            height: 5,
                            width: 175,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child:Container(
                            //alignment: Alignment(20, 30),
                            //margin: EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topLeft: Radius.circular(10)),
                              color: Colors.red,
                            ),
                            height: 5,
                            width: rcnh == 0 || rcnh ==null ? 1 : rcnh + 75,
                          ) ,
                          ),
                        ],
                      ),
                    ),
                    Stack(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), topRight: Radius.circular(10)),
                            color: Color.fromRGBO(232, 232, 232, 0.2),
                          ),
                          height: 5,
                          width: 175,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), topRight: Radius.circular(10)),
                            color: Colors.blue,
                          ),
                          height: 5,
                          width: rcna == 0 || rcna == null ? 1 : rcna +75,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
        )
      ),
    );

  }

    Widget _mainCard() {
      return Container(
        child: SafeArea(
          child: CustomScrollView(
            controller: _scrollController,
              slivers: <Widget>[
                SliverAppBar(
                  elevation: 0,
                  pinned: true,
                  brightness: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Brightness.light : Brightness.dark,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.white : Color(0xff0D1B26),
                  floating: false,
                  expandedHeight: MediaQuery.of(context).size.height*0.06,
                  leading: IconButton(
                  icon: Icon(Icons.arrow_back, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ?  Colors.black : Colors.white),
                    onPressed: (){Navigator.pop(context);},),
                  actions: <Widget>[IconButton(
                    icon: Icon(FontAwesomeIcons.bell, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ?  Colors.black : Colors.white,),
                    onPressed: (){}
                  ),
                  ],
                  flexibleSpace: Container(),
                  title: _showTitle ? 
  new Row(
    children: <Widget>[
      SizedBox(width: 10,),
      Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(widget.passed.image),
              fit: BoxFit.contain
            ),
          )
      ),
      SizedBox(width: 55,),
      Container(
          child: Text(widget.passed.home.toString(), style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
      ),
      SizedBox(width: 18,),
      Container(
          child: Text(":", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
      ),
      SizedBox(width: 18,),
      Container(
          child: Text(widget.passed.away.toString(), style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
      ),
      SizedBox(width: 55,),
      Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(widget.passed.img),
              fit: BoxFit.contain
            ),
          )
      ),
    ],
  ) : new Row(children: <Widget>[
                    SizedBox(width: 50),
                    Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: widget.passed.league == 'Premier League' ? Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? AssetImage('assets/images/prem_black.png') : AssetImage('assets/images/permier_white.png') : NetworkImage(widget.passed.logo),
                              fit: BoxFit.contain
                            ),
                          )
                        ),
                        SizedBox(width: 10),
                        Text(widget.passed.league)
                  ],),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    //height: 250,
                    color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.white : Color(0xff0D1B26),
                    child: Column(
                        children: <Widget>[
                          Padding(
                      padding: const EdgeInsets.only(left: 35.0, right: 30.0, top: 30.0),
                      child: Row(
                          children: <Widget>[
                            Column(
                                children: <Widget>[
                                  Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                      color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3)? Color(0xffF3F3F3) : Color(0xff0D141A) //Color(0xffE7E6E6),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Container(
                                      width: 50,
                                      height: 50, 
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                        boxShadow: [
                                          new BoxShadow(
                                            color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black12 : Colors.white10,
                                            offset: new Offset(1.0, 7.0),
                                            blurRadius: 8.0,
                                            spreadRadius: 1.0
                                          )
                                        ],
                                        color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.white : Color(0xff0D1B26)//(0xffF3F3F3)
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(12),
                                        child: new Image.network(widget.passed.image, width: 10, height: 10, fit: BoxFit.fitHeight,)),
                                      ),
                                    )
                                  ),
                                  SizedBox(height: 15,),
                                  
                                ],
                              ),
                              SizedBox(width: 30,),
                              Column(
                                children: <Widget>[
                                  SizedBox(height: 10,),
                                  Row(
                                    children: <Widget>[
                                      
                                      Container(
                                        child: Text(widget.passed.home == null ? "  " : widget.passed.home.toString(), style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,),),
                                      ),
                                      SizedBox(width: 18,),
                                      Container(
                                        child: Text(":", style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black26 : Colors.white30,),),
                                      ),
                                      SizedBox(width: 18,),
                                      Container(
                                        child: Text(widget.passed.away == null ? "  " : widget.passed.away.toString(), style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,),),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(width: 30,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                      color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3)? Color(0xffF3F3F3) : Color(0xff0D141A)//Color(0xffE7E6E6)
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Container(
                                      width: 50,
                                      height: 50, 
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                        boxShadow: [
                                          new BoxShadow(
                                            color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black12 : Colors.white10,
                                            offset: new Offset(-1.0, 7.0),
                                            blurRadius: 8.0,
                                            spreadRadius: 1.0
                                          )
                                        ],
                                        color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.white : Color(0xff0D1B26)//Color(0xffF3F3F3)
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(12),
                                        child: new Image.network(widget.passed.img, width: 10, height: 10, fit: BoxFit.contain,)),
                                      ),
                                    )
                                  ),
                                  SizedBox(height: 15,),
                                  
                                ],
                              ),
                          ],
                    )),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 15.0),
                      child: Row(
                      children: <Widget>[
                        Container(
                            width: 130,
                            child: Center(child: Text(widget.passed.titlehome, style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center)),
                          ),
                          SizedBox(width: 120,),
                          Container(
                            width: 130,
                            child: Center(child: Text(widget.passed.titleaway, style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center,)),
                          ),
                      ],
                    )),
                    Divider(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black38 : Colors.white30, endIndent: 20, indent: 20,),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 6, top: 6, left: 21, right: 21),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: datae == null ? 0 : check*24 ,
                              child: datae == null ? SizedBox(height: 0,) : Padding(
                                padding: const EdgeInsets.only(bottom: 3),
                                child: 
                                ListView.builder(
                                  //physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: false,
                                  itemBuilder: (context, index) => Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      goalt[index].team_id == widget.passed.team_idh ?
                                      Padding(
                                        padding: EdgeInsets.only(top: 3),
                                        child: Column(
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(bottom: 3),
                                              child: 
                                               checkid(goalt[index].playid) == true  ? Text("check"+ checked[0].toString()) : checkmulti(goalt[index].playid) ? Container(
                                                  width: 150,
                                                  child: Row(
                                                    children: <Widget>[
                                                      Text(goalt[index].name),
                                                      Container(
                                                        width: 50,
                                                        height: 30,
                                                        child: ListView.builder(
                                                          scrollDirection: Axis.horizontal,
                                                          itemBuilder: (context, index) => Text(mutiple[index].toString()),
                                                          itemCount: mutiple.length,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ) : Container(
                                                  width: 150,
                                                  child: Text(goalt[index].name+" "+goalt[index].time.toString()+"'", style: TextStyle(fontSize: 15, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white),)),
                                            ),
                                          ],
                                        ),
                                      )
                                      : SizedBox(height: 0),
                                    ],
                                  ),
                                  itemCount: goalt.length,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 30,),
                          widget.passed.home == null ? SizedBox(height: 0) : Container(
                              width: 20,
                              height: 20,
                              child: Image(
                                image: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? AssetImage('assets/images/black_ball.png') : AssetImage('assets/images/white_ball.png') ,
                                fit: BoxFit.contain,
                              ),
                            ),
                            SizedBox(width: 30,),
                            Expanded(
                            child: Container(
                              height: datae == null ? 0 : check*24,
                              child: datae == null ? SizedBox(height: 0,) :  Padding(
                                padding: const EdgeInsets.only(bottom: 3),
                                child: 
                                ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: false,
                                  itemBuilder: (context, index) => //Row(
                                    //children: <Widget>[
                                      SizedBox(
                                        child: goalt[index].team_id == widget.passed.team_ida ? 
                                        Padding(
                                          padding: EdgeInsets.only(top: 3),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(bottom: 3),
                                                child: 
                                                  Container(
                                                    child: SizedBox(
                                                      //width: 20,
                                                      child: 
                                                      Padding(
                                                        padding: const EdgeInsets.only(bottom: 3),
                                                        child: Text(goalt[index].name+" "+goalt[index].time.toString()+"'", style: TextStyle(fontSize: 15, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.right,),
                                                      )),
                                                  ),
                                              ),
                                            ],
                                          ),
                                        )
                                        : SizedBox(height: 0),
                                      ),
                                    //],
                                  //),
                                  itemCount: goalt.length,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                        ],
                      ),
                  ),
                ),

                /*SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) =>
                      Row(
                        children: <Widget>[
                          datae[index]['team_id'] == widget.passed.team_idh ? Column(
                            children: <Widget>[
                              datae[index]['type'] == 'Goal' ? 
                                Text(datae[index]['player'])
                              :
                                SizedBox(height: 0),
                            ],
                          ) : SizedBox(height: 0),
                        ],
                      ),
                      childCount: datae.length,
                  )
                ),*/

                SliverAppBar(
                  elevation: 0,
                  pinned: true,
                  brightness: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Brightness.light : Brightness.dark,
                  floating: false,
                  expandedHeight: 60,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Color(0xffF3F3F3) : Color(0xff0D141A),
                  automaticallyImplyLeading: false,
                  titleSpacing: 0.0,
                  title: /*Container(
                    decoration: BoxDecoration(
                     border: new Border(
                       bottom: new BorderSide(width: 1.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black38 : Colors.white24),
                     ),
                    ),
                    child: */widget.passed.home == null ?
                    datalone != null ? datalone.length == 0 && dataltwo.length == 0 ? SizedBox(height: 0,) 
                    : ToggleButtons(
                        fillColor: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.grey.shade300 : Color(0xff12233C),
                        hoverColor: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.grey.shade300 : Color(0xff12233C),
                        renderBorder: true,
                        borderColor:Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Color(0xffF3F3F3) : Color(0xff0D141A),
                        color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.grey : Colors.grey.shade300,
                        selectedColor: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,
                        children: <Widget>[
                          Container(
                            child: SizedBox(height: 0,),
                          ),
                          Container(
                            child: SizedBox(height: 0,) ,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width/3.04,
                            padding: EdgeInsets.fromLTRB(16.0, 18.0, 16.0,18.0),
                            child: Text("Lineups", style: Theme.of(context).textTheme.title.copyWith(fontSize: 16.0), textAlign: TextAlign.center,),
                          ),
                        ],
                        isSelected: [
                          _clIndex == 0 ? false : false,
                          _clIndex == 1 ? false : false,
                          _clIndex == 2 ? true : false,
                        ],
                        onPressed: (index) {
                        },
                      ) : SizedBox(height: 0,) 
                       : ToggleButtons(
                        fillColor: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.grey.shade300 : Color(0xff12233C),
                        hoverColor: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.grey.shade300 : Color(0xff12233C),
                        renderBorder: true,
                        borderColor:Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Color(0xffF3F3F3) : Color(0xff0D141A),
                        color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.grey : Colors.grey.shade300,
                        selectedColor: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width/3.04,
                            padding: EdgeInsets.fromLTRB(16.0, 18.0, 16.0,18.0),
                            child: Text("Events", style: Theme.of(context).textTheme.title.copyWith(fontSize: 16.0), textAlign: TextAlign.center,),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width/3.04,
                            padding: EdgeInsets.fromLTRB(16.0, 18.0, 16.0,18.0),
                            child: Text("Stats", style: Theme.of(context).textTheme.title.copyWith(fontSize: 16.0), textAlign: TextAlign.center,),
                          ),
                          /*Container(
                            padding: EdgeInsets.fromLTRB(16.0, 16.0, 40.0,18.0),
                            child: Text("Stats", style: Theme.of(context).textTheme.title.copyWith(fontSize: 16.0)),
                          ),*/
                          Container(
                            width: MediaQuery.of(context).size.width/3.04,
                            padding: EdgeInsets.fromLTRB(16.0, 18.0, 16.0,18.0),
                            child: Text("Lineups", style: Theme.of(context).textTheme.title.copyWith(fontSize: 16.0), textAlign: TextAlign.center,),
                          ),
                        ],
                        isSelected: [
                          _cIndex == 0 ? true : false,
                          _cIndex == 1 ? true : false,
                          _cIndex == 2 ? true : false,
                          //_cIndex == 3 ? true : false,
                        ],
                        onPressed: (index) {
                          _incrementTab(index);
                        },
                      ),
                  //),
                ),
                _cIndex == 0 && resetwidth() == true ? 
                resu == 0 || resu == null ? SliverToBoxAdapter(
                  child: Container(
                    height: 0,
                   ) ) : datae == null ? SliverToBoxAdapter(
              child: Container(height: MediaQuery.of(context).size.height*0.5,
                child: new Center(child: CircularProgressIndicator(backgroundColor: Color(0xffF3F3F3), valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),),
                ) 
                ),
                ) : SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => 
                    Column(
                      children: <Widget>[
                        halfck.isNotEmpty ? datae[index]['elapsed'] == halfck[0] && widget.passed.halfh != null && widget.passed.halfa != null ? Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 1, 0, 1),
                              width: MediaQuery.of(context).size.width,
                              child: Text("Halftime ${widget.passed.halfh} - ${widget.passed.halfa}", style: TextStyle(fontSize: 16, fontFamily: 'RobotoMed', color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,),textAlign: TextAlign.center,)
                            ),
                            Divider(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black38 : Colors.white30, endIndent: 15, indent: 15,),
                            eventCard(datae[index]['elapsed'], datae[index]['team_id'], datae[index]['player'], datae[index]['assist'], datae[index]['type'], datae[index]['detail'], index, datae[index]['player_id']),
                          ],
                        ) : 
                        eventCard(datae[index]['elapsed'], datae[index]['team_id'], datae[index]['player'], datae[index]['assist'], datae[index]['type'], datae[index]['detail'], index, datae[index]['player_id']) 
                        : datae[index]['elapsed'] == halfckn[0] && widget.passed.halfh != null && widget.passed.halfa != null ? Column(
                          children: <Widget>[
                            eventCard(datae[index]['elapsed'], datae[index]['team_id'], datae[index]['player'], datae[index]['assist'], datae[index]['type'], datae[index]['detail'], index, datae[index]['player_id']),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 1, 0, 1),
                              width: MediaQuery.of(context).size.width,
                              child: Text("Halftime ${widget.passed.halfh} - ${widget.passed.halfa}", style: TextStyle(fontSize: 16, fontFamily: 'RobotoMed', color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,),textAlign: TextAlign.center,)
                            ),
                            Divider(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black38 : Colors.white30, endIndent: 15, indent: 15,),
                          ],
                        ) : 
                        eventCard(datae[index]['elapsed'], datae[index]['team_id'], datae[index]['player'], datae[index]['assist'], datae[index]['type'], datae[index]['detail'], index, datae[index]['player_id']),
                        
                      ],
                    ),
                    childCount: datae.length
                  ),
                  ) : _cIndex == 1 && setwidth()==true ? datt == null  ? SliverToBoxAdapter(
              child: Container(height: MediaQuery.of(context).size.height*0.5,
                child: new Center(child: CircularProgressIndicator(backgroundColor: Color(0xffF3F3F3), valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),),
                ) 
                ),
                ) 
                   :
                  SliverToBoxAdapter(
                    child: Container(
                      child: statCard(datt['Shots on Goal']['home'], datt['Shots on Goal']['away'], datt['Shots off Goal']['home'], datt['Shots off Goal']['away'], datt['Total Shots']['home'], datt['Total Shots']['away'], datt['Blocked Shots']['home'], datt['Blocked Shots']['away'], datt['Shots insidebox']['home'], datt['Shots insidebox']['away'], datt['Shots outsidebox']['home'], datt['Shots outsidebox']['away'], datt['Fouls']['home'], datt['Fouls']['away'], datt['Corner Kicks']['home'], datt['Corner Kicks']['away'], datt['Offsides']['home'], datt['Offsides']['away'], datt['Ball Possession']['home'], datt['Ball Possession']['away'], datt['Yellow Cards']['home'], datt['Yellow Cards']['away'], datt['Red Cards']['home'], datt['Red Cards']['away'], datt['Goalkeeper Saves']['home'], datt['Goalkeeper Saves']['away'], datt['Total passes']['home'], datt['Total passes']['away'], datt['Passes accurate']['home'], datt['Passes accurate']['away']),
                    )
                  )
                   : SliverToBoxAdapter(
                     child: Container(
                       //width: MediaQuery.of(context).size.width,
                       child: Stack(
                         children: <Widget>[
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Column(
                               children: <Widget>[
                                 Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 50,
                                  color: Color(0xff26A945),//188632
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(widget.passed.image),
                                              fit: BoxFit.contain
                                            ),
                                          )
                                        ),
                                        Container(
                                          child: Text(widget.passed.titlehome, style: TextStyle(fontSize: 18), textAlign: TextAlign.center,),
                                        ),
                                        Spacer(),
                                        Container(
                                          child: Text(datalone['formation'], style: TextStyle(fontSize: 18),),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                 Container(
                                     height: 400,
                                     width: MediaQuery.of(context).size.width,
                                     decoration: BoxDecoration(
                                       border: new Border(
                                         //right: new BorderSide(width: 1.0, color: Colors.white),
                                         //left: new BorderSide(width: 1.0, color: Colors.white),
                                         //top: new BorderSide(width: 1.0, color: Colors.white),
                                         bottom: new BorderSide(width: 0.5, color: Color(0xff57BB8A)),
                                       ),
                                       color: Colors.green,
                                     )
                                   ),
                                   Container(
                                     height: 400,
                                     width: MediaQuery.of(context).size.width,
                                     decoration: BoxDecoration(
                                       border: new Border(
                                         //right: new BorderSide(width: 1.0, color: Colors.white),
                                         //left: new BorderSide(width: 1.0, color: Colors.white),
                                         top: new BorderSide(width: 0.5, color: Color(0xff57BB8A)),
                                         //bottom: new BorderSide(width: 1.0, color: Colors.white),
                                       ),
                                       color: Colors.green,
                                     )
                                   ),
                                   Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 50,
                                    color: Color(0xff26A945),//188632
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(widget.passed.img),
                                              fit: BoxFit.contain
                                            ),
                                          )
                                        ),
                                        Container(
                                          child: Text(widget.passed.titleaway, style: TextStyle(fontSize: 18), textAlign: TextAlign.center,),
                                        ),
                                        Spacer(),
                                        Container(
                                          child: Text(dataltwo['formation'], style: TextStyle(fontSize: 18),),
                                        )
                                      ],
                                    ),
                                  ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: new Card(
                                      elevation: 1.0,
                                      margin: EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Container(
                                          width: MediaQuery.of(context).size.width,
                                          child: Column(
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  Container(
                                                    width: 40,
                                                    height:40,
                                                    child: Image.network(widget.passed.image, fit: BoxFit.contain,),
                                                  ),
                                                  Spacer(),
                                                  Text("SUBSTITUTES", style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,)),
                                                  Spacer(),
                                                  Container(
                                                    width: 40,
                                                    height:40,
                                                    child: Image.network(widget.passed.img, fit: BoxFit.contain,),
                                                  ),
                                                ],
                                              ),
                                              datasone == null ?  SizedBox(height: 0,) : Container(
                                                margin: EdgeInsets.only(top: 5),
                                                child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: <Widget>[
                                                    Container(
                                                      margin: EdgeInsets.all(3),
                                                      height: ((datasone.length + datastwo.length)/2)*28,
                                                      width: (MediaQuery.of(context).size.width/2)-24,
                                                      child:ListView.builder(
                                                        physics: NeverScrollableScrollPhysics(),
                                                        itemCount: datasone.length,
                                                        itemBuilder: (BuildContext context, int index) {
                                                        return Container(
                                                          margin: EdgeInsets.all(5),
                                                          child: Row(
                                                            children: <Widget>[
                                                              Container(width: 30, child: Text(datasone[index]['number'].toString(), style: TextStyle(fontSize: 16, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,),textAlign: TextAlign.center,)),
                                                              Container(
                                                                margin: EdgeInsets.only(left: 3),
                                                                child: Text(datasone[index]['player'], style: TextStyle(fontSize: 16, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,),textAlign: TextAlign.left,))
                                                            ],
                                                          ),
                                                        );
                                                       },
                                                      ),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(3),
                                                      height: ((datasone.length + datastwo.length)/2)*28,
                                                      width: (MediaQuery.of(context).size.width/2)-24,
                                                      child:ListView.builder(
                                                        physics: NeverScrollableScrollPhysics(),
                                                        itemCount: datasone.length,
                                                        itemBuilder: (BuildContext context, int index) {
                                                        return Container(
                                                          margin: EdgeInsets.all(5),
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.end,
                                                            children: <Widget>[
                                                              Container(
                                                                margin: EdgeInsets.only(right: 3),
                                                                child: Text(datastwo[index]['player'], style: TextStyle(fontSize: 16, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,),textAlign: TextAlign.right,)),
                                                                Container(width: 30, child: Text(datastwo[index]['number'].toString(), style: TextStyle(fontSize: 16, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,),textAlign: TextAlign.center,)),
                                                            ],
                                                          ),
                                                        );
                                                       },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                child: Row(
                                                  children: <Widget>[
                                                    Spacer(),
                                                    Text("MANAGERS", style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,)),
                                                    Spacer()
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(top: 5),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    children: <Widget>[
                                                      Container(
                                                        margin: EdgeInsets.all(5),
                                                        child: Text(datalone['coach'], style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,),),
                                                      ),
                                                      Spacer(),
                                                      Container(
                                                        margin: EdgeInsets.all(5),
                                                        child: Text(dataltwo['coach'], style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,))
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                    ),
                                  )
                                  ),
                               ],
                             ),
                           ),
                           Positioned(
                             top: 58,
                             left: MediaQuery.of(context).size.width/2.63,
                             child: Container(
                               width: 100,
                               height: 35,
                               decoration: BoxDecoration(
                                 border: new Border(
                                   right: new BorderSide(width: 2.0, color: Color(0xff57BB8A)),
                                   left: new BorderSide(width: 2.0, color: Color(0xff57BB8A)),
                                   //top: new BorderSide(width: 2.0, color: Colors.white),
                                   bottom: new BorderSide(width: 2.0, color: Color(0xff57BB8A)),
                                 ),
                               )
                             )
                            ),
                           Positioned(
                             top: 58,
                             left: MediaQuery.of(context).size.width/3.5,
                             child: Container(
                               width: 180,
                               height: 70,
                               decoration: BoxDecoration(
                                 border: new Border(
                                   right: new BorderSide(width: 2.0, color: Color(0xff57BB8A)),
                                   left: new BorderSide(width: 2.0, color: Color(0xff57BB8A)),
                                   //top: new BorderSide(width: 2.0, color: Colors.white),
                                   bottom: new BorderSide(width: 2.0, color: Color(0xff57BB8A)),
                                 ),
                               )
                             )
                            ),
                            
                            Positioned(
                             top: 405,
                             left: MediaQuery.of(context).size.width/2.6,
                             child: Container(
                               width: 100,
                               height: 100,
                               decoration: BoxDecoration(
                                 border: new Border(
                                   right: new BorderSide(width: 2.0, color: Color(0xff57BB8A)),
                                   left: new BorderSide(width: 2.0, color: Color(0xff57BB8A)),
                                   top: new BorderSide(width: 2.0, color: Color(0xff57BB8A)),
                                   bottom: new BorderSide(width: 2.0, color: Color(0xff57BB8A)),
                                 ),
                                 borderRadius: BorderRadius.circular(50),
                               )
                             )
                            ),
                            Positioned(
                             top: 823,
                             left: MediaQuery.of(context).size.width/2.63,
                             child: Container(
                               width: 100,
                               height: 35,
                               decoration: BoxDecoration(
                                 border: new Border(
                                   right: new BorderSide(width: 2.0, color: Color(0xff57BB8A)),
                                   left: new BorderSide(width: 2.0, color: Color(0xff57BB8A)),
                                   top: new BorderSide(width: 2.0, color: Color(0xff57BB8A)),
                                   //bottom: new BorderSide(width: 2.0, color: Color(0xff57BB8A)),
                                 ),
                               )
                             )
                            ),
                            Positioned(
                             top: 788,
                             left: MediaQuery.of(context).size.width/3.5,
                             child: Container(
                               width: 180,
                               height: 70,
                               decoration: BoxDecoration(
                                 border: new Border(
                                   right: new BorderSide(width: 2.0, color: Color(0xff57BB8A)),
                                   left: new BorderSide(width: 2.0, color: Color(0xff57BB8A)),
                                   top: new BorderSide(width: 2.0, color: Color(0xff57BB8A)),
                                   //bottom: new BorderSide(width: 2.0, color: Colors.white),
                                 ),
                               )
                             )
                            ),
                            LineupHome(formhome: formhome, datallone: datallone, paletteOne: widget.paletteOne),

                            LineupAway(formaway: formaway, datalltwo: datalltwo, palette: widget.palette), 
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
      /*appBar: PreferredSize(
        child: topBar,
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height*0.07)
        ),*/
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        child: _mainCard(), 
        onRefresh: _refresh,
        ),
    );
  }
  Future<Null> _refresh() async {
    await new Future.delayed(const Duration(seconds: 2));
  }
}



class LiveDetails extends StatefulWidget {
  final Live lived;
  final List dattae;
  final PaletteGenerator palette;
  final PaletteGenerator paletteOne;
  LiveDetails({Key key, @required this.lived, @required this.dattae, @required this.palette, @required this.paletteOne}) : super(key: key);
  @override
  _LiveDetailsState createState() => _LiveDetailsState();
}

class _LiveDetailsState extends State<LiveDetails> with SingleTickerProviderStateMixin {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKeyOne =new GlobalKey<RefreshIndicatorState>();
   final String urle = "https://api-football-v1.p.rapidapi.com/v2/fixtures/live/524-775-891-525-530-514-754-780-1063?timezone=Europe/London";
   Timer timer;
   List data, dartae, datallone, datalltwo, datasone, datastwo;
   Map datastat, datstat, datalone, dataltwo, line;
   bool _showTitle = false;
   ScrollController _scrollController;
   List<CardL>cardl = [];
   List<GoalCheckL> goall = [];
   List goalhl = [];
   List goalal = [];
   List addgoals = [];
   List addplayerid = [];
   List mutiple = [];
   int inx = 0, results;
   double check = 0;
   int urls;
   double _width = 0;
   double bphn, bpan, sngnh, sngna, sognh, sogna, tsnh, tsna, bsnh, bsna, sibnh, sibna, sobnh, sobna, fnh, fna, cknh, ckna, onh, ona, ycnh, ycna, rcnh, rcna, gksnh, gksna, tpnh, tpna, panh, pana, passacuh, passacua;
   int rcnhi, rcnai, ycnhi, ycnai, panhi, panai, passacuhi, passacuai;
   var formhome, formaway;
   Animation<double> animation;
   AnimationController controller;

   @override
   void initState() {
     super.initState();
     controller = AnimationController(duration: Duration(seconds: 1), vsync: this);
    final CurvedAnimation curve = CurvedAnimation(parent: controller, curve: Curves.ease);
    animation = Tween(begin: 1.0, end: 0.2).animate(curve);
    animation.addStatusListener((status) {
      if(status == AnimationStatus.completed)
      controller.reverse();
      else if(status == AnimationStatus.dismissed) controller.forward();
    });
    controller.forward();
     urls = widget.lived.fix_id;
     getStats();
     getLine();
     timer = Timer.periodic(Duration(seconds: 120), (Timer t) => this.getStats());
     _scrollController = ScrollController()
        ..addListener((){
          //print(kToolbarHeight);
          final isNotExpanded = _scrollController.hasClients && _scrollController.offset > 200-kToolbarHeight;
          //print(_scrollController.offset);
          if (isNotExpanded != _showTitle){
            setState(() {
              //print(kToolbarHeight);
              _showTitle = isNotExpanded;
            });
          }
        });
        dartae = widget.dattae;
        dartae.sort((a,b) {
          var atime = a['elapsed'];
          var btime = b['elapsed'];
          return btime.compareTo(atime);
        });
        for (var i = 0; i < dartae.length; i++) {
          CardL cardd = new CardL(dartae[i]['player_id']);
           dartae[i]['detail'] == 'Red Card' ? cardl.add(cardd) : null;
        }
        for (var i = 0; i < dartae.length; i++) {
           GoalCheckL gol = new GoalCheckL(dartae[i]['player'], dartae[i]['team_id'], dartae[i]['elapsed']);
           if(dartae[i]['type'] == 'Goal'){
             goall.add(gol);
             if (dartae[i]['team_id'] == widget.lived.team_idh) {
               goalhl.add(dartae[i]['team_id']);
             } else {
               goalal.add(dartae[i]['team_id']);
             }
             //check = check + 1;
             print("Check##########: $check");

             
           }
          }

          if (goalhl.length > goalal.length) {
            check = (goalhl.length).toDouble();
          } else {
            check = (goalal.length).toDouble();
          }
        print(dartae.length);
   }

   

   

  Future<String> getStats() async {
    var respond = await http.get(
       Uri.encodeFull('https://api-football-v1.p.rapidapi.com/v2/statistics/fixture/$urls'),
       headers: {
        "Accept": "application/json",
        "x-rapidapi-key": "YOUR-API-KEY"
      }
     );

     

     print(respond.body);

     if (this.mounted) {
       setState(() {
          datstat = jsonDecode(respond.body);
         datstat['api']['results'] == 0 ? datastat = null : datastat = datstat['api']['statistics'];
         results = datstat['api']['results'];
         if (datstat['api']['results'] != 0) {
            var bpph = datastat['Ball Possession']['home'];
            var bppa = datastat['Ball Possession']['away'];
            var shgh = datastat['Shots on Goal']['home'];
            var shga = datastat['Shots on Goal']['away'];
            var shogh = datastat['Shots off Goal']['home'];
            var shoga = datastat['Shots off Goal']['away'];
            var totsh = datastat['Total Shots']['home'];
            var totsa = datastat['Total Shots']['away'];
            var blksh = datastat['Blocked Shots']['home'];
            var blksa = datastat['Blocked Shots']['away'];
            var shtibh = datastat['Shots insidebox']['home'];
            var shtiba = datastat['Shots insidebox']['away'];
            var shtobh = datastat['Shots outsidebox']['home'];
            var shtoba = datastat['Shots outsidebox']['away'];
            var folh = datastat['Fouls']['home'];
            var fola = datastat['Fouls']['away'];
            var conkh = datastat['Corner Kicks']['home'];
            var conka = datastat['Corner Kicks']['away'];
            var offh = datastat['Offsides']['home'];
            var offa = datastat['Offsides']['away'];
            var ycrdh = datastat['Yellow Cards']['home'];
            var ycrda = datastat['Yellow Cards']['away'];
            var rcrdh = datastat['Red Cards']['home'];
            var rcrda = datastat['Red Cards']['away'];
            var golsh = datastat['Goalkeeper Saves']['home'];
            var golsa = datastat['Goalkeeper Saves']['away'];
            var topah = datastat['Total passes']['home'];
            var topaa = datastat['Total passes']['away'];
            var accuph = datastat['Passes accurate']['home'];
            var accupa = datastat['Passes accurate']['away'];
            var passph = datastat['Passes %']['home'];
            var passpa = datastat['Passes %']['away'];
            var acuh = passph.split("%");
            var acua = passpa.split("%");
            var tata = bpph.split("%");
            var tatb = bppa.split("%");
            //print(tata);
            tata[0] == null ? bphn = 0 : bphn = double.parse(tata[0]);
            tatb[0] == null ? bpan = 0 : bpan = double.parse(tatb[0]);
            shgh == null ? sngnh = 0 : sngnh = double.parse(shgh);
            shga == null ? sngna = 0 : sngna = double.parse(shga);
            shogh == null ? sognh = 0 : sognh = double.parse(shogh);
            shoga == null ? sogna = 0 : sogna = double.parse(shoga);
            totsh == null ? tsnh = 0 : tsnh = double.parse(totsh);
            print(tsnh);
            totsa == null ? tsna = 0 : tsna = double.parse(totsa);
            blksh == null ? bsnh = 0 : bsnh = double.parse(blksh);
            blksa == null ? bsna = 0 : bsna = double.parse(blksa);
            shtibh == null ? sibnh = 0 : sibnh = double.parse(shtibh);
            shtiba == null ? sibna = 0 : sibna = double.parse(shtiba);
            shtobh == null ? sobnh = 0 : sobnh = double.parse(shtobh);
            shtoba == null ? sobna = 0 : sobna = double.parse(shtoba);
            folh == null ? fnh = 0 : fnh = double.parse(folh);
            fola == null ? fna = 0 : fna = double.parse(fola);
            conkh == null ? cknh = 0 : cknh = double.parse(conkh);
            conka == null ? ckna = 0 : ckna = double.parse(conka);
            offh == null ? onh = 0 : onh = double.parse(offh);
            offa == null ? ona = 0 : ona = double.parse(offa);
            ycrdh == null ? ycnh = 0 : ycnh = double.parse(ycrdh);
            ycrda == null ? ycnh = 0 : ycna = double.parse(ycrda);
            ycrdh == null ? ycnhi = 0 : ycnhi = int.parse(ycrdh);
            ycrda == null ? ycnai = 0 : ycnai = int.parse(ycrda);
            rcrdh == null ? rcnh = 0 : rcnh = double.parse(rcrdh);
            rcrda == null ? rcna = 0 : rcna = double.parse(rcrda);
            rcrdh == null ? rcnhi = 0 : rcnhi = int.parse(rcrdh);
            rcrda == null ? rcnai = 0 : rcnai = int.parse(rcrda);
            golsh == null ? gksnh = 0 : gksnh = double.parse(golsh);
            golsa == null ? gksna = 0 : gksna = double.parse(golsa);
            topah == null ? tpnh = 0 : tpnh = double.parse(topah);
            topaa == null ? tpna = 0 : tpna = double.parse(topaa);
            accuph == null ? panh = 0 : panh = double.parse(accuph);
            accupa == null ? pana = 0 : pana = double.parse(accupa);
            accuph == null ? panhi = 0 : panhi = int.parse(accuph);
            accupa == null ? panai = 0 : panai = int.parse(accupa);
            passph == null || passph == "nan%" ? passacuh = 0 : passacuh = double.parse(acuh[0]);
            passpa == null || passpa == "nan%" ? passacua = 0 : passacua = double.parse(acua[0]);
            passph == null ? passacuhi = 0 : passacuhi = int.parse(acuh[0]);
            passpa == null ? passacuai = 0 : passacuai = int.parse(acua[0]);
         }
       });
     }
     return "sucsses";
  }

  Future<String> getLine() async {
    var resl = await http.get(
       Uri.encodeFull('https://api-football-v1.p.rapidapi.com/v2/lineups/$urls'),
       headers: {
        "Accept": "application/json",
        "x-rapidapi-key": "YOUR-API-KEY"
      }
     );
     if(this.mounted){
       setState(() {
         line  = jsonDecode(resl.body);
         datalone = line['api']['lineUps'][widget.lived.titlehome];
         datallone = datalone['startXI'];
         datasone = datalone['substitutes'];
         print(datalone);
         if (datallone != null) {
          var fhm = datalone['formation'];
          formhome = fhm.split("-");
          print(formhome);
         }
         
         dataltwo = line['api']['lineUps'][widget.lived.titleaway];
         datalltwo = dataltwo['startXI'];
         datastwo = dataltwo['substitutes'];
         print(dataltwo);
         if (datalltwo != null) {
           var faw = dataltwo['formation'];
          formaway = faw.split("-");
          print(formaway);
         }
         
       });
     }
     return "Sucsses";
  }

  int _cIndexd = 0;
  void _incrementTab(index) {
    setState(() {
      _cIndexd = index;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  

  @override
  Widget build(BuildContext context) {

    /*final topBar = AppBar(
  elevation: 0,
  backgroundColor: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.white : Color(0xff0D1B26),
  brightness: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Brightness.light : Brightness.dark,
  leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ?  Colors.black : Colors.white),
                  onPressed: (){Navigator.pop(context);},),
                actions: <Widget>[IconButton(
                  icon: Icon(Icons.share, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ?  Colors.black : Colors.white,),
                  onPressed: (){}
                ),
                ],
                flexibleSpace: Container(height: 0,),
  title: _showTitle ? 
  new Row(
    children: <Widget>[
      SizedBox(width: 20,),
      Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(widget.lived.image),
            fit: BoxFit.contain
          ),
        )
      ),
      SizedBox(width: 40,),
      Container(
        child: Text(widget.lived.home.toString(), style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),),
      ),
      SizedBox(width: 18,),
      Container(
        child: Text(":", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),),
      ),
      SizedBox(width: 18,),
      Container(
        child: Text(widget.lived.away.toString(), style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),),
      ),
      SizedBox(width: 40,),
      Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(widget.lived.img),
            fit: BoxFit.contain
          ),
        )
      ),
    ],
  ) : new Row(
    children: <Widget>[
       SizedBox(width: 50),
                  Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? NetworkImage(widget.lived.logo) : AssetImage('assets/images/permier_white.png'),
                            fit: BoxFit.contain
                          ),
                        )
                      ),
                      SizedBox(width: 10),
                      Text(widget.lived.league)
    ],
  ),
);*/

bool checkCard(int pid) {
    if(cardl.isEmpty) {
      return false;
    } else {
      for (var i = 0; i < cardl.length; i++) {
        if(pid == cardl[i].id){
          return true;
        }
      }
    }
      //print(name);
      //print(pid);
      return false;
  }

  int incno(int indx) {
    return indx + 1;
  }

  int redno(int indx) {
    return indx - 1;
  }



Widget eventCardL(int time, int id, String name, String assist, String type, String details, int index, int plid ) {
    return new Container(
      child: new Center(
        child: new Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Card(
              color: Colors.transparent,
              elevation: 0,
              margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
              child: /*Padding(
                padding: const EdgeInsets.only(left:16.0, top: 5.0, bottom: 3.0, right: 16.0,),
                child:*/ id == widget.lived.team_idh ? 
                dartae.length != index && type == 'Card' && details == 'Red Card' && dartae[incno(index)]['detail'] == 'Yellow Card' && dartae[incno(index)]['elapsed'] == time && dartae[incno(index)]['player_id'] == plid ?
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(right: 5),
                              width: 50,
                              decoration: BoxDecoration(
                                border: new Border(
                                  right: new BorderSide(
                                    width: 1.0,
                                    color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black38 : Colors.white24,
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(time.toString()+"'", style: TextStyle(fontSize: 17, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black54 : Colors.white60,)),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 5),
                              width: 60,
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      border: new Border(
                                        right: new BorderSide(width: 1.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black12 : Colors.white10),
                                        top: new BorderSide(width: 1.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black12 : Colors.white10),
                                        bottom: new BorderSide(width: 1.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black12 : Colors.white10),
                                        left: new BorderSide(width: 1.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black12 : Colors.white10),
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                    ),
                                    child: Padding(
                                        padding: EdgeInsets.all(6),
                                        child: 
                                        new Image.network(widget.lived.image, width: 5, height: 5, fit: BoxFit.contain,)
                                        ),
                                  ),
                                  Positioned(
                                    //top: 10,
                                    left: 25,
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        border: new Border(
                                          right: new BorderSide(width: 1.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black12 : Colors.white10),
                                          top: new BorderSide(width: 1.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black12 : Colors.white10),
                                          bottom: new BorderSide(width: 1.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black12 : Colors.white10),
                                          left: new BorderSide(width: 1.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black12 : Colors.white10),
                                        ),
                                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                      ),
                                      child: Padding(
                                          padding: EdgeInsets.all(6),
                                          child: Image(
                                                image: AssetImage('assets/images/double_yellow.png'),
                                                fit: BoxFit.contain,
                                              ),
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Text(name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white)),
                            ),
                          ],
                        ),
                      ),
                      Divider(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black38 : Colors.white24, indent: 15.0, endIndent: 5.0,),
                    ],
                  )
                : type == 'Card' && details == 'Yellow Card' && checkCard(plid) == true && dartae[redno(index)]['detail'] == 'Red Card' ?
                  SizedBox(height: 0,)
                : Column(
                  children: <Widget>[
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Row(
                         //mainAxisAlignment: MainAxisAlignment.center,
                         //mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(right: 15),
                            width: 50,
                            decoration: BoxDecoration(
                              border: new Border(
                                right: new BorderSide(
                                  width: 1.0,
                                  color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black38 : Colors.white24,
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(time.toString()+"'", style: TextStyle(fontSize: 17, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black54 : Colors.white60,),),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 5),
                            width: 60,
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    border: new Border(
                                      right: new BorderSide(width: 1.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black12 : Colors.white10),
                                      top: new BorderSide(width: 1.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black12 : Colors.white10),
                                      bottom: new BorderSide(width: 1.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black12 : Colors.white10),
                                      left: new BorderSide(width: 1.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black12 : Colors.white10),
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                  ),
                                  child: Padding(
                                      padding: EdgeInsets.all(6),
                                      child: 
                                      new Image.network(widget.lived.image, width: 5, height: 5, fit: BoxFit.contain,)
                                      ),
                                ),
                                Positioned(
                                  //top: 10,
                                  left: 25,
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      border: new Border(
                                        right: new BorderSide(width: 1.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black12 : Colors.white10),
                                        top: new BorderSide(width: 1.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black12 : Colors.white10),
                                        bottom: new BorderSide(width: 1.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black12 : Colors.white10),
                                        left: new BorderSide(width: 1.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black12 : Colors.white10),
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                    ),
                                    child: Padding(
                                        padding: EdgeInsets.all(6),
                                        child: type == 'Card' ? 
                                          details == 'Yellow Card' ?
                                            Image(
                                              image: AssetImage('assets/images/yellow.png'),
                                              fit: BoxFit.contain,
                                            ) : details == 'Red Card' ? Image(
                                              image: AssetImage('assets/images/red.png'),
                                              fit: BoxFit.contain,
                                            ) : null
                                        :
                                          type == 'Goal' ?
                                            details == 'Normal Goal' ? 
                                              Image(
                                                image: AssetImage('assets/images/goal.png'),
                                                fit: BoxFit.contain,
                                              ) : details == 'Own Goal' ? Image(
                                              image: AssetImage('assets/images/own_goal.png'),
                                              fit: BoxFit.contain,
                                            ) : details == 'Missed Penalty' ? Image(
                                              image: AssetImage('assets/images/pen_missed.png'),
                                              fit: BoxFit.contain,
                                            ) : Image(
                                              image: AssetImage('assets/images/pen_scored.png'),
                                              fit: BoxFit.contain,
                                            )
                                          :
                                            Image(
                                                image: AssetImage('assets/images/subst.png'),
                                                fit: BoxFit.contain,
                                              )
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          
                          /*Center(
                            child:*/  type == 'Card' ? 
                                Container(
                              child:Text(name, textAlign: TextAlign.center, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white)))
                                :
                                type == 'Goal' ?
                                  details == 'Normal Goal' ? Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                          Text("Goal: "+name, textAlign: TextAlign.center,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white)),
                                      assist == null ? SizedBox(height: 0,) : Text("Assist: "+assist, textAlign: TextAlign.center, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white)),
                                    ],
                                  ) 
                                  : details == 'Own Goal' ? 
                                    Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                          Text("Own Goal: "+name, textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white)),
                                      assist == null ? SizedBox(height: 0,) : Text("Assist: "+assist, textAlign: TextAlign.center, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white)),
                                    ],
                                  )
                                  : details == 'Missed Penalty' ?
                                    Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                          Text("Missed Penalty: "+name, textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white)),
                                      assist == null ? SizedBox(height: 0,) : Text("Assist: "+assist, textAlign: TextAlign.center, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white)),
                                    ],
                                  ) 
                                  :
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                          Text("Penalty: "+name, textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white)),
                                      assist == null ? SizedBox(height: 0,) : Text("Assist: "+assist, textAlign: TextAlign.center, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white)),
                                    ],
                                  ) 

                                :
                                  Column(
                                  //mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                 children: <Widget>[
                                   Row(
                                     
                                     children: <Widget>[
                                       Text("In: "+name, textAlign: TextAlign.left, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white)),
                                     ],
                                   ),
                                   Text("Out: "+assist, textAlign: TextAlign.left, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white))
                                 ], 
                                ),
                            
                          //),
                        ],
                    ),
                     ),
                    Divider(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black38 : Colors.white24, indent: 15.0, endIndent: 15.0,),
                  ],
                )
                 : index >= dartae.length ?
                  type == 'Card' && details == 'Red Card' && dartae[incno(index)]['detail'] == 'Yellow Card' && dartae[incno(index)]['elapsed'] == time && dartae[incno(index)]['player_id'] == plid ?
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            
                            
                            Container(
                              child: Text(name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white)),
                            ),

                            Container(
                              margin: EdgeInsets.only(right: 5),
                              width: 60,
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        border: new Border(
                                          right: new BorderSide(width: 1.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black12 : Colors.white10),
                                          top: new BorderSide(width: 1.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black12 : Colors.white10),
                                          bottom: new BorderSide(width: 1.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black12 : Colors.white10),
                                          left: new BorderSide(width: 1.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black12 : Colors.white10),
                                        ),
                                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                      ),
                                      child: Padding(
                                          padding: EdgeInsets.all(6),
                                          child: Image(
                                                image: AssetImage('assets/images/double_yellow.png'),
                                                fit: BoxFit.contain,
                                              ),
                                          ),
                                    ),
                                  Positioned(
                                    //top: 10,
                                    left: 25,
                                    child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      border: new Border(
                                        right: new BorderSide(width: 1.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black12 : Colors.white10),
                                        top: new BorderSide(width: 1.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black12 : Colors.white10),
                                        bottom: new BorderSide(width: 1.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black12 : Colors.white10),
                                        left: new BorderSide(width: 1.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black12 : Colors.white10),
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                    ),
                                    child: Padding(
                                        padding: EdgeInsets.all(6),
                                        child: 
                                        new Image.network(widget.lived.img, width: 5, height: 5, fit: BoxFit.contain,)
                                        ),
                                  ),
                                  ),
                                  
                                ],
                              ),
                            ),

                            Container(
                              margin: EdgeInsets.only(left: 5),
                              width: 50,
                              decoration: BoxDecoration(
                                border: new Border(
                                  left: new BorderSide(
                                    width: 1.0,
                                    color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black38 : Colors.white24,
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(time.toString()+"'", style: TextStyle(fontSize: 17, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black54 : Colors.white60,)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black38 : Colors.white24, indent: 15.0, endIndent: 15.0,),
                    ],
                  ) : null
                : type == 'Card' && details == 'Yellow Card' && checkCard(plid) == true && dartae[redno(index)]['detail'] == 'Red Card' ?
                  SizedBox(height: 0,)
                : Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.end,
                         //mainAxisAlignment: MainAxisAlignment.center,
                         //mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          
                          
                          
                          /*Center(
                            child:*/  type == 'Card' ? 
                                Container(
                              child:Text(name, textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white)))
                                :
                                type == 'Goal' ?
                                  details == 'Normal Goal' ? Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                          Text("Goal: "+name, textAlign: TextAlign.right, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white)),
                                      assist == null ? SizedBox(height: 0,) : Text("Assist: "+assist, textAlign: TextAlign.right, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white)),
                                    ],
                                  ) 
                                  : details == 'Own Goal' ? 
                                    Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                          Text("Own Goal: "+name, textAlign: TextAlign.right, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white)),
                                      assist == null ? SizedBox(height: 0,) : Text("Assist: "+assist, textAlign: TextAlign.right, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white)),
                                    ],
                                  )
                                  : details == 'Missed Penalty' ?
                                    Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                          Text("Missed Penalty: "+name, textAlign: TextAlign.right, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white)),
                                      assist == null ? SizedBox(height: 0,) : Text("Assist: "+assist, textAlign: TextAlign.right, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white)),
                                    ],
                                  ) 
                                  :
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                          Text("Penalty: "+name, textAlign: TextAlign.right, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white)),
                                      assist == null ? SizedBox(height: 0,) : Text("Assist: "+assist, textAlign: TextAlign.right, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white)),
                                    ],
                                  ) 

                                :
                                  Column(
                                  //mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                 children: <Widget>[
                                   Row(
                                     
                                     children: <Widget>[
                                       Text("In: "+name, textAlign: TextAlign.right, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white)),
                                     ],
                                   ),
                                   Text("Out: "+assist, textAlign: TextAlign.right,style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white))
                                 ], 
                                ),
                            
                          //),

                          Container(
                            margin: EdgeInsets.only(left: 5),
                            width: 60,
                            child: Stack(
                              children: <Widget>[
                                Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      border: new Border(
                                        right: new BorderSide(width: 1.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black12 : Colors.white10),
                                        top: new BorderSide(width: 1.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black12 : Colors.white10),
                                        bottom: new BorderSide(width: 1.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black12 : Colors.white10),
                                        left: new BorderSide(width: 1.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black12 : Colors.white10),
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                    ),
                                    child: Padding(
                                        padding: EdgeInsets.all(6),
                                        child: type == 'Card' ? 
                                          details == 'Yellow Card' ?
                                            Image(
                                              image: AssetImage('assets/images/yellow.png'),
                                              fit: BoxFit.contain,
                                            ) : details == 'Red Card' ? Image(
                                              image: AssetImage('assets/images/red.png'),
                                              fit: BoxFit.contain,
                                            ) : null
                                        :
                                          type == 'Goal' ?
                                            details == 'Normal Goal' ? 
                                              Image(
                                                image: AssetImage('assets/images/goal.png'),
                                                fit: BoxFit.contain,
                                              ) : details == 'Own Goal' ? Image(
                                              image: AssetImage('assets/images/own_goal.png'),
                                              fit: BoxFit.contain,
                                            ) : details == 'Missed Penalty' ? Image(
                                              image: AssetImage('assets/images/pen_missed.png'),
                                              fit: BoxFit.contain,
                                            ) : Image(
                                              image: AssetImage('assets/images/pen_scored.png'),
                                              fit: BoxFit.contain,
                                            )
                                          :
                                            Image(
                                                image: AssetImage('assets/images/subst.png'),
                                                fit: BoxFit.contain,
                                              )
                                        ),
                                  ),
                                Positioned(
                                  //top: 10,
                                  left: 25,
                                  child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    border: new Border(
                                      right: new BorderSide(width: 1.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black12 : Colors.white10),
                                      top: new BorderSide(width: 1.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black12 : Colors.white10),
                                      bottom: new BorderSide(width: 1.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black12 : Colors.white10),
                                      left: new BorderSide(width: 1.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black12 : Colors.white10),
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                  ),
                                  child: Padding(
                                      padding: EdgeInsets.all(6),
                                      child: 
                                      new Image.network(widget.lived.img, width: 5, height: 5, fit: BoxFit.contain,)
                                      ),
                                ),
                                ),
                                
                              ],
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.only(left: 15),
                            width: 50,
                            decoration: BoxDecoration(
                              border: new Border(
                                left: new BorderSide(
                                  width: 1.0,
                                  color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black38 : Colors.white24,
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(time.toString()+"'", style: TextStyle(fontSize: 17, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black54 : Colors.white60,)),
                            ),
                          ),
                        ],
                    ),
                     ),
                    Divider(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black38 : Colors.white24, indent: 15.0, endIndent: 15.0,),
                  ],
                )
                
              //),
            ),
          ],
        ),
      ),
    );
  }


  statCard() {
    return Container(
      margin: EdgeInsets.only(top: 3, bottom: 10, left: 2, right: 2),
      child: Card(
        elevation: 5.0,
        color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.white : Color(0xff0D1B26),
        //margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 15, left: 10, right: 10),
            child: Column(
              //mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(widget.lived.image),
                            fit: BoxFit.contain
                          ),
                        )
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width*0.21,),
                      Container(
                        width: 100,
                        child: Center(child: Text("TEAM STATS", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,))),
                      SizedBox(width: MediaQuery.of(context).size.width*0.21,),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(widget.lived.img),
                            fit: BoxFit.contain
                          ),
                        )
                      ),
                    ],
                  ),
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 8),
                      width: 40,
                      height: 40,
                      child: Center(child: Text((bphn == null ? 0 : bphn.toInt()).toString()+"%", style: TextStyle(fontSize: 15, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.21,),
                    Container(
                      width: 100,
                      //margin: EdgeInsets.only(top: 3, bottom: 3),
                      child: Center(child: Text("Ball Possession", style: TextStyle(fontSize: 15, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.21,),
                    Container(
                      width: 40,
                      height: 40,
                      child: Center(child: Text((bpan == null ? 0 : bpan.toInt()).toString()+"%", style: TextStyle(fontSize: 15, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 175,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topLeft: Radius.circular(10)),
                              color: Color.fromRGBO(232, 232, 232, 0.2),
                            ),
                            height: 5,
                            width: 175,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child:Container(
                            //alignment: Alignment(20, 30),
                            margin: EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topLeft: Radius.circular(10)),
                              color: Colors.red,
                            ),
                            height: 5,
                            width: bphn + 75,
                          ) ,
                          ),
                        ],
                      ),
                    ),
                    Stack(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), topRight: Radius.circular(10)),
                            color: Color.fromRGBO(232, 232, 232, 0.2),
                          ),
                          height: 5,
                          width: 175,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), topRight: Radius.circular(10)),
                            color: Colors.blue,
                          ),
                          height: 5,
                          width: bpan+75,
                        ),
                      ],
                    ),
                  ],
                ),

                 Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 8),
                      width: 40,
                      height: 40,
                      child: Center(child: Text((tsnh.toInt()).toString(), style: TextStyle(fontSize: 15, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.21,),
                    Container(
                      width: 100,
                      //margin: EdgeInsets.only(top: 3, bottom: 3),
                      child: Center(child: Text("Total Shots", style: TextStyle(fontSize: 15, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.21,),
                    Container(
                      width: 40,
                      height: 40,
                      child: Center(child: Text((tsna.toInt()).toString(), style: TextStyle(fontSize: 15, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 175,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topLeft: Radius.circular(10)),
                              color: Color.fromRGBO(232, 232, 232, 0.2),
                            ),
                            height: 5,
                            width: 175,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child:Container(
                            //alignment: Alignment(20, 30),
                            margin: EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topLeft: Radius.circular(10)),
                              color: Colors.red,
                            ),
                            height: 5,
                            width: tsnh == 0 ? 1 : tsnh + 75,
                          ) ,
                          ),
                        ],
                      ),
                    ),
                    Stack(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), topRight: Radius.circular(10)),
                            color: Color.fromRGBO(232, 232, 232, 0.2),
                          ),
                          height: 5,
                          width: 175,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), topRight: Radius.circular(10)),
                            color: Colors.blue,
                          ),
                          height: 5,
                          width: tsna == 0 ? 1 : tsna +75,
                        ),
                      ],
                    ),
                  ],
                ),

                 Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 8),
                      width: 40,
                      height: 40,
                      child: Center(child: Text((sngnh.toInt()).toString(), style: TextStyle(fontSize: 15, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.21,),
                    Container(
                      width: 100,
                      //margin: EdgeInsets.only(top: 3, bottom: 3),
                      child: Center(child: Text("Shots On Goal", style: TextStyle(fontSize: 15, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.21,),
                    Container(
                      width: 40,
                      height: 40,
                      child: Center(child: Text((sngna.toInt()).toString(), style: TextStyle(fontSize: 15, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 175,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topLeft: Radius.circular(10)),
                              color: Color.fromRGBO(232, 232, 232, 0.2),
                            ),
                            height: 5,
                            width: 175,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child:Container(
                            //alignment: Alignment(20, 30),
                            margin: EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topLeft: Radius.circular(10)),
                              color: Colors.red,
                            ),
                            height: 5,
                            width: sngnh == 0 ? 1 : sngnh + 75,
                          ) ,
                          ),
                        ],
                      ),
                    ),
                    Stack(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), topRight: Radius.circular(10)),
                            color: Color.fromRGBO(232, 232, 232, 0.2),
                          ),
                          height: 5,
                          width: 175,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), topRight: Radius.circular(10)),
                            color: Colors.blue,
                          ),
                          height: 5,
                          width: sngna == 0 ? 1 : sngna +75,
                        ),
                      ],
                    ),
                  ],
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 8),
                      width: 40,
                      height: 40,
                      child: Center(child: Text((sognh.toInt()).toString(), style: TextStyle(fontSize: 15, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.21,),
                    Container(
                      width: 100,
                      //margin: EdgeInsets.only(top: 3, bottom: 3),
                      child: Center(child: Text("Shots Off Goal", style: TextStyle(fontSize: 15, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.21,),
                    Container(
                      width: 40,
                      height: 40,
                      child: Center(child: Text((sogna.toInt()).toString(), style: TextStyle(fontSize: 15, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 175,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topLeft: Radius.circular(10)),
                              color: Color.fromRGBO(232, 232, 232, 0.2),
                            ),
                            height: 5,
                            width: 175,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child:Container(
                            //alignment: Alignment(20, 30),
                            margin: EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topLeft: Radius.circular(10)),
                              color: Colors.red,
                            ),
                            height: 5,
                            width: sognh == 0 ? 1 : sognh + 75,
                          ) ,
                          ),
                        ],
                      ),
                    ),
                    Stack(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), topRight: Radius.circular(10)),
                            color: Color.fromRGBO(232, 232, 232, 0.2),
                          ),
                          height: 5,
                          width: 175,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), topRight: Radius.circular(10)),
                            color: Colors.blue,
                          ),
                          height: 5,
                          width: sogna == 0 ? 1 : sogna +75,
                        ),
                      ],
                    ),
                  ],
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 8),
                      width: 40,
                      height: 40,
                      child: Center(child: Text(passacuhi.toString()+"%", style: TextStyle(fontSize: 15, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.21,),
                    Container(
                      width: 100,
                      //margin: EdgeInsets.only(top: 3, bottom: 3),
                      child: Center(child: Text("Pass Acurracy", style: TextStyle(fontSize: 15, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.21,),
                    Container(
                      width: 40,
                      height: 40,
                      child: Center(child: Text(passacuai.toString()+"%", style: TextStyle(fontSize: 15, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 175,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topLeft: Radius.circular(10)),
                              color: Color.fromRGBO(232, 232, 232, 0.2),
                            ),
                            height: 5,
                            width: 175,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child:Container(
                            //alignment: Alignment(20, 30),
                            margin: EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topLeft: Radius.circular(10)),
                              color: Colors.red,
                            ),
                            height: 5,
                            width: passacuh + 75,
                          ) ,
                          ),
                        ],
                      ),
                    ),
                    Stack(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), topRight: Radius.circular(10)),
                            color: Color.fromRGBO(232, 232, 232, 0.2),
                          ),
                          height: 5,
                          width: 175,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), topRight: Radius.circular(10)),
                            color: Colors.blue,
                          ),
                          height: 5,
                          width: passacua +75,
                        ),
                      ],
                    ),
                  ],
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 8),
                      width: 40,
                      height: 40,
                      child: Center(child: Text((tpnh.toInt()).toString(), style: TextStyle(fontSize: 15, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.21,),
                    Container(
                      width: 100,
                      //margin: EdgeInsets.only(top: 3, bottom: 3),
                      child: Center(child: Text("Total Passes", style: TextStyle(fontSize: 15, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.21,),
                    Container(
                      width: 40,
                      height: 40,
                      child: Center(child: Text((tpna.toInt()).toString(), style: TextStyle(fontSize: 15, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 175,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topLeft: Radius.circular(10)),
                              color: Color.fromRGBO(232, 232, 232, 0.2),
                            ),
                            height: 5,
                            width: 175,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child:Container(
                            //alignment: Alignment(20, 30),
                            margin: EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topLeft: Radius.circular(10)),
                              color: Colors.red,
                            ),
                            height: 5,
                            width: tpnh == 0 ? 1 : (tpnh/10) + 75,
                          ) ,
                          ),
                        ],
                      ),
                    ),
                    Stack(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), topRight: Radius.circular(10)),
                            color: Color.fromRGBO(232, 232, 232, 0.2),
                          ),
                          height: 5,
                          width: 175,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), topRight: Radius.circular(10)),
                            color: Colors.blue,
                          ),
                          height: 5,
                          width: tpna == 0 ? 1 : (tpna/10) +75,
                        ),
                      ],
                    ),
                  ],
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 8),
                      width: 40,
                      height: 40,
                      child: Center(child: Text((cknh.toInt()).toString(), style: TextStyle(fontSize: 15, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.21,),
                    Container(
                      width: 100,
                      //margin: EdgeInsets.only(top: 3, bottom: 3),
                      child: Center(child: Text("Corners", style: TextStyle(fontSize: 15, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.21,),
                    Container(
                      width: 40,
                      height: 40,
                      child: Center(child: Text((ckna.toInt()).toString(), style: TextStyle(fontSize: 15, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 175,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topLeft: Radius.circular(10)),
                              color: Color.fromRGBO(232, 232, 232, 0.2),
                            ),
                            height: 5,
                            width: 175,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child:Container(
                            //alignment: Alignment(20, 30),
                            margin: EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topLeft: Radius.circular(10)),
                              color: Colors.red,
                            ),
                            height: 5,
                            width: cknh == 0 ? 1 : cknh + 75,
                          ) ,
                          ),
                        ],
                      ),
                    ),
                    Stack(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), topRight: Radius.circular(10)),
                            color: Color.fromRGBO(232, 232, 232, 0.2),
                          ),
                          height: 5,
                          width: 175,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), topRight: Radius.circular(10)),
                            color: Colors.blue,
                          ),
                          height: 5,
                          width: ckna == 0 ? 1 : ckna+75,
                        ),
                      ],
                    ),
                  ],
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 8),
                      width: 40,
                      height: 40,
                      child: Center(child: Text((onh.toInt()).toString(), style: TextStyle(fontSize: 15, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.21,),
                    Container(
                      width: 100,
                      //margin: EdgeInsets.only(top: 3, bottom: 3),
                      child: Center(child: Text("Offsides", style: TextStyle(fontSize: 15, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.21,),
                    Container(
                      width: 40,
                      height: 40,
                      child: Center(child: Text((ona.toInt()).toString(), style: TextStyle(fontSize: 15, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 175,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topLeft: Radius.circular(10)),
                              color: Color.fromRGBO(232, 232, 232, 0.2),
                            ),
                            height: 5,
                            width: 175,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child:Container(
                            //alignment: Alignment(20, 30),
                            margin: EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topLeft: Radius.circular(10)),
                              color: Colors.red,
                            ),
                            height: 5,
                            width: onh == 0 ? 1 : onh + 75,
                          ) ,
                          ),
                        ],
                      ),
                    ),
                    Stack(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), topRight: Radius.circular(10)),
                            color: Color.fromRGBO(232, 232, 232, 0.2),
                          ),
                          height: 5,
                          width: 175,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), topRight: Radius.circular(10)),
                            color: Colors.blue,
                          ),
                          height: 5,
                          width: ona == 0 ? 1 : ona +75,
                        ),
                      ],
                    ),
                  ],
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 8),
                      width: 40,
                      height: 40,
                      child: Center(child: Text((fnh.toInt()).toString(), style: TextStyle(fontSize: 15, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.21,),
                    Container(
                      width: 100,
                      //margin: EdgeInsets.only(top: 3, bottom: 3),
                      child: Center(child: Text("Fouls", style: TextStyle(fontSize: 15, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.21,),
                    Container(
                      width: 40,
                      height: 40,
                      child: Center(child: Text((fna.toInt()).toString(), style: TextStyle(fontSize: 15, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 175,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topLeft: Radius.circular(10)),
                              color: Color.fromRGBO(232, 232, 232, 0.2),
                            ),
                            height: 5,
                            width: 175,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child:Container(
                            //alignment: Alignment(20, 30),
                            margin: EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topLeft: Radius.circular(10)),
                              color: Colors.red,
                            ),
                            height: 5,
                            width: fnh == 0 ? 1 : fnh + 75,
                          ) ,
                          ),
                        ],
                      ),
                    ),
                    Stack(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), topRight: Radius.circular(10)),
                            color: Color.fromRGBO(232, 232, 232, 0.2),
                          ),
                          height: 5,
                          width: 175,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), topRight: Radius.circular(10)),
                            color: Colors.blue,
                          ),
                          height: 5,
                          width: fna == 0 ? 1 : fna +75,
                        ),
                      ],
                    ),
                  ],
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 8),
                      width: 40,
                      height: 40,
                      child: Center(child: Text((ycnhi.toInt()).toString(), style: TextStyle(fontSize: 15, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.21,),
                    Container(
                      width: 100,
                      //margin: EdgeInsets.only(top: 3, bottom: 3),
                      child: Center(child: Text("Yellow Cards", style: TextStyle(fontSize: 15, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.21,),
                    Container(
                      width: 40,
                      height: 40,
                      child: Center(child: Text((ycnai.toInt()).toString(), style: TextStyle(fontSize: 15, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 175,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topLeft: Radius.circular(10)),
                              color: Color.fromRGBO(232, 232, 232, 0.2),
                            ),
                            height: 5,
                            width: 175,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child:Container(
                            //alignment: Alignment(20, 30),
                            margin: EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topLeft: Radius.circular(10)),
                              color: Colors.red,
                            ),
                            height: 5,
                            width: ycnh == 0|| ycnh == null ? 1 : ycnh + 75,
                          ) ,
                          ),
                        ],
                      ),
                    ),
                    Stack(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), topRight: Radius.circular(10)),
                            color: Color.fromRGBO(232, 232, 232, 0.2),
                          ),
                          height: 5,
                          width: 175,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), topRight: Radius.circular(10)),
                            color: Colors.blue,
                          ),
                          height: 5,
                          width: ycna == 0 || ycna == null ? 1 : ycna +75,
                        ),
                      ],
                    ),
                  ],
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 8),
                      width: 40,
                      height: 40,
                      child: Center(child: Text((rcnhi.toInt()).toString(), style: TextStyle(fontSize: 15, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.21,),
                    Container(
                      width: 100,
                      //margin: EdgeInsets.only(top: 3, bottom: 3),
                      child: Center(child: Text("Red Cards", style: TextStyle(fontSize: 15, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.21,),
                    Container(
                      width: 40,
                      height: 40,
                      child: Center(child: Text((rcnai.toInt()).toString(), style: TextStyle(fontSize: 15, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.center,)),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 175,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topLeft: Radius.circular(10)),
                              color: Color.fromRGBO(232, 232, 232, 0.2),
                            ),
                            height: 5,
                            width: 175,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child:Container(
                            //alignment: Alignment(20, 30),
                            margin: EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topLeft: Radius.circular(10)),
                              color: Colors.red,
                            ),
                            height: 5,
                            width: rcnh == 0 || rcnh ==null ? 1 : rcnh + 75,
                          ) ,
                          ),
                        ],
                      ),
                    ),
                    Stack(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), topRight: Radius.circular(10)),
                            color: Color.fromRGBO(232, 232, 232, 0.2),
                          ),
                          height: 5,
                          width: 175,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), topRight: Radius.circular(10)),
                            color: Colors.blue,
                          ),
                          height: 5,
                          width: rcna == 0 || rcna == null ? 1 : rcna +75,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
        )
      ),
    );

  }




    Widget _mainCard() {
      return Container(
        child: SafeArea(
          child: CustomScrollView(
            controller: _scrollController,
              slivers: <Widget>[
                SliverAppBar(
                  elevation: 0,
                  pinned: true,
                  brightness: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Brightness.light : Brightness.dark,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.white : Color(0xff0D1B26),
                  floating: false,
                  expandedHeight: MediaQuery.of(context).size.height*0.06,
                  leading: IconButton(
                  icon: Icon(Icons.arrow_back, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ?  Colors.black : Colors.white),
                    onPressed: (){Navigator.pop(context);},),
                  actions: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: IconButton(
                      icon: Icon(FontAwesomeIcons.bell, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ?  Colors.black : Colors.white,),
                      onPressed: (){}
                  ),
                    ),
                  ],
                  flexibleSpace: Container(),
                  title: _showTitle ? 
  new Row(
    children: <Widget>[
      SizedBox(width: 10,),
      Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(widget.lived.image),
              fit: BoxFit.contain
            ),
          )
      ),
      SizedBox(width: 55,),
      Container(
          child: Text(widget.lived.home.toString(), style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
      ),
      SizedBox(width: 18,),
      Container(
          child: Text(":", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
      ),
      SizedBox(width: 18,),
      Container(
          child: Text(widget.lived.away.toString(), style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
      ),
      SizedBox(width: 55,),
      Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(widget.lived.img),
              fit: BoxFit.contain
            ),
          )
      ),
    ],
  ) : new Row(children: <Widget>[
                    SizedBox(width: 50),
                    Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: widget.lived.league == 'Premier League' ? Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? AssetImage('assets/images/prem_black.png') : AssetImage('assets/images/permier_white.png') : NetworkImage(widget.lived.logo),
                              fit: BoxFit.contain
                            ),
                          )
                        ),
                        SizedBox(width: 10),
                        Text(widget.lived.league)
                  ],),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    //height: 250,
                    color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.white : Color(0xff0D1B26),
                    child: Column(
                        children: <Widget>[
                          Padding(
                      padding: const EdgeInsets.only(left: 35.0, right: 30.0, top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Column(
                                  children: <Widget>[
                                    Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                        color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3)? Color(0xffF3F3F3) : Color(0xff0D141A), //Color(0xffE7E6E6),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Container(
                                        width: 50,
                                        height: 50, 
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                          boxShadow: [
                                            new BoxShadow(
                                              color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black12 : Colors.white10,
                                              offset: new Offset(1.0, 7.0),
                                              blurRadius: 8.0,
                                              spreadRadius: 1.0
                                            )
                                          ],
                                          color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.white : Color(0xff0D1B26)//(0xffF3F3F3)
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(12),
                                          child: new Image.network(widget.lived.image, width: 10, height: 10, fit: BoxFit.fitHeight,)),
                                        ),
                                      )
                                    ),
                                    SizedBox(height: 15,),
                                    
                                  ],
                                ),
                            ),
                              SizedBox(width: 30,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                        width: 60,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(6.0)),
                                          color: Color.fromRGBO(255, 0, 0, 0.12),
                                        ),
                                        child: Center(
                                          child: FadeTransition(
                                            opacity: animation,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Padding(
                                                  padding: const EdgeInsets.only(right: 4.0),
                                                  child: Icon(FontAwesomeIcons.solidCircle, size: 8.0, color: Color(0xffC03046),),
                                                ),
                                                Text("Live", textAlign: TextAlign.center, style: TextStyle(color: Color(0xffC03046), fontSize: 18, fontWeight: FontWeight.bold),)
                                              ],
                                            ),
                                          )
                                        ),
                                    ),
                                  ),
                                  SizedBox(height: 5,),
                                  Row(
                                    children: <Widget>[
                                      
                                      Container(
                                        child: Text(widget.lived.home.toString(), style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,)),
                                      ),
                                      SizedBox(width: 18,),
                                      Container(
                                        child: Text(":", style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,),),
                                      ),
                                      SizedBox(width: 18,),
                                      Container(
                                        child: Text(widget.lived.away.toString(), style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,),),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20,),
                                  Container(
                                    child: Text(widget.lived.time.toString()+"'", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: widget.lived.status == 'Halftime' ? Colors.yellowAccent : widget.lived.status == 'Match Finished' ? Colors.grey : Colors.lightGreenAccent,
                                  )
                                  ))
                                ],
                              ),
                              SizedBox(width: 30,),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                        color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3)? Color(0xffF3F3F3) : Color(0xff0D141A)//Color(0xffE7E6E6)
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Container(
                                        width: 50,
                                        height: 50, 
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                          boxShadow: [
                                            new BoxShadow(
                                              color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black12 : Colors.white10,
                                              offset: new Offset(-1.0, 7.0),
                                              blurRadius: 8.0,
                                              spreadRadius: 1.0
                                            )
                                          ],
                                          color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.white : Color(0xff0D1B26)//Color(0xffF3F3F3)
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(12),
                                          child: new Image.network(widget.lived.img, width: 10, height: 10, fit: BoxFit.contain,)),
                                        ),
                                      )
                                    ),
                                    SizedBox(height: 15,),
                                    
                                  ],
                                ),
                              ),
                          ],
                    )),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 15.0, top: 3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            width: 140,
                            child: Center(child: Text(widget.lived.titlehome, style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center)),
                          ),
                          //SizedBox(width: 100,),
                          Spacer(),
                          Center(
                            child: Container(
                              width: 140,
                              child: Center(child: Text(widget.lived.titleaway, style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,), textAlign: TextAlign.center,)),
                            ),
                          ),
                      ],
                    )),
                    Divider(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black38 : Colors.white30, endIndent: 20, indent: 20,),

                    Padding(
                      padding: const EdgeInsets.only(bottom: 6, top: 6, left: 21, right: 21),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: dartae == null ? 0 : check*24 ,
                              child: dartae == null ? SizedBox(height: 0,) : Padding(
                                padding: const EdgeInsets.only(bottom: 3),
                                child: 
                                ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: false,
                                  itemBuilder: (context, index) => Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      goall[index].team_id == widget.lived.team_idh ? 
                                      Padding(
                                        padding: EdgeInsets.only(top: 3),
                                        child: Column(
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(bottom: 3),
                                              child: 
                                                Container(
                                                  width: 150,
                                                  child: Text(goall[index].name+" "+goall[index].time.toString()+"'", style: TextStyle(fontSize: 15, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white),)),
                                            ),
                                          ],
                                        ),
                                      )
                                      : SizedBox(height: 0),
                                    ],
                                  ),
                                  itemCount: goall.length,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 30,),
                          Container(
                              width: 20,
                              height: 20,
                              child: Image(
                                image: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? AssetImage('assets/images/black_ball.png') : AssetImage('assets/images/white_ball.png') ,
                                fit: BoxFit.contain,
                              ),
                            ),
                            SizedBox(width: 30,),
                            Expanded(
                            child: Container(
                              height: dartae == null ? 0 : check*24,
                              child: dartae == null ? SizedBox(height: 0,) :  Padding(
                                padding: const EdgeInsets.only(bottom: 3),
                                child: 
                                ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: false,
                                  itemBuilder: (context, index) => //Row(
                                    //children: <Widget>[
                                      SizedBox(
                                        child: goall[index].team_id == widget.lived.team_ida ? 
                                        Padding(
                                          padding: EdgeInsets.only(top: 3),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(bottom: 3),
                                                child: 
                                                  Container(
                                                    child: SizedBox(
                                                      //width: 20,
                                                      child: 
                                                      Padding(
                                                        padding: const EdgeInsets.only(bottom: 3),
                                                        child: Text(goall[index].name+" "+goall[index].time.toString()+"'", style: TextStyle(fontSize: 15, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white), textAlign: TextAlign.right,),
                                                      )),
                                                  ),
                                              ),
                                            ],
                                          ),
                                        )
                                        : SizedBox(height: 0),
                                      ),
                                    //],
                                  //),
                                  itemCount: goall.length,
                                ),
                              ),
                            ),
                          ),
                          ],
                      ),
                    ),
                        ],
                      ),
                  ),
                ),
                SliverAppBar(
                  elevation: 0,
                  pinned: true,
                  floating: false,
                  //expandedHeight: 50,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.white : Color(0xff0D141A),
                  automaticallyImplyLeading: false,
                  titleSpacing: 0.0,
                  title: Container(
                    decoration: BoxDecoration(
                     border: new Border(
                       bottom: new BorderSide(width: 1.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black26 : Colors.white24),
                       top: new BorderSide(width: 1.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black26 : Colors.white24),
                     ),
                    ),
                    child: ToggleButtons(
                        fillColor: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.grey.shade300 : Color(0xff12233C),
                        hoverColor: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.grey.shade300 : Color(0xff12233C),
                        renderBorder: true,
                        borderColor:Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.white : Color(0xff0D141A),
                        color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.grey : Colors.grey.shade300,
                        selectedColor: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width/3.04,
                            padding: EdgeInsets.fromLTRB(16.0, 18.0, 16.0,18.0),
                            child: Text("Events", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, fontFamily: 'RobotoLight', letterSpacing: 1), textAlign: TextAlign.center,),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width/3.04,
                            padding: EdgeInsets.fromLTRB(16.0, 18.0, 16.0,18.0),
                            child: Text("Stats", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, fontFamily: 'RobotoLight', letterSpacing: 1), textAlign: TextAlign.center,),
                          ),
                          /*Container(
                            padding: EdgeInsets.fromLTRB(16.0, 16.0, 40.0,18.0),
                            child: Text("Stats", style: Theme.of(context).textTheme.title.copyWith(fontSize: 16.0)),
                          ),*/
                          Container(
                            width: MediaQuery.of(context).size.width/3.04,
                            padding: EdgeInsets.fromLTRB(16.0, 18.0, 16.0,18.0),
                            child: Text("Lineups", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, fontFamily: 'RobotoLight', letterSpacing: 1), textAlign: TextAlign.center,),
                          ),
                        ],
                        isSelected: [
                          _cIndexd == 0 ? true : false,
                          _cIndexd == 1 ? true : false,
                          _cIndexd == 2 ? true : false,
                          //_cIndex == 3 ? true : false,
                        ],
                        onPressed: (index) {
                          _incrementTab(index);
                        },
                      ),
                  ),
                ),
                _cIndexd == 0 ?  
                  dartae == null ? SliverToBoxAdapter(
                  child: Container(height: MediaQuery.of(context).size.height*0.5,
                    child: new Center(child: CircularProgressIndicator(backgroundColor: Color(0xffF3F3F3), valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),),
                    ) 
                    ),
                    ): SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => 
                        eventCardL(dartae[index]['elapsed'], dartae[index]['team_id'], dartae[index]['player'], dartae[index]['assist'], dartae[index]['type'], dartae[index]['detail'], index, dartae[index]['player_id']),

                        childCount: dartae.length
                      ),
                    )
                : 
                  _cIndexd == 1 ? 
                    datstat == null ?
                  SliverToBoxAdapter(
                child: Container(height: MediaQuery.of(context).size.height*0.5,
                  child: new Center(child: CircularProgressIndicator(backgroundColor: Color(0xffF3F3F3), valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),),
                  ) 
                  ),
                  ) : results == 0 ? SliverToBoxAdapter(
              child: Container(height: MediaQuery.of(context).size.height*0.5,
                child: new Center(child: Text("No Statistics Available"),
                ) 
                ),
                )
                  : 
                  SliverToBoxAdapter(
                    child: Container(
                      child: statCard(),
                    ),
                  )
                :
                datallone == null || datalltwo == null ? SliverToBoxAdapter(
              child: Container(height: MediaQuery.of(context).size.height*0.5,
                child: new Center(child: Text("No Lineups Available"),
                ) 
                ),
                ) : SliverToBoxAdapter(
                  child: Container(
                       //width: MediaQuery.of(context).size.width,
                       child: Stack(
                         children: <Widget>[
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Column(
                               children: <Widget>[
                                 Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 50,
                                  color: Color(0xff26A945),//188632
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(widget.lived.image),
                                              fit: BoxFit.contain
                                            ),
                                          )
                                        ),
                                        Container(
                                          child: Text(widget.lived.titlehome, style: TextStyle(fontSize: 18), textAlign: TextAlign.center,),
                                        ),
                                        Spacer(),
                                        Container(
                                          child: Text(datalone['formation'], style: TextStyle(fontSize: 18),),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                 Container(
                                     height: 400,
                                     width: MediaQuery.of(context).size.width,
                                     decoration: BoxDecoration(
                                       border: new Border(
                                         //right: new BorderSide(width: 1.0, color: Colors.white),
                                         //left: new BorderSide(width: 1.0, color: Colors.white),
                                         //top: new BorderSide(width: 1.0, color: Colors.white),
                                         bottom: new BorderSide(width: 0.5, color: Color(0xff57BB8A)),
                                       ),
                                       color: Colors.green,
                                     )
                                   ),
                                   Container(
                                     height: 400,
                                     width: MediaQuery.of(context).size.width,
                                     decoration: BoxDecoration(
                                       border: new Border(
                                         //right: new BorderSide(width: 1.0, color: Colors.white),
                                         //left: new BorderSide(width: 1.0, color: Colors.white),
                                         top: new BorderSide(width: 0.5, color: Color(0xff57BB8A)),
                                         //bottom: new BorderSide(width: 1.0, color: Colors.white),
                                       ),
                                       color: Colors.green,
                                     )
                                   ),
                                   Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 50,
                                    color: Color(0xff26A945),//188632
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(widget.lived.img),
                                              fit: BoxFit.contain
                                            ),
                                          )
                                        ),
                                        Container(
                                          child: Text(widget.lived.titleaway, style: TextStyle(fontSize: 18), textAlign: TextAlign.center,),
                                        ),
                                        Spacer(),
                                        Container(
                                          child: Text(dataltwo['formation'], style: TextStyle(fontSize: 18),),
                                        ),
                                      ],
                                    ),
                                  ),
                                  ),
                                  Container(
                                          width: MediaQuery.of(context).size.width,
                                          child: new Card(
                                            elevation: 1.0,
                                            margin: EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                                            child: Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Container(
                                                width: MediaQuery.of(context).size.width,
                                                child: Column(
                                                  children: <Widget>[
                                                    Row(
                                                      children: <Widget>[
                                                        Container(
                                                          width: 40,
                                                          height:40,
                                                          child: Image.network(widget.lived.image, fit: BoxFit.contain,),
                                                        ),
                                                        Spacer(),
                                                        Text("SUBSTITUTES", style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,)),
                                                        Spacer(),
                                                        Container(
                                                          width: 40,
                                                          height:40,
                                                          child: Image.network(widget.lived.img, fit: BoxFit.contain,),
                                                        ),
                                                      ],
                                                    ),
                                                    datasone == null ?  SizedBox(height: 0,) : Container(
                                                      margin: EdgeInsets.only(top: 5),
                                                      child: Row(
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: <Widget>[
                                                          Container(
                                                            margin: EdgeInsets.all(3),
                                                            height: ((datasone.length + datastwo.length)/2)*28,
                                                            width: (MediaQuery.of(context).size.width/2)-24,
                                                            child:ListView.builder(
                                                              physics: NeverScrollableScrollPhysics(),
                                                              itemCount: datasone.length,
                                                              itemBuilder: (BuildContext context, int index) {
                                                              return Container(
                                                                margin: EdgeInsets.all(5),
                                                                child: Row(
                                                                  children: <Widget>[
                                                                    Container(width: 30, child: Text(datasone[index]['number'].toString(), style: TextStyle(fontSize: 16, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,),textAlign: TextAlign.center,)),
                                                                    Container(
                                                                      margin: EdgeInsets.only(left: 3),
                                                                      child: Text(datasone[index]['player'], style: TextStyle(fontSize: 16, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,),textAlign: TextAlign.left,))
                                                                  ],
                                                                ),
                                                              );
                                                            },
                                                            ),
                                                          ),
                                                          Container(
                                                            margin: EdgeInsets.all(3),
                                                            height: ((datasone.length + datastwo.length)/2)*28,
                                                            width: (MediaQuery.of(context).size.width/2)-24,
                                                            child:ListView.builder(
                                                              physics: NeverScrollableScrollPhysics(),
                                                              itemCount: datasone.length,
                                                              itemBuilder: (BuildContext context, int index) {
                                                              return Container(
                                                                margin: EdgeInsets.all(5),
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                  children: <Widget>[
                                                                    Container(
                                                                      margin: EdgeInsets.only(right: 3),
                                                                      child: Text(datastwo[index]['player'], style: TextStyle(fontSize: 16, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,),textAlign: TextAlign.right,)),
                                                                      Container(width: 30, child: Text(datastwo[index]['number'].toString(), style: TextStyle(fontSize: 16, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,),textAlign: TextAlign.center,)),
                                                                  ],
                                                                ),
                                                              );
                                                            },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      child: Row(
                                                        children: <Widget>[
                                                          Spacer(),
                                                          Text("MANAGERS", style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,)),
                                                          Spacer()
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(top: 5),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Row(
                                                          children: <Widget>[
                                                            Container(
                                                              margin: EdgeInsets.all(5),
                                                              child: Text(datalone['coach'], style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,)),
                                                            ),
                                                            Spacer(),
                                                            Container(
                                                              margin: EdgeInsets.all(5),
                                                              child: Text(dataltwo['coach'], style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white,)),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                          ),
                                        )
                                        ),
                               ],
                             ),
                           ),
                           Positioned(
                             top: 58,
                             left: MediaQuery.of(context).size.width/2.63,
                             child: Container(
                               width: 100,
                               height: 35,
                               decoration: BoxDecoration(
                                 border: new Border(
                                   right: new BorderSide(width: 2.0, color: Color(0xff57BB8A)),
                                   left: new BorderSide(width: 2.0, color: Color(0xff57BB8A)),
                                   //top: new BorderSide(width: 2.0, color: Colors.white),
                                   bottom: new BorderSide(width: 2.0, color: Color(0xff57BB8A)),
                                 ),
                               )
                             )
                            ),
                           Positioned(
                             top: 58,
                             left: MediaQuery.of(context).size.width/3.5,
                             child: Container(
                               width: 180,
                               height: 70,
                               decoration: BoxDecoration(
                                 border: new Border(
                                   right: new BorderSide(width: 2.0, color: Color(0xff57BB8A)),
                                   left: new BorderSide(width: 2.0, color: Color(0xff57BB8A)),
                                   //top: new BorderSide(width: 2.0, color: Colors.white),
                                   bottom: new BorderSide(width: 2.0, color: Color(0xff57BB8A)),
                                 ),
                               )
                             )
                            ),
                            
                            Positioned(
                             top: 405,
                             left: MediaQuery.of(context).size.width/2.6,
                             child: Container(
                               width: 100,
                               height: 100,
                               decoration: BoxDecoration(
                                 border: new Border(
                                   right: new BorderSide(width: 2.0, color: Color(0xff57BB8A)),
                                   left: new BorderSide(width: 2.0, color: Color(0xff57BB8A)),
                                   top: new BorderSide(width: 2.0, color: Color(0xff57BB8A)),
                                   bottom: new BorderSide(width: 2.0, color: Color(0xff57BB8A)),
                                 ),
                                 borderRadius: BorderRadius.circular(50),
                               )
                             )
                            ),
                            Positioned(
                             top: 823,
                             left: MediaQuery.of(context).size.width/2.63,
                             child: Container(
                               width: 100,
                               height: 35,
                               decoration: BoxDecoration(
                                 border: new Border(
                                   right: new BorderSide(width: 2.0, color: Color(0xff57BB8A)),
                                   left: new BorderSide(width: 2.0, color: Color(0xff57BB8A)),
                                   top: new BorderSide(width: 2.0, color: Color(0xff57BB8A)),
                                   //bottom: new BorderSide(width: 2.0, color: Color(0xff57BB8A)),
                                 ),
                               )
                             )
                            ),
                            Positioned(
                             top: 788,
                             left: MediaQuery.of(context).size.width/3.5,
                             child: Container(
                               width: 180,
                               height: 70,
                               decoration: BoxDecoration(
                                 border: new Border(
                                   right: new BorderSide(width: 2.0, color: Color(0xff57BB8A)),
                                   left: new BorderSide(width: 2.0, color: Color(0xff57BB8A)),
                                   top: new BorderSide(width: 2.0, color: Color(0xff57BB8A)),
                                   //bottom: new BorderSide(width: 2.0, color: Colors.white),
                                 ),
                               )
                             )
                            ),
                            LineupHome(formhome: formhome, datallone: datallone, paletteOne: widget.paletteOne),

                            LineupAway(formaway: formaway, datalltwo: datalltwo, palette: widget.palette), 
                         ],
                       ),
                     ),
                  //child: Text(widget.livee[0]['elapsed']),
                ),
              ],
            ),
        ),
      );
    }

    return Scaffold(
      /*appBar: PreferredSize(
        child: topBar,
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height*0.07)
        ),*/
      body: RefreshIndicator(
        key: _refreshIndicatorKeyOne,
        child: _mainCard(), 
        onRefresh: _refresh,
        ),
    );
  }
  Future<Null> _refresh() async {
    await new Future.delayed(const Duration(seconds: 2));
  }

}
