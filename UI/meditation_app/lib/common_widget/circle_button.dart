import 'package:flutter/material.dart';
import 'package:meditation_app/common/commons.dart';
import 'package:meditation_app/common_widget/common_widgets.dart';

class CircleButton extends StatelessWidget {
  const CircleButton(
      {super.key,
      required this.title,
      required this.isSelect,
      required this.onPressed});
  final String title;
  final bool isSelect;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: isSelect ? TColor.primaryText : Colors.white,
          border: Border.all(color: TColor.secondaryText, width: 1),
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.center,
        child: TextWidget(
          text: title,
          color: isSelect ? Colors.white : TColor.secondaryText,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
