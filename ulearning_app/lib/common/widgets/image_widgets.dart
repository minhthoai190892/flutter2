import 'package:flutter/material.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/image_res.dart';

Widget appImage({
  String imagePath = ImageRes.defaultImage,
  double width = 16,
  double height = 16,
}) =>
    Image.asset(
      imagePath.isEmpty ? ImageRes.defaultImage : imagePath,
      width: width,
      height: height,
    );

Widget appImageWithColor(
        {String imagePath = ImageRes.defaultImage,
        double width = 16,
        double height = 16,
        Color color = AppColors.primaryElement}) =>
    Image.asset(
      imagePath.isEmpty ? ImageRes.defaultImage : imagePath,
      width: width,
      height: height,
      color: color,
    );
