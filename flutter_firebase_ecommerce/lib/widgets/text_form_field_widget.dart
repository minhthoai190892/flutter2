import 'package:flutter/material.dart';

import '../utils/app_constant.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    Key? key,
    required this.hitText,
    required this.keyboardType,
    required this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
  }) : super(key: key);
  final String hitText;
  final TextInputType keyboardType;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextFormField(
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
