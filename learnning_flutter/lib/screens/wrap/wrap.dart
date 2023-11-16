// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:learnning_flutter/widgets/app_appbar.dart';

class WrapScreen extends StatelessWidget {
  const WrapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(title: 'Wrap'),
      body: Center(
        child: Wrap(
          spacing: 16,
          runSpacing: 16,
          children: 'NguyenMinhThoai'
              .split('')
              .map((char) => CharWidget(char: char))
              .toList(),
        ),
      ),
    );
  }
}

class CharWidget extends StatelessWidget {
  const CharWidget({
    Key? key,
    required this.char,
  }) : super(key: key);
  final String char;
  @override
  Widget build(BuildContext context) {
    const size = 60.0;
    return Container(
      transform: Matrix4.skewY(0.2),
      height: size,
      width: size,
      color: Colors.yellow,
      child: FittedBox(fit: BoxFit.contain, child: Text(char)),
    );
  }
}
