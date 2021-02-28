import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

Widget topAppBar(BuildContext context, {List<Widget> action}) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    brightness: Theme.of(context).scaffoldBackgroundColor == Color(0xffF3F3F3) ? Brightness.light : Brightness.dark,
    centerTitle: true,
    title: Container(
      // margin: EdgeInsets.only(left: 3, top: 5, bottom: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: action  == null ? MainAxisSize.min : MainAxisSize.max,
        children: <Widget>[
          Image.asset(
            'assets/images/footy.png',
            height: 45.w,
            width: 45.w,
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 0),
            child: Align(
              child: Text(
                "FOOTY",
                style: Theme.of(context).textTheme.headline6.copyWith(fontSize: 22.sp, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    ),
    actions: action,
  );
}