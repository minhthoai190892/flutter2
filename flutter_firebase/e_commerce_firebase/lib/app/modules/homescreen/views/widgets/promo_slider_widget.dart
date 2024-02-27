import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_firebase/app/modules/homescreen/controllers/homescreen_controller.dart';
import 'package:e_commerce_firebase/app/utils/constants/colors.dart';
import 'package:e_commerce_firebase/app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/containers/circular_container.dart';
import '../../../../common/widgets/images/t_rounded_image_widget.dart';
import '../../../../utils/constants/image_strings.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key,
    required this.height,
    required this.banners,
  });

  final double height;
  final List<String> banners;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomescreenController());
    return Column(
      children: [
        CarouselSlider(
          items: banners
              .map((url) => TRoundedImage(
                    imageUrl: url,
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
                  ))
              .toList(),
          options: CarouselOptions(
            //!TODO: hiện tỷ lệ khung hình
            viewportFraction: 1,
            autoPlay: true,
            onPageChanged: (index, reason) =>
                controller.updatePageIndicator(index),
          ),
        ),
        SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 0; i < banners.length; i++)
                TCircularContainer(
                  width: 20,
                  height: 4,
                  margin: const EdgeInsets.only(right: 10),
                  backgroundColor: controller.carouselCurrentIndex.value == i
                      ? TColors.primary
                      : TColors.grey,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
