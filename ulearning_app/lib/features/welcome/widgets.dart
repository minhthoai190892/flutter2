// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/global.dart';

import '../../common/widgets/text_widgets.dart';

class AppOnboardingPage extends StatelessWidget {
  const AppOnboardingPage({
    Key? key,
    required this.controller,
    required this.context,
    required this.imagePath,
    required this.title,
    required this.subTitle,
    required this.index,
  }) : super(key: key);
  final PageController controller;
  final BuildContext context;
  final String imagePath;
  final String title;
  final String subTitle;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imagePath,
          fit: BoxFit.fitHeight,
        ),
        Container(
          margin: const EdgeInsets.only(top: 15),
          child: Text24Normal(text: title),
        ),
        Container(
          margin: const EdgeInsets.only(top: 15),
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Text16Normal(text: subTitle),
        ),
        _nextButton(index, controller, context),
      ],
    );
  }
}

Widget _nextButton(int index, PageController controller, BuildContext context) {
  return GestureDetector(
    onTap: () {
      bool deviceFirstTime = Global.storageService.getDeviceFirstOpen();
      print('from tab $deviceFirstTime');
      // chuyển trang khi click vào button
      if (index < 3) {
        // Hiệu ứng chuyển trang
        controller.animateToPage(index,
            duration: const Duration(milliseconds: 300), curve: Curves.linear);
      } else {
        // remember if we are first time or not
        Global.storageService
            .setBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_KEY, true);
        Navigator.pushNamed(context, '/sign_in');
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
      child: Center(
          child: Text16Normal(
              text: index < 3 ? 'Next' : 'Get started', color: Colors.white)),
    ),
  );
}
