// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';

class PageCircleIndicator extends StatelessWidget {
  const PageCircleIndicator({
    Key? key,
    required this.currentPageNotifier,
    required this.itemCount,
  }) : super(key: key);
  final ValueNotifier<int> currentPageNotifier;
  final int itemCount;
  static const double _dotSize = 12;
  @override
  Widget build(BuildContext context) {
    return CirclePageIndicator(
      size: _dotSize,
      dotColor: Theme.of(context).primaryColor.withOpacity(0.35),
      selectedDotColor: Theme.of(context).primaryColor,
      currentPageNotifier: currentPageNotifier,
      itemCount: itemCount,
    );
  }
}
