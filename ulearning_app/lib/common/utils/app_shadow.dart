import 'package:flutter/material.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';

BoxDecoration appBoxShadow(
    {Color color = AppColors.primaryElement,
    double radius = 15,
    double sR = 5,
    double bR = 10}) {
  return BoxDecoration(
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
