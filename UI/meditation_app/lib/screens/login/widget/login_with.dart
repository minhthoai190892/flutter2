import 'package:flutter/material.dart';

class LoginWith extends StatelessWidget {
  const LoginWith({
    super.key,
    this.widget,
    required this.onPressed,
    required this.backgroundColor,
  });
  final Widget? widget;
  final VoidCallback onPressed;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: MaterialButton(
        onPressed: onPressed,
        minWidth: double.maxFinite,
        elevation: 0,
        color: backgroundColor,
        height: 60,
        shape: RoundedRectangleBorder(
            side: BorderSide.none, borderRadius: BorderRadius.circular(30)),
        child: widget,
      ),
    );
  }
}
