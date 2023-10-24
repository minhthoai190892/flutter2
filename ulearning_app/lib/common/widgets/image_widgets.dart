import 'package:flutter/material.dart';

Widget appImage(
        {String imagePath = 'assets/icons/user.png',
        double width = 16,
        double height = 16}) =>
    Image.asset(
      imagePath.isEmpty ? 'assets/icons/user.png' : imagePath,
      width: width,
      height: height,
    );
