import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:meditation_app/common/color_extension.dart';
import 'package:meditation_app/common/commons.dart';
import 'package:meditation_app/common/image_extension.dart';
import 'package:meditation_app/screens/home/choice_topic_screen.dart';

import '../../common_widget/common_widgets.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.amber,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image:
                    AssetImage('assets/images/Woman-meditating_1600x.webp'))),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SafeArea(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Silent  '),
                          Image.asset(
                            'assets/images/logo-meditation.png',
                            width: 50,
                            height: 50,
                            // width: context.width * 0.5,
                          ),
                          const Text('  Moon'),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextWidget(
                        text: 'Hi Afsar, Welcome',
                        color: TColor.secondaryText,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                      TextWidget(
                        text: 'to Silent Moon',
                        color: TColor.secondaryText,
                        fontSize: 28,
                      ),
                      TextWidget(
                        text:
                            'Explore the app, Find some pease of mind to prepare for meditate',
                        color: TColor.secondaryText,
                        fontSize: 16,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 50,
              right: 0,
              left: 0,
              child: RoundButton(
                title: TText.getStarted,
                onPressed: () => context.push(const ChoiceTopicScreen()),
                // type: RoundButtonType.secondary,
              ),
            )
          ],
        ),
      ),
    );
  }
}
