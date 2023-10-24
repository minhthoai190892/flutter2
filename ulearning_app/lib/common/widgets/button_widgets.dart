import 'package:flutter/material.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/pages/sign_in/widgets/sign_in_widgets.dart';

Widget appButton({
  String buttonName = '',
  double width = 325,
  double height = 50,
  bool isLogin = true,
  BuildContext? context,
}) =>
    GestureDetector(
      onTap: () {
        Navigator.push(
            context!,
            MaterialPageRoute(
              builder: (context) => Scaffold(
                appBar: buildAppBar(),
              ),
            ));
      },
      child: Container(
        width: width,
        height: height,
        decoration: appBoxShadow(
            border: Border.all(color: AppColors.primaryFourElementText),
            color: isLogin ? AppColors.primaryElement : Colors.white),
        child: Center(
            child: text16Normal(
                text: buttonName,
                color: isLogin
                    ? AppColors.primaryBackground
                    : AppColors.primaryText)),
      ),
    );
