import 'package:flutter/material.dart';

class TOutlineButtonThem {
  TOutlineButtonThem._();
  static OutlinedButtonThemeData lightOutlineButtonTheme =
      OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      foregroundColor: Colors.black,
      side: const BorderSide(color: Colors.blue),
      textStyle: const TextStyle(
        fontSize: 16,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
  static OutlinedButtonThemeData darkOutlineButtonTheme =
      OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      foregroundColor: Colors.white,
      side: const BorderSide(color: Colors.blueAccent),
      textStyle: const TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
