// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  final Icon? icon;
  final Color? color;
  final Widget? childWidget;
  final Function()? onPress;
  const CardContainer({
    Key? key,
    this.icon,
    this.color,
    this.childWidget,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        // width: 170.0,
        // height: 200.0,
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: color,
        ),
        child: childWidget,
      ),
    );
  }
}
