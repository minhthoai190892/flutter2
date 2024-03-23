import 'package:e_commerce_firebase/app/modules/shop/product_detail/views/widgets/t_product_title_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../common/widgets/products/cart/cart_item_widget.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final dark = THelperFuntions.isDarkMode(context: context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('CartView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) => Column(
                  children: [
                    const TCartItem(),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
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
            itemCount: 10),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () {}, child: const Text('Checkout \$25')),
      ),
    );
  }
}
