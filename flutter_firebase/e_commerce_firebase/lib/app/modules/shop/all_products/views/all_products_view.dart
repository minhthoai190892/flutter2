import 'package:e_commerce_firebase/app/common/layouts/grid_layout.dart';
import 'package:e_commerce_firebase/app/common/widgets/products/product_cart/product_cart_vertical.dart';
import 'package:e_commerce_firebase/app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/products/sortable/sortable_products.dart';
import '../controllers/all_products_controller.dart';

class AllProductsView extends GetView<AllProductsController> {
  const AllProductsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AllProductsView'),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          // !Dropdown button
          child: TSortableProducts(),
        ),
      ),
    );
  }
}
