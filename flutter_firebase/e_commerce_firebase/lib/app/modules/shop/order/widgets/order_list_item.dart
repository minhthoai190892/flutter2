import 'package:e_commerce_firebase/app/common/widgets/products/product_cart/t_rounded_container.dart';
import 'package:e_commerce_firebase/app/utils/constants/colors.dart';
import 'package:e_commerce_firebase/app/utils/constants/sizes.dart';
import 'package:e_commerce_firebase/app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TOrderListItem extends StatelessWidget {
  const TOrderListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFuntions.isDarkMode(context: context);
    return ListView.separated(
      itemBuilder: (context, index) => TRoundedContainer(
        showBorder: true,
        backgroundColor: dark ? TColors.dark : TColors.light,
        padding: const EdgeInsets.all(TSizes.md),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // ! row 1
            Row(
              children: [
                // ! icon
                const Icon(Iconsax.ship),
                const SizedBox(
                  width: TSizes.spaceBtwItems / 2,
                ),
                // ! status and date
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Processing',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .apply(color: TColors.primary, fontWeightDelta: 1),
                      ),
                      Text('07 Nov 2014',
                          style: Theme.of(context).textTheme.headlineSmall),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Iconsax.arrow_right_34,
                    size: TSizes.iconSm,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            // ! row 2
            Row(
              children: [
                // ! icon
                const Icon(Iconsax.tag),
                const SizedBox(
                  width: TSizes.spaceBtwItems / 2,
                ),
                // ! status and date
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Order',
                          style: Theme.of(context).textTheme.bodyLarge),
                      Text('[#2345]',
                          style: Theme.of(context).textTheme.headlineSmall),
                    ],
                  ),
                ),
                Row(
                  children: [
                    const Icon(Iconsax.calendar),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Shopping date',
                          style: Theme.of(context).textTheme.bodyLarge!.apply(
                              color: TColors.primary, fontWeightDelta: 1),
                        ),
                        Text('07 Nov 2014',
                            style: Theme.of(context).textTheme.headlineSmall),
                      ],
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
      separatorBuilder: (context, index) => const SizedBox(
        height: TSizes.spaceBtwItems,
      ),
      itemCount: 5,
      shrinkWrap: true,
    );
  }
}
