import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppWidget {
  static TextStyle boldTextFeildStyle() {
    return GoogleFonts.poppins(
        fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold);
  }

  static TextStyle headlineTextFeildStyle() {
    return GoogleFonts.poppins(
        fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold);
  }

  static TextStyle lightTextFeildStyle() {
    return GoogleFonts.poppins(
        fontSize: 15, color: Colors.black38, fontWeight: FontWeight.w500);
  }

  static TextStyle semiBoldTextFeildStyle() {
    return GoogleFonts.poppins(
        fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold);
  }
}
