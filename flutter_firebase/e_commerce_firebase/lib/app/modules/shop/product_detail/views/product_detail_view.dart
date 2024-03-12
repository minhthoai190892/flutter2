import 'package:e_commerce_firebase/app/modules/shop/product_detail/views/widgets/t_product_meta_data_widget.dart';
import 'package:e_commerce_firebase/app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/helpers/helper_functions.dart';
import '../controllers/product_detail_controller.dart';
import 'widgets/t_product_image_slider_widget.dart';
import 'widgets/t_rating_and_share_widget.dart';

class ProductDetailView extends GetView<ProductDetailController> {
  const ProductDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final dark = THelperFuntions.isDarkMode(context: context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProductDetailView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //!TODO: Product Image slider
            TProductImageSlider(dark: dark),
            //!TODO: Product Details
            Padding(
              padding: const EdgeInsets.only(
                  right: TSizes.defaultSpace,
                  left: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  // rating & share
                  TRatingAndShare(),
                  // Price, title, stock, brand
                  TProductMetaData(),
                  // attributes
                  // checkout button
                  // description
                  //Review
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
