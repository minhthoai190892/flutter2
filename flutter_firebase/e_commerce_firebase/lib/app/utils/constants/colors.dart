import 'package:flutter/material.dart';

class TColors {
  TColors._();
// app basic colors
  static Color primary = const Color(0xFF4B68FF);
  static Color secondary = const Color(0xFFFFE24B);
  static Color accent = const Color(0xFFB0C7FF);
  // Text color
  static Color textPrimary = const Color(0xFF333333);
  static Color textSecondary = const Color(0xFF6C757d);
  static Color textWhite = Colors.white;
  // background color
  static const Color light = const Color(0xFFf6f6f6);
  static Color dark = const Color(0xFF272727);
  static Color primaryBackground = const Color(0xFFf3f5ff);
  // background container color
  static Color lightContainer = const Color(0xFFf6f6f6);
  static Color darkContainer = TColors.white.withOpacity(0.1);
  // Button Colors
  static Color buttonPrimary = const Color(0xff4b68ff);
  static Color buttonSecondary = const Color(0xff6c757d);
  static Color buttonDisable = const Color(0xffc4c4c4);
  // error message and validation colors
  static Color error = const Color(0xffd32f2f);
  static Color success = const Color(0xff388e3c);
  static Color warning = const Color(0xfff57c00);
  static Color info = const Color(0xff1976d2);
  //border colors
  static Color borderPrimary = const Color(0xffd9d9d9);
  static Color borderSecondary = const Color(0xffe6e6e6);
  // neutral shades
  static Color black = const Color(0xff232323);
  static Color darkerGrey = const Color(0xff4f4f4f);
  static Color darkGrey = const Color(0xff939393);
  static Color grey = const Color(0xffe0e0e0);
  static Color softGrey = const Color(0xfff4f4f4);
  static Color lightGrey = const Color(0xfff9f9f9);
  static const Color white = Color(0xffffffff);
  //Gradient Colors
  static Gradient linerGradient = const LinearGradient(
    colors: [
      Color(0xffff9a9e),
      Color(0xfffad0c4),
      Color(0xfffad0c4),
    ],
    begin: Alignment(0, 0),
    end: Alignment(0.707, -0.707),
  );
}
