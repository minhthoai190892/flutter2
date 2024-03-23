import 'package:e_commerce_firebase/app/common/widgets/products/product_cart/t_rounded_container.dart';
import 'package:e_commerce_firebase/app/modules/shop/cart/widget/cart_item.dart';
import 'package:e_commerce_firebase/app/utils/constants/colors.dart';
import 'package:e_commerce_firebase/app/utils/constants/sizes.dart';
import 'package:e_commerce_firebase/app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/checkout_controller.dart';

class CheckoutView extends GetView<CheckoutController> {
  const CheckoutView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final dark = THelperFuntions.isDarkMode(context: context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('CheckoutView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              CartItem(
                  dark: dark,
                  showAddRemoveButton: false,
                  physics: const NeverScrollableScrollPhysics()),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              // ! coupon Textfield
              TRoundedContainer(
                showBorder: true,
                width: double.infinity,
                backgroundColor: dark ? TColors.white : TColors.dark,
                padding: const EdgeInsets.only(
                  top: TSizes.sm,
                  left: TSizes.md,
                  right: TSizes.sm,
                  bottom: TSizes.sm,
                ),
                child: Row(
                  children: [
                    Flexible(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Have a promo code? Enter here',
                          hintStyle: TextStyle(
                            color: Colors.red,
                            fontSize: 15,
                          ),
                          focusedBorder: InputBorder.none,
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    ElevatedButton(onPressed: () {}, child: const Text('Apply'))
                  ],
                ),
              ),
              const Text('data'),
            ],
          ),
        ),
      ),
    );
  }
}
