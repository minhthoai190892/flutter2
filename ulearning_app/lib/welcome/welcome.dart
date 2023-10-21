import 'package:flutter/material.dart';

import 'widgets.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});
// Todo: Thêm PageView
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            // scrollDirection: Axis.vertical,
            children: [
              // First Page
              appOnboardingPage(
                  imagePath: 'assets/images/reading.png',
                  title: 'First see Learning',
                  subTitle:
                      'Forget abou the paper, now learning all in on place'),
              // Second Page
              appOnboardingPage(
                imagePath: 'assets/images/man.png',
                title: 'Connect with Everyone',
                subTitle:
                    'Always keep in touch with your tutor and friends. Let\'s get connected.',
              ),
              // Third Page
              appOnboardingPage(
                imagePath: 'assets/images/boy.png',
                title: 'Always Facinated Learning',
                subTitle:
                    'Anywhere, anytime. The time is at your discretion. So study wherever you can.',
              ),
            ],
          ),
          const Positioned(
            bottom: 0,
            left: 20,
            child: Text('widget one'),
          ),
          const Positioned(
            left: 200,
            child: Text('widget one'),
          ),
        ],
      ),
    );
  }
}
