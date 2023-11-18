// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_firebase_ecommerce/controllers/sign_up_controller.dart';
import 'package:get/get.dart';

import '../utils/app_constant.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    Key? key,
    required this.hitText,
    required this.keyboardType,
    required this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.controller,
  }) : super(key: key);
  final String hitText;
  final TextInputType keyboardType;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final bool obscureText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextFormField(
          controller: controller,
          cursorColor: AppConstant.appSecondoryColor,
          keyboardType: keyboardType,
          obscureText: obscureText,
          decoration: InputDecoration(
              hintText: hitText,
              contentPadding: const EdgeInsets.only(top: 2, left: 8),
              prefixIcon: Icon(prefixIcon),
              suffixIcon: Icon(suffixIcon),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        ),
      ),
    );
  }
}
