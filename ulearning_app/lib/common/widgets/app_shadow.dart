// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ulearning_app/common/utils/app_colors.dart';

import '../utils/image_res.dart';

BoxDecoration appBoxShadow(
    {BoxBorder? boxBorder,
    BorderRadius? borderRadius,
    Color color = AppColors.primaryElement,
    double radius = 15,
    double sR = 1,
    double bR = 2}) {
  return BoxDecoration(
    border: boxBorder,
    
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

BoxDecoration appBoxShadowWithRadius(
    {BoxBorder? border,
    Color color = AppColors.primaryElement,
    double radius = 15,
    double sR = 1,
    double bR = 2}) {
  return BoxDecoration(
    border: border,
    color: color,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(20.h),
      topRight: Radius.circular(20.h),
    ),
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

class AppBoxDecorationImage extends StatelessWidget {
  const AppBoxDecorationImage({
    Key? key,
    this.width = 40,
    this.height = 40,
    this.imagePath = ImageRes.profile,
  }) : super(key: key);
  final double width;
  final double height;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitHeight,
          image: AssetImage(imagePath),
        ),
        borderRadius: BorderRadius.circular(20.w),
      ),
    );
  }
}
