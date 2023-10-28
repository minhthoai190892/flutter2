import 'package:flutter/material.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';

BoxDecoration appBoxShadow(
    {BoxBorder? border,
    Color color = AppColors.primaryElement,
    double radius = 15,
    double sR = 1,
    double bR = 2}) {
  return BoxDecoration(
    border: border,
    color: color,
    borderRadius: BorderRadius.circular(radius),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.1),
        spreadRadius: sR, // Độ rộng của shadow
        blurRadius: bR, // Bán kính mờ
        offset: const Offset(0, 1), // Điều chỉnh shadown
      ),
    ],
  );
}

BoxDecoration appBoxDecorationTextField({
  Color color = AppColors.primaryBackground,
  double radius = 15,
  Color borderColor = AppColors.primaryFourElementText,
}) {
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(radius),
    border: Border.all(color: borderColor),
  );
}