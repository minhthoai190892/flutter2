// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_print, use_build_context_synchronously
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce/controllers/cart_price_controller.dart';
import 'package:flutter_firebase_ecommerce/controllers/get_customer_device_token.dart';
import 'package:flutter_firebase_ecommerce/services/place_order_service.dart';
import 'package:flutter_firebase_ecommerce/utils/app_constant.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:get/get.dart';

import '../../models/cart_model.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  final User? currentUser = FirebaseAuth.instance.currentUser;
  final ProductPriceController productPriceController =
      Get.put(ProductPriceController());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppConstant.appTextColor),
        title: const Text('CheckOut Screen'),
        backgroundColor: AppConstant.appMainColor,
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('cart')
            .doc(currentUser!.uid)
            .collection('cartOrders')
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Error'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SizedBox(
              height: Get.height / 5,
              child: const Center(
                child: CupertinoActivityIndicator(),
              ),
            );
          }
          if (snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text('No products found!'),
            );
          }
          if (snapshot.data != null) {
            return ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                var data = snapshot.data!.docs[index];

                CartModel cartModel = CartModel(
                  productId: data['productId'],
                  categoryId: data['categoryId'],
                  productName: data['productName'],
                  categoryName: data['categoryName'],
                  salePrice: data['salePrice'],
                  fullPrice: data['fullPrice'],
                  productImages: data['productImages'],
                  deliveryTime: data['deliveryTime'],
                  isSale: data['isSale'],
                  productDescription: data['productDescription'],
                  createdAt: data['createdAt'],
                  updatedAt: data['updatedAt'],
                  productQuantity: data['productQuantity'],
                  productTotalPrice: data['productTotalPrice'],
                );

                // calculate the total price
                productPriceController.fetchProductPrice();
                return SwipeActionCell(
                  key: ObjectKey(cartModel.productId),
                  trailingActions: [
                    SwipeAction(
                      title: 'Delete',
                      forceAlignmentToBoundary: true,
                      performsFirstActionWithFullSwipe: true,
                      onTap: (CompletionHandler handler) async {
                        try {
                          await FirebaseFirestore.instance
                              .collection('cart')
                              .doc(currentUser!.uid)
                              .collection('cartOrders')
                              .doc(cartModel.productId)
                              .delete();
                        } catch (e) {
                          print(e);
                        }
                      },
                    )
                  ],
                  child: Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage(cartModel.productImages[0]),
                      ),
                      title: Text(cartModel.productName),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(cartModel.productTotalPrice.toString()),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return Container();
        },
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(() => Text(
                  "PKR: ${productPriceController.totalPrice.value.toStringAsFixed(1)}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                child: Container(
                  width: Get.width / 2,
                  height: Get.height / 18,
                  decoration: BoxDecoration(
                      color: AppConstant.appMainColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    onPressed: () {
                      showCustomBottomSheet();
                    },
                    child: const Text(
                      'Confirm Order',
                      style: TextStyle(color: AppConstant.appTextColor),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showCustomBottomSheet() {
    Get.bottomSheet(
      Container(
        height: Get.height * 0.8,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CheckOutFormField(
                  controller: nameController,
                  label: 'Name',
                  keyboardType: TextInputType.text),
              CheckOutFormField(
                  controller: phoneController,
                  label: 'Phone',
                  keyboardType: TextInputType.phone),
              CheckOutFormField(
                  controller: addressController,
                  label: 'Address',
                  keyboardType: TextInputType.text),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppConstant.appMainColor,
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                ),
                onPressed: () async {
                  final String name = nameController.text.trim();
                    final String phone = phoneController.text.trim();
                    final String address = addressController.text.trim();
                    // get token
                    String customerToken = await getCustomerDeviceToken();
                    placeOrder(
                        context: context,
                        customerName: name,
                        customerPhone: phone,
                        customerAddress: address,
                        customerDeviceToken: customerToken);
                },
                child: const Text(
                  'Place Order',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CheckOutFormField extends StatelessWidget {
  const CheckOutFormField({
    Key? key,
    required this.label,
    required this.keyboardType,
    required this.controller,
  }) : super(key: key);
  final String label;
  final TextInputType keyboardType;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: SizedBox(
        height: 50,
        child: TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            label: Text(label),
            hintStyle: const TextStyle(fontSize: 12),
          ),
        ),
      ),
    );
  }
}
