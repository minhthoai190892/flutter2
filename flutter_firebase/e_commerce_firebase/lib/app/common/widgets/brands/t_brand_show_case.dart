import 'package:flutter/material.dart';

import 't_brand_cart.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../product_cart/t_rounded_container.dart';

class TBrandShowcase extends StatelessWidget {
  const TBrandShowcase({
    super.key,
    required this.dark,
    required this.images,
  });

  final bool dark;
  final List<String> images;
  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      showBorder: true,
      borderColor: TColors.darkGrey,
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Column(
        children: [
          // Brand with Product Count
          TBrandCart(
            dark: dark,
            showBorder: false,
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          // Brand top 3 product images
          Row(
            children: images
                .map((image) => brandTopProductImageWidget(image: image))
                .toList(),
          )
        ],
      ),
    );
  }

  Widget brandTopProductImageWidget({
    required String image,
  }) {
    return Expanded(
      child: TRoundedContainer(
        height: 100,
        width: 100,
        // padding: const EdgeInsets.all(TSizes.md),
        backgroundColor: dark ? TColors.darkerGrey : TColors.white,
        margin: const EdgeInsets.all(TSizes.sm),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image(
            fit: BoxFit.cover,
            width: 50,
            image: AssetImage(
              image,
            ),
          ),
        ),
      ),
    );
  }
}
