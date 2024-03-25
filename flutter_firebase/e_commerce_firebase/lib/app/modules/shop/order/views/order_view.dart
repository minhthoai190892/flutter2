import 'package:e_commerce_firebase/app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/order_controller.dart';
import '../widgets/order_list_item.dart';

class OrderView extends GetView<OrderController> {
  const OrderView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OrderView'),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: TOrderListItem(),
      ),
    );
  }
}
