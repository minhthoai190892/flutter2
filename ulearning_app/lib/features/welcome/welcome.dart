// ignore_for_file: must_be_immutable

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'notifier/welcome_notifier.dart';
import 'widgets.dart';

// river pod
// final indexProvider = StateProvider((ref) => 0);

class Welcome extends ConsumerStatefulWidget {
  const Welcome({super.key});

  @override
  ConsumerState<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends ConsumerState<Welcome> {
  final PageController _controller = PageController();

  // int dotsIndex = 0;

// Todo: Thêm PageView
  @override
  Widget build(BuildContext context) {
    // xem trạng thái của
    final index = ref.watch(indexDotProvider);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            margin: const EdgeInsets.only(top: 30),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                // showing our three welcome page
                PageView(
                  onPageChanged: (value) {
                    // setState(() {
                    //   dotsIndex = value;
                    // });
                    ref.read(indexDotProvider.notifier).changeIndex(value);
                  },
                  controller: _controller,
                  // scrollDirection: Axis.vertical,
                  children: [
                    // First Page
                    AppOnboardingPage(
                        controller: _controller,
                        context: context,
                        index: 1,
                        imagePath: ImageRes.reading,
                        title: 'First see Learning',
                        subTitle:
                            'Forget abou the paper, now learning all in on place'),

                    // Second Page
                    AppOnboardingPage(
                      controller: _controller,
                      context: context,
                      index: 2,
                      imagePath: ImageRes.man,
                      title: 'Connect with Everyone',
                      subTitle:
                          'Always keep in touch with your tutor and friends. Let\'s get connected.',
                    ),
                    // Third Page
                    AppOnboardingPage(
                      controller: _controller,
                      context: context,
                      index: 3,
                      imagePath: 'assets/images/boy.png',
                      title: 'Always Facinated Learning',
                      subTitle:
                          'Anywhere, anytime. The time is at your discretion. So study wherever you can.',
                    ),
                  ],
                ),
                //  for showing dots
                Positioned(
                  bottom: 50,
                  child: DotsIndicator(
                    position: index, // vị trí của từng page
                    dotsCount: 3, //số lượng
                    decorator: DotsDecorator(
                      size: const Size.square(9.0),
                      activeSize: const Size(18.0, 8.0),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            5), // Thay đổi hình dạng của dots
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
