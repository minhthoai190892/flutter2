import 'package:e_commerce_firebase/app/common/widgets/images/t_circular_image.dart';
import 'package:e_commerce_firebase/app/common/widgets/product_cart/t_product_price.dart';
import 'package:e_commerce_firebase/app/common/widgets/product_cart/t_rounded_container.dart';
import 'package:e_commerce_firebase/app/common/widgets/texts/t_brand_title_with_verify_icon.dart';
import 'package:e_commerce_firebase/app/modules/shop/product_detail/views/widgets/t_product_title_text_widget.dart';
import 'package:e_commerce_firebase/app/utils/constants/colors.dart';
import 'package:e_commerce_firebase/app/utils/constants/enums.dart';
import 'package:e_commerce_firebase/app/utils/constants/image_strings.dart';
import 'package:e_commerce_firebase/app/utils/constants/sizes.dart';
import 'package:e_commerce_firebase/app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFuntions.isDarkMode(context: context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // price and sale price
        Row(
          children: [
            // sale tag
            TRoundedContainer(
              radius: TSizes.sm,
              backgroundColor: TColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.sm, vertical: TSizes.xs),
              child: Text(
                '25%',
                style: Theme.of(context).textTheme.labelLarge!.apply(
                      color: TColors.black,
                    ),
              ),
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            // price
            Text(
              '\$250',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .apply(decoration: TextDecoration.lineThrough),
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            const TProductPrice(
              price: '175',
              isLage: true,
            )
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems / 1.5,
        ),
        // title
        const TProdcutTitleText(title: 'Green Nike Sport Shirt'),
        const SizedBox(
          height: TSizes.spaceBtwItems / 1.5,
        ),
        //stock status
        Row(
          children: [
            const TProdcutTitleText(title: 'Status'),
            const SizedBox(
              width: TSizes.spaceBtwItems / 1.5,
            ),
            Text(
              'In Stock',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems / 1.5,
        ),
        // brand
        Row(
          children: [
            TCircularImage(
              dark: dark,
              image: TImages.shoes,
              width: 32,
              height: 32,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            const TBrandTitleWithVerifyIcon(
              tile: 'Nike',
              brandTextSize: TextSize.medium,
            ),
          ],
        )
      ],
    );
  }
}
