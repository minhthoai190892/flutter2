// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';
import 'package:ulearning_app/features/home/controller/home_controller.dart';

import '../../../common/utils/app_colors.dart';
import '../../../common/widgets/app_shadow.dart';
import '../../../common/widgets/text_widgets.dart';
import '../../../global.dart';

class UserName extends StatelessWidget {
  const UserName({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text24Normal(
        text: "Global.storageService.getUserProfile()",
        fontWeight: FontWeight.bold);
  }
}

class HelloText extends StatelessWidget {
  const HelloText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text24Normal(
        text: 'Hello,',
        color: AppColors.primaryThreeElementText,
        fontWeight: FontWeight.bold);
  }
}

class HomeBanner extends StatelessWidget {
  const HomeBanner({
    Key? key,
    required this.controller,
    required this.ref,
  }) : super(key: key);
  final PageController controller;
  final WidgetRef ref;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // banner
        SizedBox(
          width: 325.w,
          height: 168.h,
          child: PageView(
            controller: controller,
            // xem index của PageView
            onPageChanged: (value) =>
                ref.read(homeScreenBannerDotsProvider.notifier).setIndex(value),
            children: [
              bannerContainer(imagePath: ImageRes.banner1),
              bannerContainer(imagePath: ImageRes.banner2),
              bannerContainer(imagePath: ImageRes.banner3),
            ],
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        // dots
        DotsIndicator(
          position:
              ref.watch(homeScreenBannerDotsProvider), // vị trí của từng page
          dotsCount: 3, //số lượng
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 8.0),
            activeShape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(5), // Thay đổi hình dạng của dots
            ),
          ),
        )
      ],
    );
  }
}

Container bannerContainer({required String imagePath}) {
  return Container(
    width: 325.w,
    height: 140.h,
    decoration: BoxDecoration(
      // color: Colors.red,
      image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage(imagePath),
      ),
    ),
  );
}

AppBar homeAppBar(WidgetRef ref) {
  var profile = ref.watch(homeUserProfileProvider);
  print(profile);
  return AppBar(
    title: Container(
      margin: EdgeInsets.only(left: 7.w, right: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          appImage(imagePath: ImageRes.menu, width: 18.w, height: 12.h),
          GestureDetector(
            child: const AppBoxDecorationImage(),
          ),
        ],
      ),
    ),
  );
}

class HomeMenuBar extends StatelessWidget {
  const HomeMenuBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // see all course
        Container(
          margin: EdgeInsets.only(top: 15.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text16Normal(
                text: 'Choice your course',
                color: AppColors.primaryText,
                fontWeight: FontWeight.bold,
              ),
              GestureDetector(
                child: const Text10Normal(text: 'See all'),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        // course item button
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              decoration:
                  appBoxShadow(color: AppColors.primaryElement, radius: 7.w),
              child: const Text11Normal(text: 'All'),
            ),
            Container(
              margin: EdgeInsets.only(left: 30.w),
              child: const Text11Normal(
                text: 'Popular',
                color: AppColors.primaryThreeElementText,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 30.w),
              child: const Text11Normal(
                text: 'Newest',
                color: AppColors.primaryThreeElementText,
              ),
            ),
          ],
        )
      ],
    );
  }
}
