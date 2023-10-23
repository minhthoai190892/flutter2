import 'package:flutter/material.dart';

import 'widgets.dart';

class Welcome extends StatelessWidget {
  Welcome({super.key});
  final PageController _controller = PageController();
// Todo: Thêm PageView
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            margin: const EdgeInsets.only(top: 30),
            child: Stack(
              children: [
                PageView(
                  controller: _controller,
                  // scrollDirection: Axis.vertical,
                  children: [
                    // First Page
                    appOnboardingPage(_controller,
                        index: 1,
                        imagePath: 'assets/images/reading.png',
                        title: 'First see Learning',
                        subTitle:
                            'Forget abou the paper, now learning all in on place'),

                    // Second Page
                    appOnboardingPage(
                      _controller,
                      index: 2,
                      imagePath: 'assets/images/man.png',
                      title: 'Connect with Everyone',
                      subTitle:
                          'Always keep in touch with your tutor and friends. Let\'s get connected.',
                    ),
                    // Third Page
                    appOnboardingPage(
                      _controller,
                      index: 3,
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
          ),
        ),
      ),
    );
  }
}
