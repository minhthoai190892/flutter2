import 'package:flutter/material.dart';
import 'package:meditation_app/common/color_extension.dart';

class RoundTextField extends StatelessWidget {
  /// Text Field
  const RoundTextField(
      {super.key,
      required this.hintText,
      this.controller,
      this.keyboardType,
      this.obscureText,
      this.widget,
      this.right});
  final String hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final Widget? widget;
  final Widget? right;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        color: TColor.txBG,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          enabledBorder: InputBorder.none,
          suffixIcon: right,
          hintStyle: TextStyle(
            color: TColor.primaryText,
            fontSize: 16,
          ),
          
        ),
        style: TextStyle(
          color: TColor.secondaryText,
          fontSize: 16,
        ),
        keyboardType: keyboardType,
        obscureText: obscureText ?? false,
      ),
    );
  }
}
