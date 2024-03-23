import 'package:flutter/material.dart';

import '../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../common/widgets/products/cart/cart_item_widget.dart';
import '../../../../utils/constants/sizes.dart';
import '../../product_detail/views/widgets/t_product_title_text_widget.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.dark,
    this.showAddRemoveButton = true,
    this.physics,
  });

  final bool dark;
  final bool showAddRemoveButton;
  final ScrollPhysics? physics;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: physics,
        itemBuilder: (context, index) => Column(
              children: [
                const TCartItem(),
                if (showAddRemoveButton)
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                if (showAddRemoveButton)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // ! extra space
                      Row(
                        children: [
                          const SizedBox(
                            width: 70,
                          ),
                          TProductQuantityAndAddRemoveButton(dark: dark),
                        ],
                      ),
                      const TProdcutTitleText(title: '\$25')
                    ],
                  )
              ],
            ),
        separatorBuilder: (context, index) => const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
        itemCount: 10);
  }
}
