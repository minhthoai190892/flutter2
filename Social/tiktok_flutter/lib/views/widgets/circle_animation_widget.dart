// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CircleAnimationWidget extends StatefulWidget {
  const CircleAnimationWidget({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;
  @override
  State<CircleAnimationWidget> createState() => _CircleAnimationWidgetState();
}

class _CircleAnimationWidgetState extends State<CircleAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 5000));
    controller.forward();
    controller.repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: Tween<double>(begin: 0, end: 1).animate(controller),
      child: widget.child,
    );
  }
}
