import 'package:flutter/material.dart';

class TColor {
  static Color get primary => Color(0xFF8e97fd);
  static Color get secondary => Color(0xFF3f414e);
  static Color get tertiary => Color(0xFFebeaec);

  static Color get primaryText => Color(0xFF3f414e);
  static Color get primaryTextW => Color(0xFFf6f1fb);
  static Color get secondaryText => Color(0xFFa1a4b2);
  static Color get txBG => Color(0xFFf2f3f7);
}

extension AppContext on BuildContext {
  Size get size => MediaQuery.of(this).size;
  double get width => size.width;
  double get height => size.height;

  push(Widget widget) => Navigator.push(
      this,
      MaterialPageRoute(
        builder: (context) => widget,
      ));
  pop() => Navigator.pop(this);
}
