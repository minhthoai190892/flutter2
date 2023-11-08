// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'package:ulearning_app/common/utils/app_colors.dart';

class Text24Normal extends StatelessWidget {
  const Text24Normal({
    super.key,
    this.text = '',
    this.color = AppColors.primaryText,
    this.fontWeight = FontWeight.normal,
  });
  final String text;
  final Color color;
  final FontWeight fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: color,
        fontSize: 24,
        fontWeight: fontWeight,
      ),
    );
  }
}

class Text16Normal extends StatelessWidget {
  const Text16Normal(
      {super.key,
      this.text = '',
      this.color = AppColors.primarySecondaryElementText,
      this.fontWeight = FontWeight.normal});
  final String text;
  final Color color;
  final FontWeight fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: color,
        fontSize: 16,
        fontWeight: fontWeight,
      ),
    );
  }
}

class Text10Normal extends StatelessWidget {
  const Text10Normal(
      {super.key,
      this.text = '',
      this.color = AppColors.primaryThreeElementText,
      this.fontWeight = FontWeight.normal});
  final String text;
  final Color color;
  final FontWeight fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: color,
        fontSize: 10,
        fontWeight: fontWeight,
      ),
    );
  }
}

class Text14Normal extends StatelessWidget {
  const Text14Normal({
    Key? key,
    this.text = '',
    this.color = AppColors.primaryThreeElementText,
  }) : super(key: key);
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
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
