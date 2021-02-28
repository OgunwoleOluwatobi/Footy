import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/screenutil_init.dart';
import 'package:footyappp/ThemeNotifier.dart';
import 'package:footyappp/app/core/utils/logger.dart';
import 'package:footyappp/app/locator.dart';
import 'package:provider/provider.dart';
import 'Home.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'ThemeNotifier.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

 void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light
  );
  setupLogger();
  await setupLocator();
  await DotEnv.load(fileName: '.env');
   runApp(
    /*MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
    theme: AppTheme.lightTheme,
    darkTheme: AppTheme.darkTheme,
    ),*/
    ChangeNotifierProvider<ThemeNotifier>(
      child: HomeApp(),
      create:(BuildContext context) {
        return ThemeNotifier();
      } ,
    )
  );
 }

 class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<ThemeNotifier>(context).loadThemeData(context);
    return Consumer<ThemeNotifier>(
      builder: (context, appstate, child) {
        return ScreenUtilInit(
          builder: () => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: Provider.of<ThemeNotifier>(context).currentThemeData,
            home: MyApp(),
          ),
        );
      }
    );
  }
 }

 class MyApp extends StatefulWidget {
   @override
   _MyAppState createState() => _MyAppState();
 }
 
 class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
   Animation<double> animation;
   AnimationController controller;

   @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: Duration(milliseconds: 1500), vsync: this);
    final CurvedAnimation curve = CurvedAnimation(parent: controller, curve: Curves.ease);
    animation = Tween(begin: 1.0, end: 0.2).animate(curve);
    animation.addStatusListener((status) {
      if(status == AnimationStatus.completed)
      controller.reverse();
      else if(status == AnimationStatus.dismissed) controller.forward();
    });
    controller.forward();
    Timer(
      Duration(seconds: 5),
      () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Home())),
      );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

   @override
   Widget build(BuildContext context) {
     //Provider.of<ThemeNotifier>(context).loadThemeData(context);

     var logoUri = new AssetImage('assets/images/footy.png');
     var logoImage = new Image(image: logoUri, height: 250.h,);

     //var ballsUri = new AssetImage('assets/images/balls.png');
     //var ballsImage = new Image(image: ballsUri, height: 148.0,);
     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark
      )); 

     return Scaffold(
       body: Stack(
         fit: StackFit.expand,
         children: <Widget>[
           Container(
             decoration: BoxDecoration(
               color: new Color(0xffF7931D),
               gradient: LinearGradient(
                 colors: [new Color(0xffF7931D),new Color(0xffFBC688)]
               ),
             ),
           ),
           Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
              Expanded(
                flex: 4,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      FadeTransition(
                        opacity: animation,
                        child: logoImage,
                      ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                        ),
                        FadeTransition(
                          opacity: animation,
                          child: Text(
                            'FOOTY',
                            style: TextStyle(fontFamily: 'Montserrat', fontSize: 45.sp, fontWeight: FontWeight.w900, color: Colors.black),
                          ),
                        ),
                        /*Padding(
                          padding: EdgeInsets.only(top: 20.0),
                        ),
                        CircularProgressIndicator(backgroundColor: Colors.transparent, valueColor: new AlwaysStoppedAnimation<Color>(Color(0xffF3F3F3)),),*/

                    ],
                  ),
                ),
              ),
              /*Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    ballsImage,
                  ],
                ),
              )*/
             ],
           ),
         ],
       ),
     );
   }
 }