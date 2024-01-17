// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';

/// CustomTextFieldWidget
///
/// @param controller
///
/// @param iconData
///
///  @param hintText tên của field
///
/// @param isObserce ẩn hiện nội dung trong text field
///
/// @param enabled (true/false: có được phép chỉnh sửa văn bản trong text field hay không)
class CustomTextFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final IconData? iconData;
  final String? hintText;
  bool? isObserce = true;
  bool? enabled = true;
  CustomTextFieldWidget({
    Key? key,
    this.controller,
    this.iconData,
    this.hintText,
    this.isObserce,
    this.enabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(10),
      child: TextFormField(
        enabled: enabled,
        controller: controller,
        obscureText: isObserce!,
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            iconData,
            color: Colors.cyan,
          ),
          focusColor: Colors.red,
          hintText: hintText,
        ),
      ),
    );
  }
}
