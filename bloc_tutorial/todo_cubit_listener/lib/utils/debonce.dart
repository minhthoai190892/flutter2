// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';

class Debounce {
  final int millisecond;
  Debounce({
    this.millisecond = 500,
  });
  Timer? _timer;
  void run(VoidCallback action) {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(milliseconds: millisecond), action);
  }
}
