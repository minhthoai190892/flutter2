import 'package:e_commerce_firebase/app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_firebase/app/modules/shop/product_detail/views/widgets/t_button_add_to_cart.dart';
import 'package:e_commerce_firebase/app/modules/shop/product_detail/views/widgets/t_product_meta_data_widget.dart';
import 'package:e_commerce_firebase/app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

import '../../../../utils/helpers/helper_functions.dart';
import '../controllers/product_detail_controller.dart';
import 'widgets/t_product_attributes.dart';
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
                  const TRatingAndShare(),
                  // Price, title, stock, brand
                  const TProductMetaData(),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  // attributes
                  const TProductAttributes(),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  // checkout button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text('Checkout')),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  // description
                  const TSectionHeading(title: 'Description'),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  const ReadMoreText(
                    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Sit ab nesciunt rem molestias, deserunt sint voluptatibus, blanditiis corporis temporibus dolorum, expedita consequuntur laborum? Distinctio recusandae et quia nam ea pariatur vel maxime optio molestias nostrum est vero, totam consectetur accusantium commodi nulla deserunt libero eveniet ipsum. Sapiente accusamus nostrum praesentium?',
                    trimMode: TrimMode.Line,
                    trimLines: 2,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Less',
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                  //Review
                  const Divider(),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TSectionHeading(
                        title: 'Review(199)',
                        onPressed: () {},
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Iconsax.arrow_right_3))
                    ],
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: TBottomAddToCart(),
    );
  }
}
