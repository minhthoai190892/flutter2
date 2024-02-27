
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/device/device_utility.dart';
import '../../../utils/helpers/helper_functions.dart';

class TSearchContainer extends StatelessWidget {
  const TSearchContainer({
    super.key,
    required this.text,
    this.icon,
    this.showBackground = true,
    this.showBorder = true,
  });
  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFuntions.isDarkMode(context: context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
      child: Container(
        width: TDeviceUtils.getScreenWidth(),
        padding: EdgeInsets.all(TSizes.md),
        decoration: BoxDecoration(
            color: showBackground
                ? dark
                    ? TColors.dark
                    : TColors.white
                : Colors.transparent,
            borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
            border: showBorder ? Border.all(color: TColors.grey) : null),
        child: Row(
          children: [
            Icon(
              icon,
              color: dark ? TColors.white : TColors.darkerGrey,
            ),
            SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: dark ? TColors.white : TColors.darkerGrey),
            ),
          ],
        ),
      ),
    );
  }
}