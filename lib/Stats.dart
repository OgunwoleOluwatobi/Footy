import 'dart:async';
import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:footyappp/app/core/models/league_stat.dart';
import 'package:footyappp/app/core/services/http/http_service.dart';
import 'package:footyappp/app/locator.dart';
import 'package:footyappp/views/widgets/utility_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;

class Leagues {
  String id;
  String name;

  Leagues(this.id, this.name);

  static List<Leagues> getLeagues() {
    return <Leagues>[
      Leagues('premier', 'PL'),
      Leagues('laliga', 'La Liga'),
      Leagues('seriea', 'Serie A'),
      Leagues('bundesliga', 'Bundesliga'),
      Leagues('ligue1', 'Ligue 1'),
      Leagues('champions', 'UCL'),
      Leagues('europa', 'UEL'),
    ];
  }
}

class Stats extends StatefulWidget {
  const Stats({Key key}) : super(key: key);
  @override
  _StatsState createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =new GlobalKey<RefreshIndicatorState>();

  final HttpService _httpService = locator<HttpService>();

  final String url = "https://api-football-v1.p.rapidapi.com/v2/topscorers/524";
  List data;
  Timer timer;
  String selectedLeague = 'premier';
  Map leagues = {
    'premier': '17/season/29415',
    'laliga': '8/season/32501',
    'seriea': '23/season/32523',
    'ligue1': '34/season/28222',
    'bundesliga': '35/season/28210',
    'champions': '7/season/29267',
    'europa': '679/season/29343',
  };
  LeagueStat stats;
  List<Leagues> _leagues = Leagues.getLeagues();
  List<DropdownMenuItem<Leagues>> _dropdownMenuItems;
  Leagues _selectedLeague;
  
  @override
  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropdownMenuItems(_leagues);
    _selectedLeague = _dropdownMenuItems[0].value;
    selectedLeague = _dropdownMenuItems[0].value.id;
    getData();
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

  onChangedDropdownItem(Leagues selectedLeagues) {
    setState(() {
      stats = null;
      _selectedLeague = selectedLeagues;
      selectedLeague = selectedLeagues.id;
      getData();
    });
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

  Future getData() async {
    await _httpService.getHttp('/unique-tournament/${leagues[selectedLeague]}/top-players/overall', sofa: true)
      .then((value) {
        setState(() {
          stats = LeagueStat.fromJson(value);
        });
      }).catchError(
        (e) => print(e)
      );
  }

  @override
  Widget build(BuildContext context) {

    Widget maincard({String title, String name, int stat, int id, String tag}){
      return Container(
        child: Column(
          children: [
            GestureDetector(
              child: Card(
                elevation: 2,
                margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 150.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                        ),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: '${env['API_SOFA']}/player/$id/image',
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 8.h),
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Text(
                        name,
                        style: TextStyle(
                          color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black87 : Colors.white70,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 4.h),
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Text(
                        '$tag: $stat',
                        style: TextStyle(
                          color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black54 : Colors.white60,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    SizedBox(height: 4.h,)
                  ],
                ),
              ),
              onTap: () {
              },
            ),
            // Text(
            //   title,
            //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white),
            // )
          ],
        ),
      );
    }

    return Scaffold(
      //backgroundColor: Color(0xffF3F3F3),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height*0.07),
        child: topAppBar(
          context,
          action: [
            Row(
              children: <Widget>[
                Container(
                width: 20,
                height: 40,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: stats == null ? AssetImage('assets/images/fill.png') : selectedLeague == 'premier' ? Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? AssetImage('assets/images/prem_black.png') : AssetImage('assets/images/permier_white.png') : selectedLeague == 'champion' ? Theme.of(context).scaffoldBackgroundColor != Color(0xffF3F3F3) ? AssetImage('assets/images/ucl_white.png') : AssetImage('assets/images/fill.png') :  AssetImage('assets/images/fill.png'),
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
            ),
          ]
        ),
      ),
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: getData,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 40.w, top: 30.h, bottom: 20.h),
                child: Text(
                  "Stats",
                  style: TextStyle(color: Colors.grey, fontSize: 75.sp, fontWeight: FontWeight.bold,),
                  textAlign: TextAlign.start,
                ),
              ),
              Expanded(
                child: stats == null ? Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Color(0xffF3F3F3),
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                  ),
                ) : GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: .8,
                  children: [
                    maincard(
                      title: 'TopScorer', 
                      name: stats == null ? "" : stats.topPlayers.goals[0].player.name, 
                      stat: stats == null ? "" : stats.topPlayers.goals[0].statistics.goals,
                      id: stats.topPlayers.goals[0].player.id,
                      tag: 'Goals'
                    ),
                    maincard(
                      title: 'Assists',
                      name: stats == null ? "" : stats.topPlayers.assists[0].player.name, 
                      stat: stats == null ? "" : stats.topPlayers.assists[0].statistics.assists,
                      id: stats.topPlayers.assists[0].player.id,
                      tag: 'Assists'
                    ),
                    maincard(
                      title: 'CleanSheets', 
                      name: stats == null ? "" : stats.topPlayers.cleanSheet[0].player.name, 
                      stat: stats == null ? "" : stats.topPlayers.cleanSheet[0].statistics.cleanSheet,
                      id: stats.topPlayers.cleanSheet[0].player.id,
                      tag: 'Cleansheets'
                    ),
                    maincard(
                      title: 'Saves', 
                      name: stats == null ? "" : stats.topPlayers.saves[0].player.name, 
                      stat: stats == null ? "" : stats.topPlayers.saves[0].statistics.saves,
                      id: stats.topPlayers.saves[0].player.id,
                      tag: 'Saves'
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
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