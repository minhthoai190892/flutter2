import 'package:flutter/material.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';

Widget appButton({
  String buttonName = '',
  double width = 325,
  double height = 50,
  bool isLogin = true,
  BuildContext? context,
  void Function()? func,
}) =>
    GestureDetector(
      onTap: func,
      child: Container(
        width: width,
        height: height,
        decoration: appBoxShadow(
            boxBorder: Border.all(color: AppColors.primaryFourElementText),
            color: isLogin ? AppColors.primaryElement : Colors.white),
        child: Center(
            child: text16Normal(
                text: buttonName,
                color: isLogin
                    ? AppColors.primaryBackground
                    : AppColors.primaryText)),
      ),
    );
