
import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);
  final Icon icon;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: const Color(0xFF4C4F5E),
        onPressed: onPressed,
        child: icon);
  }
}