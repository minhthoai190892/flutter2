import 'package:flutter/material.dart';

class TSizes {
  TSizes._();
  static Size size(BuildContext context) {
    return MediaQuery.of(context).size;
  }
}
