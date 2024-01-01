// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TextInputFieldWidget extends StatelessWidget {
  const TextInputFieldWidget({
    Key? key,
  
    required this.labelText,
    required this.icon,
    required this.borderColor,
    this.isObscureText = false, required this.controller,

  }) : super(key: key);
 final  TextEditingController controller ;
  final String labelText;
  final IconData icon;
  final Color borderColor;
  final bool isObscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        
        labelText: labelText,
        prefixIcon: Icon(icon),
        labelStyle: const TextStyle(fontSize: 20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: borderColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: borderColor,
          ),
        ),
      ),
      obscureText: isObscureText,
    );
  }
}
