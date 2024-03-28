import 'package:e_commerce_firebase/app/common/layouts/grid_layout.dart';
import 'package:e_commerce_firebase/app/common/widgets/brands/t_brand_cart.dart';
import 'package:e_commerce_firebase/app/common/widgets/products/sortable/sortable_products.dart';
import 'package:e_commerce_firebase/app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_firebase/app/modules/shop/all_brands/views/brand_product.dart';
import 'package:e_commerce_firebase/app/utils/constants/sizes.dart';
import 'package:e_commerce_firebase/app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/all_brands_controller.dart';

class AllBrandsView extends GetView<AllBrandsController> {
  const AllBrandsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final dark = THelperFuntions.isDarkMode(context: context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('AllBrandsView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // ! Heading
              const TSectionHeading(title: 'Brands'),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              // ! Brands
              TGridLayout(
                mainAxisExtent: 80,
                itemCount: 10,
                itemBuilder: (p0, p1) => TBrandCart(
                  dark: dark,
                  onTap: () => Get.to(() => const BrandProducts()),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
