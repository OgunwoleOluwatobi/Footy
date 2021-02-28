import 'package:flutter/material.dart';
import 'package:footyappp/views/widgets/utility_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ComingSoon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topAppBar(context),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Image.asset(
                'assets/images/const.gif',
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: Text(
                  'LiveScores Coming Soon...',
                  style: Theme.of(context).textTheme.headline6.copyWith(fontSize: 20.sp, fontFamily: 'RobotoBlack'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}