
import 'package:flutter/material.dart';

import '../../../../modules/shop/product_detail/views/widgets/t_product_title_text_widget.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../images/t_rounded_image_widget.dart';
import '../../texts/t_brand_title_with_verify_icon.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // ! Image product
        const TRoundedImage(
          imageUrl: TImages.prod1,
          width: 60,
          height: 60,
        ),
        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),
        // ! title, price and size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TBrandTitleWithVerifyIcon(tile: 'Nike'),
              const TProdcutTitleText(
                title: 'Black Sports shoes',
                maxline: 1,
              ),
              // ! Attributes
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Color',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall,
                    ),
                    TextSpan(
                      text: 'Green',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge,
                    ),
                    TextSpan(
                      text: 'Size',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall,
                    ),
                    TextSpan(
                      text: 'UK 08',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
