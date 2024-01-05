// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:zoom_clone_flutter/utils/colors.dart';

class HomeMeetingButtonWidget extends StatelessWidget {
  const HomeMeetingButtonWidget({
    Key? key,
    required this.onTap,
    required this.icon,
    required this.text,
  }) : super(key: key);
  final VoidCallback onTap;
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.black.withOpacity(0.06),
                  offset: const Offset(1, 4),
                )
              ],
            ),
            width: 60,
            height: 60,
            child: Icon(
              icon,
              size: 30,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            text,
            style: const TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
