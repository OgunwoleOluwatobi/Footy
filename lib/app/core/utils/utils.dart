import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Utils {
  static final currencyFormatter2 = NumberFormat.simpleCurrency(name: 'NGN', decimalDigits: 2);
  static final currencyFormatter = NumberFormat.simpleCurrency(name: 'NGN', decimalDigits: 0);
  static final dateFormat = DateFormat('yyyy-MM-dd');
  static final dateFormat2 = DateFormat('yyyy/MM/dd');
  static final dateAndTimeFormat = DateFormat('yyyy/MM/dd hh:mm a');
}

class Debouncer{
  final int milliseconds;
  VoidCallback action;
  Timer _timer;

  Debouncer({this.milliseconds});

  run(VoidCallback action) {
    if(_timer != null) {
      _timer.cancel();
    }

    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}