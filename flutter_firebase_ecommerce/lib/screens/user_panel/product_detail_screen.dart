// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_firebase_ecommerce/models/product_model.dart';
import 'package:flutter_firebase_ecommerce/utils/app_constant.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({
    Key? key,
    required this.productModel,
  }) : super(key: key);
  final ProductModel productModel;
  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstant.appMainColor,
        title: const Text(
          'Product Details ',
          style: AppConstant.textStyleWhite,
        ),
        iconTheme: const IconThemeData(color: AppConstant.appTextColor),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: Get.height / 60,
            ),
            // product image
            CarouselSlider(
              items: widget.productModel.productImages
                  .map((imageUrls) => ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: CachedNetworkImage(
                          imageUrl: imageUrls,
                          fit: BoxFit.cover,
                          width: Get.width - 10,
                          placeholder: (context, url) => const ColoredBox(
                            color: Colors.white,
                            child: Center(
                              child: CupertinoActivityIndicator(),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ))
                  .toList(),
              options: CarouselOptions(
                  autoPlay: true,
                  scrollDirection: Axis.horizontal,
                  aspectRatio: 2.5,
                  viewportFraction: 1),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Card(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Product Name: ${widget.productModel.productName}',
                            ),
                            IconButton(
                                onPressed: () {},
                                icon:
                                    const Icon(Icons.favorite_border_outlined))
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Text('PKR: ${widget.productModel.fullPrice}'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                            'Category Name: ${widget.productModel.categoryName}'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                            'Product description: ${widget.productModel.productDescription}'),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Material(
                            child: Container(
                              width: Get.width / 3,
                              height: Get.height / 16,
                              decoration: BoxDecoration(
                                  color: AppConstant.appMainColor,
                                  borderRadius: BorderRadius.circular(20)),
                              child: TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'WhatsApp',
                                  style: TextStyle(
                                      color: AppConstant.appTextColor),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Material(
                            child: Container(
                              width: Get.width / 3,
                              height: Get.height / 16,
                              decoration: BoxDecoration(
                                  color: AppConstant.appMainColor,
                                  borderRadius: BorderRadius.circular(20)),
                              child: TextButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.shopping_cart,
                                    color: AppConstant.appTextColor,
                                    size: 40,
                                  ),
                                  label: const Text(
                                    'Add to cart',
                                    style: TextStyle(
                                        color: AppConstant.appTextColor),
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
