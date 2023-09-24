
import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  final Icon? icon;
  final Color? color;
  final Widget? childWidget;
  const CardContainer({
    Key? key,
    this.icon,
    this.color,
    this.childWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 170.0,
      // height: 200.0,
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: color,
      ),
      child: childWidget,
    );
  }
}
