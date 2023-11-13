import 'package:flutter/material.dart';
import 'package:learnning_flutter/constants/image_manager.dart';
import 'package:learnning_flutter/screens/flip_animation/widgets/flip_widget.dart';
import 'package:learnning_flutter/widgets/app_appbar.dart';

class FlipAnimation extends StatefulWidget {
  const FlipAnimation({super.key});

  @override
  State<FlipAnimation> createState() => _FlipAnimationState();
}

class _FlipAnimationState extends State<FlipAnimation> {
  bool flipped = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(title: 'FlipAnimation'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: FlipWidget(
                  from: Image.asset(
                    ImageManager.imagePageView2,
                    width: 300,
                    height: 300,
                  ),
                  to: Image.asset(
                    ImageManager.imagePageView3,
                    width: 300,
                    height: 300,
                  ),
                  animationStatus: flipped
                      ? AnimationStatus.forward
                      : AnimationStatus.reverse,),
            ),
            const SizedBox(
              height: 20,
            ),
            OutlinedButton(
              onPressed: () {
                setState(() {
                  flipped = !flipped;
                });
              },
              child: Text(flipped ? ' Reversed Flip' : "Forward Flip"),
            ),
          ],
        ),
      ),
    );
  }
}
