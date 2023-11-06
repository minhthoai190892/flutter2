import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/features/home/controller/home_controller.dart';
import '../../../common/utils/app_colors.dart';
import '../../../common/widgets/text_widgets.dart';
import '../../../global.dart';

Container userName() {
  return Container(
    child: text24Normal(
        text: Global.storageService.getUserProfile().name!,
        fontWeight: FontWeight.bold),
  );
}

Container helloText() {
  return Container(
    child: text24Normal(
        text: 'Hello,',
        color: AppColors.primaryThreeElementText,
        fontWeight: FontWeight.bold),
  );
}

Widget banner({required WidgetRef ref}) => Column(
      children: [
        // banner
        SizedBox(
          width: 325.w,
          height: 168.h,
          child: PageView(
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
