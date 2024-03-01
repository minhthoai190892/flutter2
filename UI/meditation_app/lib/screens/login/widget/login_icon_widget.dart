import 'package:flutter/material.dart';

class LoginIconWidget extends StatelessWidget {
  const LoginIconWidget({
    super.key,
    required this.text,
    required this.imageUrl, required this.color,
  });
  final String imageUrl;
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          imageUrl,
          width: 35,
          height: 35,
        ),
        Expanded(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style:  TextStyle(
              color: color,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
