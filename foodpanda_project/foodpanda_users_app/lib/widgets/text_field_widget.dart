// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
    required this.hintText,
    required this.controller,
  }) : super(key: key);
  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration.collapsed(
          hintText: hintText,
        ),
        validator: (value) => value!.isEmpty ? 'Field can not be empty' : null,
      ),
    );
  }
}
