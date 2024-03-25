import 'package:e_commerce_firebase/app/common/layouts/grid_layout.dart';
import 'package:e_commerce_firebase/app/common/widgets/products/product_cart/product_cart_vertical.dart';
import 'package:e_commerce_firebase/app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // !Dropdown button
              DropdownButtonFormField(
                items: [
                  'Name',
                  'Higher Price',
                  'Lower Price',
                  'Sale',
                  'Newest',
                  'Popularity',
                ]
                    .map((option) => DropdownMenuItem(
                          value: option,
                          child: Text(option),
                        ))
                    .toList(),
                onChanged: (value) {
                  print(value);
                },
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.sort),
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              TGridLayout(
                itemCount: 10,
                itemBuilder: (p0, p1) => const TProductCartVertical(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
