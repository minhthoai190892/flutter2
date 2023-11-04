import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:qr_code_getx/app/data/models/product_model.dart';
import 'package:qr_code_getx/app/routes/app_pages.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../controllers/products_controller.dart';

class ProductsView extends GetView<ProductsController> {
  const ProductsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: controller.streamProducts(),
          builder: (context, snapProducts) {
            if (snapProducts.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapProducts.data!.docs.isEmpty) {
              return const Center(
                child: Text('No Products'),
              );
            }
            List<ProductModel> allProducts = [];
            for (var element in snapProducts.data!.docs) {
              allProducts.add(ProductModel.fromJson(element.data()));
            }
            return ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: allProducts.length,
              itemBuilder: (context, index) {
                ProductModel product = allProducts[index];
                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.only(bottom: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(Routes.DETAIL_PRODUCT, arguments: product);
                    },
                    child: Container(
                      height: 100,
                      color: Colors.grey[300],
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  product.code,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(product.name),
                                Text('Quantity: ${product.qty}'),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 50,
                            width: 50,
                            child: QrImageView(
                              data: product.code,
                              size: 200,
                              version: QrVersions.auto,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}
