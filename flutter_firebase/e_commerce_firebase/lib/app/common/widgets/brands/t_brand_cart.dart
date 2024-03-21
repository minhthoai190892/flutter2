import 'package:flutter/material.dart';

import '../images/t_circular_image.dart';
import '../products/product_cart/t_rounded_container.dart';
import '../texts/t_brand_title_with_verify_icon.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';

class TBrandCart extends StatelessWidget {
  const TBrandCart({
    super.key,
    required this.dark,
    this.showBorder = true,
  });

  final bool dark;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GestureDetector(
        onTap: () {
        
        },
        child: TRoundedContainer(
          width: double.infinity,
          padding: const EdgeInsets.all(TSizes.sm),
          showBorder: showBorder,
          backgroundColor: Colors.transparent,
          child: Row(
            children: [
              //!TODO: icons
              TCircularImage(
                dark: dark,
                image: TImages.smartIcon,
                backgroundColor: Colors.transparent,
                overlayColor: dark ? TColors.white : TColors.black,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),
              //!TODO: Texts
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //!TODO: Brand Title and Verify
                    TBrandTitleWithVerifyIcon(
                      tile: 'Shose',
                      brandTextSize: TextSize.large,
                      textColor: dark ? TColors.white : TColors.black,
                    ),
                    Text(
                      '256 products ',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

 
}
