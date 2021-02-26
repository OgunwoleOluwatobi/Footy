import 'dart:async';
import 'dart:core';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:palette_generator/palette_generator.dart';
import 'Posts.dart';
import 'string_extension.dart';


/*void main() => runApp(MaterialApp(
   home: HomePage(),
   debugShowCheckedModeBanner: false,
   theme: new ThemeData(
     primaryColor: Color(0xffF3F3F3),
     brightness: Brightness.dark
   ),
  ),
 );*/

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =new GlobalKey<RefreshIndicatorState>();
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final db = Firestore.instance;
  ScrollController _scrollController = new ScrollController();
  int lastPost;
  bool full;

  List<Posts> postList = [];

  _getToken() async {
    String deviceToken = await _firebaseMessaging.getToken();//.then((deviceToken) {
      print("Device Token: $deviceToken");
      //String token = deviceToken;
     // DocumentReference ref = await db.collection('DeviceTokens').add({'deviceToken': '$deviceToken'});
   // });
   var token = db.collection('DeviceTokens');
   //await token.add({'deviceToken': '$deviceToken'});
   //QuerySnapshot querySnapshot = await db.collection('DeviceTokens').getDocuments().then((snapshot) {
     //if(snapshot.documents.length > 0) {
        
     //}
     //snapshot.forEach()
   //});
   Future <List <DocumentSnapshot>> list() async {
     var data = await db.collection('DeviceTokens').getDocuments();
     var tokent = data.documents;
     return tokent;
   }

   list().then((data) async {
     if(data.isEmpty){
       await token.add({'deviceToken': '$deviceToken'});
     }
     data.forEach((val) async => deviceToken != val['deviceToken'] ? await token.add({'deviceToken': '$deviceToken'}) : null);
   });
   
   //list.forEach(
     //(data) async => data.exists ? deviceToken != data['deviceToken'] ?  
     //await token.add({'deviceToken': '$deviceToken'}) : null :null,
     //);
   
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

  @override
  void initState() {
    super.initState();
    _getToken();
    
    _configureFirebaseListeners();
    DatabaseReference postRef = FirebaseDatabase.instance.reference().child("Posts");
    postRef.orderByChild("index").limitToFirst(5).onChildAdded.listen((Event event){
      //var keys = event.snapshot.value.keys;
      Map<dynamic, dynamic> data = event.snapshot.value;
      //var no = DATA.sort((a,b)=>a.value['title'].compareTo(b.value['title']));
      //print('KEY: $data');
      //print(DATA);
      //postRef.orderByChild("data");
      //postList.clear();
      //for(var individualKey in data){
        //print(individualKey);
        //var no = DATA.sort((a,b)=>a['title'].compareTo(b[individualKey]['title']));
        lastPost = data['index'];
        Posts posts = new Posts(
          data['image'],
          data['title'],
          data['description'],
          data['date'],
          data['time'],
          );
          print(posts);
          postList.add(posts);
      //}
      if(this.mounted) {
        setState(() {
        print('Length : $postList.length') ;
        });
      }
    });

    _scrollController.addListener(() {
      //print(_scrollController.position.pixels);
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        _fetch();
      }
    });
    full = false;
  }
  
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  _fetch() async {
    print(lastPost);
    setState(() {
      if (lastPost < -1) {
        print("here");
        DatabaseReference postRef = FirebaseDatabase.instance.reference().child("Posts");
        postRef.orderByChild('index').startAt(lastPost+1).limitToFirst(5).onChildAdded.listen((Event event){
          Map<dynamic, dynamic> data = event.snapshot.value;
          lastPost = data['index'];
            Posts posts = new Posts(
              data['image'],
              data['title'],
              data['description'],
              data['date'],
              data['time'],
              );
              print(posts);
              postList.add(posts);
          if(this.mounted) {
            setState(() {
            print('Length : $postList.length') ;
            });
          }
        });
        print(postList.length);
      } else {
        full = true;
      }
    });
  }

  Future _generatePalette(context, String imgpath, int index) async {
    PaletteGenerator _paletteGenerator = await PaletteGenerator.fromImageProvider(
      NetworkImage(imgpath),
      size: Size(110, 150),
      maximumColorCount: 20
    );

    return _paletteGenerator;
  }

  

  @override
  Widget build(BuildContext context) {

     //var logoUri = new AssetImage('assets/small.png');
     //var logoImage = new Image(image: logoUri);
     /*SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xff0D141A),
      statusBarIconBrightness: Brightness.light,
      ));*/

    
      Widget title = new Container(
        margin: EdgeInsets.only(left: 3, top: 5, bottom: 6),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Image.asset(
              'assets/logo.png',
              height: 62.0,
              width: 62.0,
              //alignment: Alignment(x, y),
              
              ),
              Container(

                margin: EdgeInsets.only(top: 10, bottom: 0),
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
      /*actions: <Widget>[
        IconButton(
          icon: Icon(Icons.list),
          onPressed: () {},
        )
      ],*/
    );

    

    Widget postsUI(String image, String title, String description, String date, String time, int index){

    final makeListCard = ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0,),
      leading: Container(
        width: 100,
        padding: EdgeInsets.only(right: 3.0),
        decoration: new BoxDecoration(
          border: new Border(
            right: new BorderSide(width: 1.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black38 : Colors.white24),
          )
        ),
        child: CachedNetworkImage(
          imageUrl: image,
          fit: BoxFit.cover,
        ),
      ),
      title: new Text(
        date +'     '+time,
        style: Theme.of(context).textTheme.body1.copyWith(fontSize: 11),
      ),
      subtitle: Row(

        children: <Widget>[
          Icon(Icons.linear_scale, color: Colors.greenAccent),
          SizedBox(width: 10,),
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.only(top: 7),
              child: new Text(
              title.capitalize(),
              style: Theme.of(context).textTheme.title.copyWith(fontSize: 19, letterSpacing: 0.8,), maxLines: 2, overflow: TextOverflow.ellipsis,
            )),
          )
        ],
      ),
      trailing: Icon(Icons.keyboard_arrow_right, color: Theme.of(context).iconTheme.color, size: 20.0,),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Detail(postt: postList[index])));
        /*_generatePalette(context, postList[index].image, index).then((_palette) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Details(postt: postList[index], palette: _palette)),);
        });*/
      },
    );

    return new Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
      elevation: 0,
      //color: Colors.white30,
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
      //color: Color(0xffF3F3F3),
      child: makeListCard
      /*new Container(
        padding: new EdgeInsets.all(14.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text(
                  date,
                  style: Theme.of(context).textTheme.subtitle,
                  textAlign: TextAlign.center,
                ),
                new Text(
                  time,
                  style: Theme.of(context).textTheme.subtitle,
                  textAlign: TextAlign.center,
                ),
              ],
            ),

            SizedBox(height: 10.0,),
            new Image.network(image, fit: BoxFit.cover),
            SizedBox(height: 10.0,),
            new Text(
                  description,
                  style: Theme.of(context).textTheme.subhead,
                  textAlign: TextAlign.center,
                ),
          ],
        ),
      ),*/
    );
  }

  Widget postsUIS(String image, String title, String description, String date, String time, int index){
    final specialCard = Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: 180.0,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              title.capitalize(),
              style: Theme.of(context).textTheme.title.copyWith(fontSize: 25.0, letterSpacing: 1), maxLines: 2, overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: <Widget>[
                Text(
                  date+", "+time,
                  style: Theme.of(context).textTheme.body1.copyWith(fontSize: 14.0),
                ),
                Spacer(),
                Text(
                  "Football",
                  style: Theme.of(context).textTheme.body1.copyWith(fontSize: 14.0),
                )
              ],
            ),
          ),
          const SizedBox(height: 20.0,)
            ],
          ),
          Positioned(
            top: 170,
            left: 20.0,
            child: Container(
              color: Colors.green,
              padding: const EdgeInsets.all(4.0),
              child: Text(
                "Latest",
                style: TextStyle(color: Colors.white, fontSize:12.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      );

    return GestureDetector(
      child: Card(
        elevation: 2.0,
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        //color: Colors.white,
        child: specialCard
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Detail(postt: postList[index])));
        /*_generatePalette(context, postList[index].image, index).then((_palette) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Details(postt: postList[index], palette: _palette)),);
        });*/
      },
    );
  }

    Widget _buildSuggestions() {
      return new Container(
        //key: PageStorageKey('Page 1'),
        child:
            postList.length == 0 ? new Center(child: CircularProgressIndicator(backgroundColor: Color(0xffF3F3F3), valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),),) /*new Text("No Blog Post Avaliable at the Moment")*/ : CustomScrollView(
              key: PageStorageKey('Page 1'),
              controller: _scrollController,
              slivers: <Widget>[
              //mainAxisAlignment: MainAxisAlignment.center,
              //children: <Widget>[
                 //Column(
                  //children: <Widget>[
                    SliverToBoxAdapter(
                      child: Column(
                        children: <Widget>[
                          PicCarousel(),
                          SizedBox(height: 20.0,)
                          
                        ],
                      ),
                    ),
                    SliverToBoxAdapter(
                      child:  Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 25, top: 20),
                            child: Text("News Feed", style: TextStyle(fontSize: 27, fontFamily: 'Roboto', letterSpacing: 0.5, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black : Colors.white, decoration: TextDecoration.none), textAlign: TextAlign.left,),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 0.0, top: 2),
                            child: Divider(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black38 : Colors.white24, endIndent: 15, indent: 15,),
                          ),
                        ],
                      ),
                    ),

                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => 
                         index == postList.length ? 
                         AnimatedContainer(
                           duration: Duration(seconds: 1),
                           width: full == true ? 0 : 20,
                           height: full == true ? 0 : 20,
                           child: CupertinoActivityIndicator(),
                          ) : index == 0 ? new Column(children: <Widget>[postsUIS(postList[index].image, postList[index].title, postList[index].description, postList[index].date, postList[index].time, index),const SizedBox(height: 10.0,), Divider(color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Colors.black26 : Colors.white12, endIndent: 12, indent: 12,), const SizedBox(height: 10.0,)],) : 
                        
                        postsUI(postList[index].image, postList[index].title, postList[index].description, postList[index].date, postList[index].time, index),
                        childCount: postList.length+1,
                      ),
                    ),
                    
                  
                
                  ],
                ),
                  
                
             // ],
            //),
            
      );
    }

      

    return Scaffold(
      //backgroundColor: Color(0xffF3F3F3),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height*0.07),
        child: topAppBar,
      ),
      body:
          RefreshIndicator(
            key: _refreshIndicatorKey,
            onRefresh: _refresh,
            child:
            _buildSuggestions(),
              
          ),
      
      
       /*fit: StackFit.expand,
         children: <Widget>[
           Positioned(
            top: 30,
            left: 10,
            width: 60,
            height: 70,
            child: Image.asset('assets/small.png'),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text('Hello'),
          )
         ],*/
      );
  }

  Future<Null> _refresh() async {
    await new Future.delayed(const Duration(seconds: 2));
    postList.clear();
    setState(() {
     DatabaseReference postRef = FirebaseDatabase.instance.reference().child("Posts");
      postRef.orderByChild('Timestamp').onChildAdded.listen((Event event){
        //var keys = event.snapshot.value.keys;
        Map<dynamic, dynamic> data = event.snapshot.value;
        print('KEY: $data');
          Posts posts = new Posts(
            data['image'],
            data['title'],
            data['description'],
            data['date'],
            data['time'],
            );
            print(posts);
            postList.add(posts);
        setState(() {
        print('Length : $postList.length') ;
        });
      });
    });

  
    }

  
}

class PicCarousel extends StatefulWidget {
      @override
      _PicCarouselState createState() => _PicCarouselState();
    }
    
    class _PicCarouselState extends State<PicCarousel> {

      static final List<String> imgList = ["leagued.jpg", "roundup.png", "plain.png", "united.jpeg", "Liverpool.jpeg", "Chealsea.jpeg"];

      final List<Widget> child = _map<Widget>(imgList, (index, String assetName){
        return Container(
          //decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10.0))),
          child: ClipRRect(
            //borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Image.asset("assets/$assetName", height: 250, fit: BoxFit.contain)),
        );
      }).toList();
      static List<T> _map<T>(List list, Function handler) {
        List<T> result = [];
        for(var i=0; i < list.length; i++){
          result.add(handler(i, list[i]));
        }
        return result;
      }
      int _current = 0;

      @override
      Widget build(BuildContext context) {
        return Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Container(
                height: 230,
                width: MediaQuery.of(context).size.width,
                //margin: EdgeInsets.symmetric(horizontal: 2.5, vertical: 3.0),
                //decoration: new BoxDecoration(borderRadius: BorderRadius.circular(50.0)),
                //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                child: CarouselSlider(
                  scrollPhysics: BouncingScrollPhysics(),
                    height: 250,
                    viewportFraction: 1.0,
                    //reverse: true,
                    enableInfiniteScroll: true,
                    items: child,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 8),
                    onPageChanged: (index) {
                      setState(() {
                        _current = index;
                      });
                    },
                ),
              ),
            ),
            Positioned(
              top: 200.0,
              left: 0.0,
              right: 0.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _map<Widget>(imgList, (index, String assetName){
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _current == index ? Color.fromRGBO(0, 0, 0, 0.4) : Color.fromRGBO(225, 225, 225, 0.9)
                    ),
                  );
                }),
            ),
            ),
            /*Container(
              margin: EdgeInsets.only(left: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: _map<Widget>(imgList, (index, assetName) {
                  return Container(
                    width: 50,
                    height: 2,
                    decoration: BoxDecoration(
                      color: _current == index ? Colors.grey[100] : Colors.grey[600]
                    ),
                  );
                }),
              ),
            )*/
          ],
        );
      }
    }

    class Detail extends StatefulWidget {
      final Posts postt;
      Detail({Key key, @required this.postt}) : super(key: key);

      @override
      _DetailState createState() => _DetailState();
    }
    
    class _DetailState extends State<Detail> {
      ScrollController _scrollController;

      @override
      void initState() { 
        super.initState();
        _scrollController = ScrollController()
        ..addListener((){
          final isNotExpanded = _scrollController.hasClients && _scrollController.offset > 300 - kToolbarHeight;
          if (isNotExpanded != _showTitle){
            setState(() {
              _showTitle = isNotExpanded;
            });
          }
        });
      }

      bool _showTitle = false;

      @override
      Widget build(BuildContext context) { 
        

      /*final topAppBar = AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: title,
      leading: Row(
        children: <Widget>[
          IconButton(icon: Icon(Icons.arrow_back), onPressed: (){Navigator.pop(context);},),
          SizedBox(width: 10.0,),
          Image.asset('assets/logo.png',
              height: 92.0,
              width: 62.0, alignment: Alignment(7, 8)),
        ],
      ),
      actions: <Widget>[
        IconButton(icon: Icon(Icons.share), onPressed: (){},),
      ],
    );*/

    /*final levelIndicator = Container(
      child: Container(
        child: LinearProgressIndicator(
          backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
          value: 50,
          valueColor: AlwaysStoppedAnimation(Colors.green),
        ),
      ),
    );

    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 90.0),
        Icon(
          Icons.pages,
          color: Colors.white,
          size: 40.0,
        ),
        Container(
          width: 90.0,
          child: new Divider(color: Colors.green),
        ),
        SizedBox(height: 10.0),
        Expanded(
                  child: Text(
            postt.title,
            style: TextStyle(color: Colors.white, fontSize: 45.0),
          ),
        ),
        SizedBox(height: 30.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(flex: 1, child: levelIndicator),
            Expanded(
              flex: 6,
              child: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  postt.date,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Expanded(flex: 1, child: Icon(Icons.favorite, color: Colors.red, size: 30,)),
          ],
        ),
      ],
    );*/

    /*final topcontent = Stack(
      children: <Widget>[
        Container(
          height: 300,
          width: double.infinity,
          decoration: new BoxDecoration(
            //borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
            image: new DecorationImage(
              image: new NetworkImage(postt.image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 20.0,
          left: 20.0,
          right: 20.0,
          child: Row(
            children: <Widget>[
              Icon(Icons.slideshow, color: Colors.black),
              SizedBox(width: 10.0,),
              Expanded(child: Text(postt.title, style: TextStyle(color: Colors.black, fontSize: 40.0)))
            ],
          ),
        ),
      ],
    );*/

    /*final bottomContentText = Text(
      postt.description,
      style: TextStyle(fontSize: 18.0),
    );*/

    final bottomcontent = Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(child: Text(widget.postt.date, style: Theme.of(context).textTheme.body1,),),
              IconButton(icon: Icon(Icons.favorite_border, color: Theme.of(context).iconTheme.color,), onPressed: (){},)
            ],
          ),
          Divider(),
          SizedBox(height: 10.0,),
          Text(
            widget.postt.description,
            style: Theme.of(context).textTheme.body2.copyWith(fontSize: 18.0),
          ),
        ],
      ),
    );

        return Scaffold(
          //backgroundColor: Color(0xffF3F3F3),
      /*appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: topAppBar,
      ),*/
      body:CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            brightness: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Brightness.light : Brightness.dark,
            floating: false,
            expandedHeight: 300,
            leading: IconButton(
            icon: Icon(Icons.arrow_back, color: _showTitle ? Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ?  Colors.black : Colors.white : Colors.black),
              onPressed: (){Navigator.pop(context);},
            ),
          
            actions: <Widget>[IconButton(
               icon: Icon(Icons.share, color: _showTitle ? Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ?  Colors.black : Colors.white : Colors.black,),
              onPressed: (){}
            ),
            ],
            title: _showTitle ? Text(widget.postt.title, style: Theme.of(context).textTheme.title,maxLines: 2, overflow: TextOverflow.ellipsis,) : null,
            flexibleSpace: _showTitle ? null : FlexibleSpaceBar(
              title: Container(
                width: 210,
                //color: Color(0xaaF3F3F3),
                child: Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: Row(
            children: <Widget>[
                //Icon(Icons.slideshow, color: Colors.black),
                //SizedBox(width: 10.0,),
                Expanded(child: Text(widget.postt.title, style: TextStyle(color: Colors.black),maxLines: 5, overflow: TextOverflow.ellipsis,)),
            ],
          )),
              ),
          background: Stack(children: <Widget>[
            Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new NetworkImage(widget.postt.image),
                  fit: BoxFit.cover,
                ),
              )
            ),
            Container(
              decoration: BoxDecoration(color: Color.fromRGBO(225, 225, 225, .4)),
            )
          ],
            ),
              collapseMode: CollapseMode.none,
            ),
          ),
          SliverToBoxAdapter(
            child: bottomcontent,
          )
        ],
      )
        );
      }
    }

    

    /*class Bottomcontent extends StatefulWidget {
      @override
      _BottomcontentState createState() => _BottomcontentState();
    }
    
    class _BottomcontentState extends State<Bottomcontent> {

      double sheetTop = 200;
      double minSheetTop = 30;

      bool isExpanded = false;

      @override
      Widget build(BuildContext context) {
        return Positioned(
          top: sheetTop,
          left: 0,
          child: GestureDetector(
            onTap: () {
              setState(() {
               isExpanded ? sheetTop = 200 : sheetTop = minSheetTop;
               isExpanded = !isExpanded;
              });
            },
            child: SheetContainer(),
          ),
        );
      }
    }

    class SheetContainer extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        double sheetItemHeight = 110;
        return Container(
          padding: EdgeInsets.only(top: 25),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
            color: Color(0xfff1f1f1)
          ),
          child: Column(
            children: <Widget>[
              drawerHandle(),
            ],
          ),
        );
      }
    }

    drawerHandle() {
      return Container(
        margin: EdgeInsets.only(bottom: 25),
        height: 3,
        width: 65,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(0xffd9dbdb)
        ),
      );
    }*/

class Details extends StatelessWidget {
  final Posts postt;
  final PaletteGenerator palette;

  Details({this.postt, this.palette});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.network(
            postt.image,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fitHeight,
          ),
          Container(
            color: palette.darkMutedColor.color.withOpacity(0.8),
          ),
          Positioned(
            top: 60,
            right: 20,
            child: IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.white,
                size: 40,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ), 
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 120,
                ),
                Container(
                  child: Text(postt.title.toUpperCase(), style: TextStyle(color: palette.lightMutedColor == null ? Colors.white : palette.lightMutedColor.color, fontSize: 40, fontWeight: FontWeight.w900)),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  child: Text(
                  postt.date+", "+postt.time,
                  style: Theme.of(context).textTheme.body1.copyWith(fontSize: 12.0, color:  palette.lightMutedColor == null ? Colors.white : palette.lightMutedColor.color, fontWeight: FontWeight.w800),
                ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Text(postt.description, style: Theme.of(context).textTheme.body2.copyWith(fontSize: 18.0, color: Colors.white, height: 1.7),),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}