
import 'package:flutter/material.dart';

class TextFileInput extends StatelessWidget {
  final TextEditingController controller;

  final String hintText;

  final TextInputType keyboardType;

  final bool obscureText;

  const TextFileInput({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.keyboardType,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: inputBorder,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        filled: true,
        contentPadding: const EdgeInsets.all(8),
      ),
      keyboardType: keyboardType,
      obscureText: obscureText,
    );
  }
}
