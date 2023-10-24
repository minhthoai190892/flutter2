// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';

Text text24Normal({String text = '', Color color = AppColors.primaryText}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: color,
      fontSize: 24,
      fontWeight: FontWeight.normal,
    ),
  );
}

Text text16Normal(
    {String text = '', Color color = AppColors.primarySecondaryElementText}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: color,
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
  );
}

Text text14Normal(
    {String text = '', Color color = AppColors.primaryThreeElementText}) {
  return Text(
    text,
    textAlign: TextAlign.start,
    style: TextStyle(
      color: color,
      fontSize: 14,
      fontWeight: FontWeight.normal,
    ),
  );
}

GestureDetector textUnderLine({String text = ''}) {
  return GestureDetector(
    onTap: () {
      print('object');
    },
    child: Text(
      text,
      style: const TextStyle(
        color: AppColors.primaryText,
        decoration: TextDecoration.underline,
        decorationColor: AppColors.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12,
      ),
    ),
  );
}
