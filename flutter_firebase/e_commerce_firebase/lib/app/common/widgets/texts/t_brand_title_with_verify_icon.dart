import 'package:e_commerce_firebase/app/utils/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import 't_brand_title_text.dart';

class TBrandTitleWithVerifyIcon extends StatelessWidget {
  const TBrandTitleWithVerifyIcon({
    super.key,
    required this.tile,
    this.textColor,
    this.iconColor = TColors.primary,
    this.maxLines = 1,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSize.small,
  });
  final String tile;
  final Color? textColor, iconColor;
  final int maxLines;
  final TextAlign? textAlign;
  final TextSize brandTextSize;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //!TODO: SubTitle
        TBrandTitleText(
          tile: tile,
          maxLines: maxLines,
          brandTextSize: TextSize.small,
          textAlign: textAlign,
          color: textColor,
        ),
        const SizedBox(
          height: TSizes.xs,
        ),
        Icon(
          Iconsax.verify5,
          color: iconColor,
          size: TSizes.iconXs,
        )
      ],
    );
  }
}
