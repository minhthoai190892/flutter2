import 'package:flutter/material.dart';

import '../common/widgets/text_widgets.dart';

Column appOnboardingPage({
  String imagePath = 'assets/images/reading.png',
  String title = '',
  String subTitle = '',
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
      _nextButton(),
    ],
  );
}

Widget _nextButton() {
  return Container(
    margin: const EdgeInsets.only(
      top: 100,
      left: 25,
      right: 25,
    ),
    width: 325,
    height: 50,
    color: Colors.blue,
  );
}
