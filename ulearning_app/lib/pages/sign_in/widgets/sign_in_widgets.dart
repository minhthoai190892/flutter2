// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';

AppBar buildAppBar() => AppBar(
      title: text16Normal(text: 'Login', color: AppColors.primaryText),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(10), // Chiều cao của AppBar
        child: Container(
          height: 1,
          color: Colors.grey.withOpacity(0.3),
        ),
      ),
    );

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
Widget appTextFiield(
        {String text = "",
        String iconName = '',
        String hintText = 'Type in your info',
        bool obscureText = true}) =>
    Container(
      padding: const EdgeInsets.only(left: 25, right: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          text14Normal(text: text),
          Container(
            width: 325,
            height: 50,
            decoration: appBoxDecorationTextField(),
            // row contains icons and textfields
            child: Row(
              children: [
                //Show icon
                Container(
                    margin: const EdgeInsets.only(left: 17),
                    child: appImage(imagePath: iconName)),
                SizedBox(
                  width: 280,
                  height: 50,
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: hintText,
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      // default border without any input
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      // focused border is with input
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      disabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                    ),
                    onChanged: (value) {},
                    maxLines: 1,
                    autocorrect: false,
                    obscureText: obscureText,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
