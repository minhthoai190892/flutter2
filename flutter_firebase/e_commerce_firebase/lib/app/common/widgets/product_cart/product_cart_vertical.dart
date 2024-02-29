import 'package:e_commerce_firebase/app/common/styles/shadow_style.dart';
import 'package:e_commerce_firebase/app/common/widgets/images/t_rounded_image_widget.dart';
import 'package:e_commerce_firebase/app/utils/constants/colors.dart';
import 'package:e_commerce_firebase/app/utils/constants/image_strings.dart';
import 'package:e_commerce_firebase/app/utils/constants/sizes.dart';
import 'package:e_commerce_firebase/app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../icons/t_circular_icon.dart';
import '../texts/product_title.dart';
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
      onTap: () {},
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
            Padding(
              padding: const EdgeInsets.all(TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //!TODO: Title
                  const ProductTitle(title: 'Nhan', smallSize: true),
                  const SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),
                  Row(
                    children: [
                      //!TODO: SubTitle
                      Text(
                        'Nhan',
                        style: Theme.of(context).textTheme.labelMedium,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: TSizes.xs,
                      ),
                      Icon(
                        Iconsax.verify5,
                        color: TColors.primary,
                        size: TSizes.iconXs,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //!TODO: Price
                      const TProductPrice(price: '3'),
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
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TProductPrice extends StatelessWidget {
  const TProductPrice({
    super.key,
    this.currencySign = '\$',
    required this.price,
    this.maxLines = 1,
    this.isLage = false,
    this.lineThrough = false,
  });
  final String currencySign, price;
  final int maxLines;
  final bool isLage, lineThrough;

  @override
  Widget build(BuildContext context) {
    return Text(
      currencySign + price,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: isLage
          ? Theme.of(context).textTheme.headlineMedium!.apply(
              decoration: lineThrough ? TextDecoration.lineThrough : null)
          : Theme.of(context).textTheme.titleLarge!.apply(
              decoration: lineThrough ? TextDecoration.lineThrough : null),
    );
  }
}
