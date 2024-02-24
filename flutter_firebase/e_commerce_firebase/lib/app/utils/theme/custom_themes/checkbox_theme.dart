import 'package:flutter/material.dart';

class TCheckBoxTheme {
  TCheckBoxTheme._();
  static CheckboxThemeData lightCheckBoxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
    checkColor: MaterialStateProperty.resolveWith(
      (states) {
        if (states.contains(MaterialState.selected)) {
          return Colors.white;
        } else {
          return Colors.white;
        }
      },
    ),
    fillColor: MaterialStateProperty.resolveWith((states) =>
        states.contains(MaterialState.selected)
            ? Colors.blue
            : Colors.transparent),
  );
   static CheckboxThemeData darkCheckBoxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
    checkColor: MaterialStateProperty.resolveWith(
      (states) {
        if (states.contains(MaterialState.selected)) {
          return Colors.white;
        } else {
          return Colors.white;
        }
      },
    ),
    fillColor: MaterialStateProperty.resolveWith((states) =>
        states.contains(MaterialState.selected)
            ? Colors.blue
            : Colors.transparent),
  );
}
