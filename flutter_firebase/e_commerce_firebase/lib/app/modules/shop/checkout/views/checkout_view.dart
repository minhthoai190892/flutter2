import 'package:e_commerce_firebase/app/common/success_screen/success_screen.dart';
import 'package:e_commerce_firebase/app/common/widgets/products/product_cart/t_rounded_container.dart';
import 'package:e_commerce_firebase/app/modules/shop/cart/widget/cart_item.dart';
import 'package:e_commerce_firebase/app/modules/shop/checkout/widgets/billing_address_section.dart';
import 'package:e_commerce_firebase/app/modules/shop/checkout/widgets/billing_amount_section.dart';
import 'package:e_commerce_firebase/app/modules/shop/checkout/widgets/billing_payment_section.dart';
import 'package:e_commerce_firebase/app/utils/constants/colors.dart';
import 'package:e_commerce_firebase/app/utils/constants/sizes.dart';
import 'package:e_commerce_firebase/app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../common/widgets/products/cart/t_coupon_code.dart';
import '../../../../utils/constants/image_strings.dart';
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
              TCouponCode(dark: dark),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              TRoundedContainer(
                showBorder: true,
                backgroundColor: dark ? TColors.black : TColors.white,
                padding: const EdgeInsets.all(TSizes.md),
                child: const Column(
                  children: [
                    // !Pricing
                    TBillingAmountSection(),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    //! Divider
                    Divider(),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    //! Payment method
                    TBillingPaymentSection(),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    //! address
                    TBillingAddressSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(
          TSizes.defaultSpace,
        ),
        child: ElevatedButton(
            onPressed: () => Get.offAll(const SuccessScreen(
                  image: TImages.staticSuccessIllustration,
                  title: 'Payment success',
                  subTitle: 'Your item wil be shipped soon',
                )),
            child: const Text('Checkout \$25')),
      ),
    );
  }
}
