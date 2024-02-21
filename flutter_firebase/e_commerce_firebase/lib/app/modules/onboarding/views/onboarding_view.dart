import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/text_strings.dart';
import '../controllers/onboarding_controller.dart';
import 'onboarding_widget/onboarding_dot_navigation_widget.dart';
import 'onboarding_widget/onboarding_next_button_widget.dart';
import 'onboarding_widget/onboarding_page_widget.dart';
import 'onboarding_widget/onboarding_skip_widget.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final OnboardingController controller = Get.put(OnboardingController());
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('OnboardingView'),
      //   centerTitle: true,
      // ),
      body: Stack(
        children: [
          ///Horizontal Scrollable Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            // onPageChanged: (value) {
            //   controller.updatePageIndicator(value);
            // },
            children: [
              OnBoardingPage(
                image: TImages.onboardingImage1,
                title: TTexts.onboardingTitle1,
                subTitle: TTexts.onboardingSubTitle1,
              ),
              OnBoardingPage(
                image: TImages.onboardingImage2,
                title: TTexts.onboardingTitle2,
                subTitle: TTexts.onboardingSubTitle2,
              ),
              OnBoardingPage(
                image: TImages.onboardingImage3,
                title: TTexts.onboardingTitle3,
                subTitle: TTexts.onboardingSubTitle3,
              ),
            ],
          ),
          // Skip button
          const OnBoardingSkip(),
          // dot navigation SmoothPageIndicator
          const OnBoardingDotNavigation(),
          //Circulor Button
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}
