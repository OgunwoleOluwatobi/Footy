import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum MyThemes {light, dark}
class ThemeNotifier with ChangeNotifier {
  bool isDarkModeOn = false;
  static final List<ThemeData> themeData = [
      ThemeData(
        //brightness: Brightness.dark,
        primaryColor: Color(0xffF3F3F3),
        //primarySwatch: Colors.transparent,
        scaffoldBackgroundColor: Color(0xffF3F3F3),
        bottomAppBarColor: Color(0xffF3F3F3),
        canvasColor: Color(0xffF3F3F3),
        //accentColor: Colors.transparent,
        //highlightColor: Colors.transparent,
        textTheme: TextTheme(
          title: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
          body1: TextStyle(color: Colors.grey,),
          body2: TextStyle(color: Colors.black87)
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        fontFamily: 'Roboto'
      ),
      ThemeData(
        //brightness: Brightness.light,
        primaryColor: Color(0xff0D1B26),
        scaffoldBackgroundColor: Color(0xff0D141A),
        bottomAppBarColor: Color(0xff252F38),
        canvasColor: Color(0xff0D141A),
        //accentColor: Colors.transparent,
        textTheme: TextTheme(
          title: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          body1: TextStyle(color: Colors.white70,),
          body2: TextStyle(color: Colors.white70),
        ),
        cardTheme: CardTheme(
          color: Colors.black,
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        fontFamily: 'Roboto'
      ),
  ];

  MyThemes _currentTheme = MyThemes.light;
  ThemeData _currentThemeData = themeData[MyThemes.light.index];

  void switchTheme(bool isOn) async {
    currentTheme == MyThemes.light ? currentTheme = MyThemes.dark : currentTheme = MyThemes.light;
    this.isDarkModeOn = isOn;

    activateTheme(currentTheme, isOn);
  }

  Future<void> activateTheme(MyThemes theme, bool val) async {
    var sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.setInt('theme_id', theme.index);
    await sharedPrefs.setBool('isOn', val);
  }

  void loadThemeData(BuildContext context) async {
    var sharedPrefs = await SharedPreferences.getInstance();
    int themeId = sharedPrefs.getInt('theme_id') ?? MyThemes.light.index;
    bool isOn = sharedPrefs.getBool('isOn') ?? false;
    currentTheme = MyThemes.values[themeId];
    isDarkModeOn = isOn;
  }

  set currentTheme(MyThemes theme) {
    if (theme != null) {
      _currentTheme = theme;
      _currentThemeData = themeData[_currentTheme.index];
      //isDarkModeOn = this.isDarkModeOn;
      notifyListeners();
    }
  }

  get currentTheme => _currentTheme;
  get currentThemeData => _currentThemeData;
}