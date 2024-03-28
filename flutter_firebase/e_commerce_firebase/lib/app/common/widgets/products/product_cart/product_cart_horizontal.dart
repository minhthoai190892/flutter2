import 'package:e_commerce_firebase/app/common/styles/shadow_style.dart';
import 'package:e_commerce_firebase/app/common/widgets/icons/t_circular_icon.dart';
import 'package:e_commerce_firebase/app/common/widgets/images/t_rounded_image_widget.dart';
import 'package:e_commerce_firebase/app/common/widgets/products/product_cart/t_product_price.dart';
import 'package:e_commerce_firebase/app/common/widgets/products/product_cart/t_rounded_container.dart';
import 'package:e_commerce_firebase/app/common/widgets/texts/product_title.dart';
import 'package:e_commerce_firebase/app/common/widgets/texts/t_brand_title_text.dart';
import 'package:e_commerce_firebase/app/utils/constants/colors.dart';
import 'package:e_commerce_firebase/app/utils/constants/image_strings.dart';
import 'package:e_commerce_firebase/app/utils/constants/sizes.dart';
import 'package:e_commerce_firebase/app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TProductCartHorizontal extends StatelessWidget {
  const TProductCartHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFuntions.isDarkMode(context: context);

    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        boxShadow: [TShadowStyle.verticalProductShadow],
        borderRadius: BorderRadius.circular(TSizes.productImageRadius),
        color: dark ? TColors.darkerGrey : TColors.white,
      ),
      child: Row(
        children: [
          // !Thumbnail
          TRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(TSizes.sm),
            backgroundColor: dark ? TColors.dark : TColors.light,
            child: Stack(
              children: [
                const SizedBox(
                  width: 120,
                  height: 120,
                  child: TRoundedImage(
                    imageUrl: TImages.prod1,
                    applyImageRadius: true,
                  ),
                ),
                // !sale tag
                Positioned(
                  top: 12,
                  child: TRoundedContainer(
                    radius: TSizes.sm,
                    backgroundColor: TColors.secondary.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(
                        horizontal: TSizes.sm, vertical: TSizes.xs),
                    child: Text(
                      '25%',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .apply(color: Colors.black),
                    ),
                  ),
                ),
                // ! favorite icon
                Positioned(
                  top: 0,
                  right: 0,
                  child: TCircularIcon(
                    dark: dark,
                    icon: Iconsax.heart5,
                    color: Colors.red,
                  ),
                )
              ],
            ),
          ),
          // ! details
          SizedBox(
            width: 172,
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: TSizes.sm, left: TSizes.sm),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ! title product
                      const TProductTitle(
                        title: 'Green Nike Half Sleeves Shirt',
                        smallSize: true,
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems / 2,
                      ),
                      // ! brand
                      const TBrandTitleText(tile: 'Nike'),

                      // ! price and add to cart button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Flexible(
                              child:
                                  TProductPrice(price: '256.0 - 25132165.0')),
                          // ! add to cart button
                          Container(
                            decoration: BoxDecoration(
                              color: TColors.dark,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(TSizes.cardRadiusMd),
                                bottomRight:
                                    Radius.circular(TSizes.productImageRadius),
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
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
