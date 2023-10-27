import 'package:flutter/material.dart';

import 'app_shadow.dart';
import 'image_widgets.dart';
import 'text_widgets.dart';

Widget appTextFiield({
  String text = "",
  String iconName = '',
  String hintText = 'Type in your info',
  bool obscureText = true,
  void Function(String value)? func,
  TextEditingController? controller,
}) =>
    Container(
      padding: const EdgeInsets.only(left: 25, right: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          text14Normal(text: text),
          const SizedBox(
            height: 5,
          ),
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
                    controller: controller,
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
                    // nhận dữ liệu từ người dùng
                    onChanged: (value) {
                      func!(value);//=> chuyển dữ liệu cho trang signup
                    },
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
