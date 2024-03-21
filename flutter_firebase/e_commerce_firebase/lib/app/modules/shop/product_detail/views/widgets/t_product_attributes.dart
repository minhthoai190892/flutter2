import 'package:e_commerce_firebase/app/common/widgets/chips/t_choice_chip.dart';
import 'package:e_commerce_firebase/app/common/widgets/products/product_cart/t_product_price.dart';
import 'package:e_commerce_firebase/app/common/widgets/products/product_cart/t_rounded_container.dart';
import 'package:e_commerce_firebase/app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_firebase/app/modules/shop/product_detail/views/widgets/t_product_title_text_widget.dart';
import 'package:e_commerce_firebase/app/utils/constants/colors.dart';
import 'package:e_commerce_firebase/app/utils/constants/sizes.dart';
import 'package:e_commerce_firebase/app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFuntions.isDarkMode(context: context);
    return Column(
      children: [
        // seleced attributes pricing and description
        TRoundedContainer(
          padding: const EdgeInsets.all(TSizes.md),
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          child: Column(
            children: [
              // title, price and stock status
              Row(
                children: [
                  const TSectionHeading(
                    title: 'Variation',
                  ),
                  const SizedBox(
                    width: TSizes.spaceBtwItems,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          // Actual price
                          const TProdcutTitleText(
                            title: 'Price: ',
                            smallSize: true,
                          ),
                          Text(
                            '\$25',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(
                            width: TSizes.spaceBtwItems,
                          ),
                          // sale price
                          const TProductPrice(price: '20')
                        ],
                      ),
                      Row(
                        children: [
                          // Actual price
                          const TProdcutTitleText(
                            title: 'Stock: ',
                            smallSize: true,
                          ),
                          Text(
                            'In Stock ',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              // variation description
              const TProdcutTitleText(
                title:
                    'This is the description of the Product and it can go upto max 4 lines',
                smallSize: true,
                maxline: 4,
              )
            ],
          ),
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        // attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(title: 'Colors'),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            Wrap(spacing: 8, children: [
              TChoiceChip(
                text: 'Pink',
                selected: true,
                onSelected: (p0) {},
              ),
              TChoiceChip(
                text: 'Blue',
                selected: false,
                onSelected: (p0) {},
              ),
              TChoiceChip(
                text: 'Yellow',
                selected: false,
                onSelected: (p0) {},
              ),
            ]),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(title: 'Size'),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(
                  text: 'EU 34',
                  selected: true,
                  onSelected: (p0) {},
                ),
                TChoiceChip(
                  text: 'EU 36',
                  selected: false,
                  onSelected: (p0) {},
                ),
                TChoiceChip(
                  text: 'EU 38',
                  selected: false,
                  onSelected: (p0) {},
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
