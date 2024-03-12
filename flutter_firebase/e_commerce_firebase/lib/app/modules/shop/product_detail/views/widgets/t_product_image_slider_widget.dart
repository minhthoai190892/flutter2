
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/appbar/app_bar_widget.dart';
import '../../../../../common/widgets/icons/t_circular_icon.dart';
import '../../../../../common/widgets/images/t_rounded_image_widget.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../homescreen/views/homescreen_view.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return TCurveEdgeWidget(
      child: Container(
        color: dark ? TColors.darkerGrey : TColors.light,
        child: Stack(
          children: [
            // main large Image
            const SizedBox(
              // height: 400,
              child: Center(
                child: Image(
                  image: AssetImage(TImages.product2),
                ),
              ),
            ),
    
            // Image Slider
            Positioned(
              right: 0,
              bottom: 30,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => TRoundedImage(
                          imageUrl: TImages.product2,
                          fit: BoxFit.cover,
                          width: 80,
                          // padding: const EdgeInsets.all(TSizes.sm),
                          backgroundColor:
                              dark ? TColors.darkerGrey : TColors.light,
                          border: Border.all(color: TColors.primary),
                        ),
                    separatorBuilder: (context, index) =>
                        const SizedBox(
                          width: TSizes.spaceBtwItems,
                        ),
                    itemCount: 4),
              ),
            ),
            // Appbar icon
            TAppBar(
              action: [
                TCircularIcon(
                  dark: dark,
                  icon: Iconsax.heart5,
                  color: Colors.red,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
