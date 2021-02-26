import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:footyappp/HomePage.dart';
import 'package:footyappp/Livescores.dart';
import 'package:footyappp/More.dart';
import 'package:footyappp/Stats.dart';
import 'package:footyappp/Upload.dart';

class Home extends StatefulWidget {
  //Home({Key key, @required this.darkm}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  _HomeState();
  /*void _home(){

  }*/

  int _cIndex = 0;
  final List<Widget> pages = [
    HomePage(
      key: PageStorageKey('Page1'),
    ),
    Upload(
      key: PageStorageKey('Page2'),
    ),
    Livescores(
      key: PageStorageKey('Page3'),
    ),
    Stats(
      key: PageStorageKey('Page4'),
      ),
    More(
      key: PageStorageKey('Page5'),
    )
  ];
  /*void _incrementTab(index) {
    setState(() {
      _cIndex = index;
    });
  }*/
  final PageStorageBucket bucket = PageStorageBucket();

  Widget _bottomNavigationBar(int cIndex) => Container(
    decoration: new BoxDecoration(
      border: new Border(
        top: new BorderSide(width: 1.0, color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Color(0xffF3F3F3) : Colors.white12)
      ),
    ),
    child: BottomNavigationBar(
    onTap: (int index) => setState(() => _cIndex = index),
    currentIndex: cIndex,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Theme.of(context).scaffoldBackgroundColor == Color(0xff0D141A) ? Colors.white : Colors.black,
    unselectedItemColor: Theme.of(context).scaffoldBackgroundColor == Color(0xff0D141A) ? Colors.white54 : Colors.grey.shade600,
    elevation: 10,
    //backgroundColor: dark ? Color(0xff252F38) : Color(0xffF3F3F3),
    items:  <BottomNavigationBarItem>[
      BottomNavigationBarItem(
              icon: new Icon(FontAwesomeIcons.listAlt), /*new Image.asset("assets/images/house.png")*/
              title: AnimatedContainer(
                margin: EdgeInsets.only(top: 5),
                duration: const Duration(milliseconds: 200),
                height: 6,
                width: 6,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? cIndex == 0 ? Colors.black : Colors.transparent : cIndex == 0 ? Colors.white : Colors.transparent
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: new Icon(FontAwesomeIcons.upload),
              title: AnimatedContainer(
                margin: EdgeInsets.only(top: 5),
                duration: const Duration(milliseconds: 200),
                height: 6,
                width: 6,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? cIndex == 1 ? Colors.black : Colors.transparent : cIndex == 1 ? Colors.white : Colors.transparent
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: new Icon(FontAwesomeIcons.footballBall),
              title: AnimatedContainer(
                margin: EdgeInsets.only(top: 5),
                duration: const Duration(milliseconds: 200),
                height: 6,
                width: 6,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? cIndex == 2 ? Colors.black : Colors.transparent : cIndex == 2 ? Colors.white : Colors.transparent
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: new Icon(FontAwesomeIcons.chartBar),
              title: AnimatedContainer(
                margin: EdgeInsets.only(top: 5),
                duration: const Duration(milliseconds: 100),
                height: 6,
                width: 6,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? cIndex == 3 ? Colors.black : Colors.transparent : cIndex == 3 ? Colors.white : Colors.transparent
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: new Icon(FontAwesomeIcons.bookmark),
              title: AnimatedContainer(
                margin: EdgeInsets.only(top: 5),
                duration: const Duration(milliseconds: 200),
                height: 6,
                width: 6,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? cIndex == 4 ? Colors.black : Colors.transparent : cIndex == 4 ? Colors.white : Colors.transparent
                ),
              ),
            )
    ]
    ));

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      ));
    

    
      return Scaffold(
        body: PageStorage(
          bucket: bucket, 
          child: pages[_cIndex]
          ),
        /*_children[_cIndex]*/
      
        

        bottomNavigationBar: _bottomNavigationBar(_cIndex)
        /*BottomNavigationBar(
          currentIndex: _cIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: dark ? Colors.white : Colors.black,
          unselectedItemColor: dark ? Colors.white54 : Colors.grey.shade600,
          elevation: 10,
          backgroundColor: dark ? Color(0xff252F38) : Color(0xffF3F3F3),
          items: [
            BottomNavigationBarItem(
              icon: new Icon(FontAwesomeIcons.listAlt), /*new Image.asset("assets/images/house.png")*/
              title: Text("")
            ),
            BottomNavigationBarItem(
              icon: new Icon(FontAwesomeIcons.upload),
              title: Text("")
            ),
            BottomNavigationBarItem(
              icon: new Icon(FontAwesomeIcons.footballBall),
              title: Text("")
            ),
            BottomNavigationBarItem(
              icon: new Icon(FontAwesomeIcons.chartBar),
              title: Text("")
            ),
            BottomNavigationBarItem(
              icon: new Icon(FontAwesomeIcons.bookmark),
              title: Text("")
            )
          ],
          onTap: (index){
              _incrementTab(index);
          },
        ),*/
        /*bottomNavigationBar: new BottomAppBar(
          color: Colors.white,
          child: new Container(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,

              children: <Widget>[
                new IconButton(
                  icon: new Image.asset("assets/images/house.png"),
                  iconSize: 40,
                  color: Colors.black,

                  onPressed: _home,
                ),
                new IconButton(
                  icon: new Image.asset("assets/images/newspaper.png"),
                  iconSize: 40,
                  color: Colors.black,
                ),
                new IconButton(
                  icon: new Image.asset("assets/images/football.png"),
                  iconSize: 40,
                  color: Colors.black,
                ),
                new IconButton(
                  icon: new Image.asset("assets/images/stat.png"),
                  iconSize: 40,
                  color: Colors.black,
                ),
                new IconButton(
                  icon: new Image.asset("assets/images/more.png"),
                  iconSize: 40,
                  color: Colors.black,
                )
              ],
            ),
          ),
        ),*/
      
    );
  }
}