import 'package:flutter/material.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';

Text text24Normal({String text = ''}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: const TextStyle(
      color: AppColors.primaryText,
      fontSize: 24,
      fontWeight: FontWeight.normal,
    ),
  );
}

Text text16Normal({String text = ''}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: const TextStyle(
      color: AppColors.primarySecondaryElementText,
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
  );
}
