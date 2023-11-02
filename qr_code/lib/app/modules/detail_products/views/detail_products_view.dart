import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_products_controller.dart';

class DetailProductsView extends GetView<DetailProductsController> {
  const DetailProductsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailProductsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DetailProductsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
