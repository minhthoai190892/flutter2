// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

Widget thirdPartyLogin() => Container(
      margin: const EdgeInsets.only(top: 40, left: 80, right: 80, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _loginButton('assets/icons/google.png'),
          _loginButton('assets/icons/facebook.png'),
          _loginButton('assets/icons/apple.png'),
        ],
      ),
    );
Widget _loginButton(String imagePath) => GestureDetector(
      onTap: () => print('image path'),
      child: SizedBox(
        width: 40,
        height: 40,
        child: Image.asset(imagePath),
      ),
    );
