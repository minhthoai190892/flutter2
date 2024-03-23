import 'package:e_commerce_firebase/app/modules/shop/checkout/views/checkout_view.dart';
import 'package:e_commerce_firebase/app/modules/shop/product_detail/views/widgets/t_product_title_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../common/widgets/products/cart/cart_item_widget.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../controllers/cart_controller.dart';
import '../widget/cart_item.dart';

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
        child: CartItem(dark: dark),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () => Get.to(() => const CheckoutView()),
            child: const Text('Checkout \$25')),
      ),
    );
  }
}
