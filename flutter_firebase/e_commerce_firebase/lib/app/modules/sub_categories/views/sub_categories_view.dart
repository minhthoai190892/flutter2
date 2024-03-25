import 'package:e_commerce_firebase/app/common/widgets/images/t_rounded_image_widget.dart';
import 'package:e_commerce_firebase/app/common/widgets/products/product_cart/product_cart_horizontal.dart';
import 'package:e_commerce_firebase/app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_firebase/app/utils/constants/image_strings.dart';
import 'package:e_commerce_firebase/app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/sub_categories_controller.dart';

class SubCategoriesView extends GetView<SubCategoriesController> {
  const SubCategoriesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sports shirts'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // ! banner
              const TRoundedImage(
                width: double.infinity,
                imageUrl: TImages.prod2,
                applyImageRadius: true,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              // !sub categories
              Column(
                children: [
                  // ! heading
                  TSectionHeading(
                    title: 'Sports Shirts',
                    showActionButton: true,
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            const TProductCartHorizontal(),
                        separatorBuilder: (context, index) => const SizedBox(
                              width: TSizes.spaceBtwItems,
                            ),
                        itemCount: 10),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
