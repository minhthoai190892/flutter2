// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/app_shadow.dart';

import '../common/widgets/text_widgets.dart';

Column appOnboardingPage(
  PageController controller, {
  String imagePath = 'assets/images/reading.png',
  String title = '',
  String subTitle = '',
  index = 0,
 
}) {
  return Column(
    children: [
      Image.asset(
        imagePath,
        fit: BoxFit.fitHeight,
      ),
      Container(
        margin: const EdgeInsets.only(top: 15),
        child: text24Normal(text: title),
      ),
      Container(
        margin: const EdgeInsets.only(top: 15),
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: text16Normal(text: subTitle),
      ),
      _nextButton(index, controller),
    ],
  );
}

Widget _nextButton(int index, PageController controller) {
  return GestureDetector(
    onTap: () {
      // chuyển trang khi click vào button
      if (index < 3) {
        // Hiệu ứng chuyển trang
        controller.animateToPage(index,
            duration: const Duration(milliseconds: 300), curve: Curves.linear);
      } else {
        index = 0;
      }
    },
    child: Container(
      decoration: appBoxShadow(),
      margin: const EdgeInsets.only(
        top: 100,
        left: 25,
        right: 25,
      ),
      width: 325,
      height: 50,
      child: Center(child: text16Normal(text: 'Next', color: Colors.white)),
    ),
  );
}
