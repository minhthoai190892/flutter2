// ignore_for_file: prefer_if_null_operators, unnecessary_null_comparison

import 'package:e_commerce_firebase/app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class TCircularIcon extends StatelessWidget {
  /// A custom Circular Icon widget with background color
  ///
  ///Properties are:
  ///Container [width], [height],[backgroundColor]
  ///
  ///Icon's [size],[color],[onPressed]
  const TCircularIcon({
    super.key,
    required this.dark,
    this.width,
    this.height,
    this.size = TSizes.lg,
    required this.icon,
    required this.color,
    this.backgroundColor,
    this.onPressed,
  });

  final bool dark;
  final double? width, height, size;
  final IconData icon;
  final Color? color, backgroundColor;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor != null
            ? backgroundColor
            : dark
                ? TColors.black.withOpacity(0.9)
                : TColors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: color,
          size: size,
        ),
      ),
    );
  }
}
