import 'package:e_commerce_firebase/app/common/styles/shadow_style.dart';
import 'package:e_commerce_firebase/app/common/widgets/images/t_rounded_image_widget.dart';
import 'package:e_commerce_firebase/app/modules/shop/product_detail/views/product_detail_view.dart';
import 'package:e_commerce_firebase/app/utils/constants/colors.dart';
import 'package:e_commerce_firebase/app/utils/constants/image_strings.dart';
import 'package:e_commerce_firebase/app/utils/constants/sizes.dart';
import 'package:e_commerce_firebase/app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../icons/t_circular_icon.dart';
import '../../texts/product_title.dart';
import '../../texts/t_brand_title_with_verify_icon.dart';
import 't_product_price.dart';
import 't_rounded_container.dart';

class TProductCartVertical extends StatelessWidget {
  ///Thumbnail, wishlist button,discount tag,detail
  const TProductCartVertical({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFuntions.isDarkMode(context: context);
    return GestureDetector(
      onTap: () {
        Get.to(() => const ProductDetailView());
      },
      child: Container(
        width: 180,
        // height: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          color: dark ? TColors.darkGrey : TColors.white,
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
        ),
        child: Column(
          children: [
            //!TODO: Thumbnail, wishlist button,discount tag
            TRoundedContainer(
              height: 180,
              padding: const EdgeInsetsDirectional.all(TSizes.sm),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  //!TODO: Thumbnail,
                  const TRoundedImage(
                    height: double.infinity,
                    imageUrl: TImages.product1,
                    fit: BoxFit.cover,
                  ),
                  //!TODO: sale tag,
                  Positioned(
                    top: 12,
                    child: TRoundedContainer(
                      padding: const EdgeInsets.symmetric(
                          horizontal: TSizes.sm, vertical: TSizes.xs),
                      radius: TSizes.sm,
                      backgroundColor: TColors.secondary.withOpacity(0.8),
                      child: Text(
                        '25%',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: TColors.black),
                      ),
                    ),
                  ),
                  // favourite Icon button
                  Positioned(
                    right: 0,
                    top: 0,
                    child: TCircularIcon(
                      dark: dark,
                      icon: Iconsax.heart5,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            //!TODO: Details
            const Padding(
              padding: EdgeInsets.all(TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //!TODO: Title
                  TProductTitle(title: 'Nhan', smallSize: true),
                  SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),
                  //!TODO: Title and Verify icon
                  TBrandTitleWithVerifyIcon(tile: 'Nhan'),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //!TODO: Price
                const TProductPrice(price: '3'),
                //!TODO: add button
                Container(
                  decoration: BoxDecoration(
                    color: TColors.dark,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(TSizes.cardRadiusMd),
                      bottomRight: Radius.circular(TSizes.productImageRadius),
                    ),
                  ),
                  child: const SizedBox(
                    width: TSizes.iconLg * 1.2,
                    height: TSizes.iconLg * 1.2,
                    child: Center(
                      child: Icon(
                        Iconsax.add,
                        color: TColors.white,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
