import 'package:e_commerce_firebase/app/common/layouts/grid_layout.dart';
import 'package:e_commerce_firebase/app/common/widgets/appbar/app_bar_widget.dart';
import 'package:e_commerce_firebase/app/common/widgets/brands/t_brand_cart.dart';
import 'package:e_commerce_firebase/app/common/widgets/products/product_cart/product_cart_vertical.dart';
import 'package:e_commerce_firebase/app/common/widgets/products/sortable/sortable_products.dart';
import 'package:e_commerce_firebase/app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../utils/helpers/helper_functions.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFuntions.isDarkMode(context: context);

    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Nike'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // ! Brand details
              TBrandCart(dark: dark),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              // !Product
              const TSortableProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
