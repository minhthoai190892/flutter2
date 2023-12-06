import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_firebase_ecommerce/models/order_model.dart';
import 'package:flutter_firebase_ecommerce/screens/user_panel/main_screen.dart';
import 'package:flutter_firebase_ecommerce/services/generate_order_id_service.dart';
import 'package:flutter_firebase_ecommerce/utils/app_constant.dart';
import 'package:get/get.dart';

void placeOrder(
    {required BuildContext context,
    required String customerName,
    required String customerPhone,
    required String customerAddress,
    required customerDeviceToken}) async {
  EasyLoading.show(status: 'Please wait...');
  final user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    try {
      // get all products of user
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('cart')
          .doc(user.uid)
          .collection('cartOrders')
          .get();
      List<QueryDocumentSnapshot> documents = querySnapshot.docs;
      for (var doc in documents) {
        Map<String, dynamic>? data = doc.data() as Map<String, dynamic>;
        String orderId = generateOrderId();
        // OrderModel orderModel = OrderModel.fromMap(data);
        OrderModel orderModel = OrderModel(
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
            createdAt: DateTime.now(),
            updatedAt: data['updatedAt'],
            productQuantity: data['productQuantity'],
            productTotalPrice:
                double.parse(data['productTotalPrice'].toString()),
            customerId: user.uid,
            status: false,
            customerName: customerName,
            customerPhone: customerPhone,
            customerAddress: customerAddress,
            customerDeviceToken: customerDeviceToken);
        for (var i = 0; i < documents.length; i++) {
          await FirebaseFirestore.instance
              .collection('orders')
              .doc(user.uid)
              .set({
            'uId': user.uid,
            'customerName': customerName,
            'customerPhone': customerPhone,
            'customeAddress': customerAddress,
            'customerDeviceToken': customerDeviceToken,
            'orderStatus': false,
            'createdAt': DateTime.now(),
          });
          // update orders
          await FirebaseFirestore.instance
              .collection('orders')
              .doc(user.uid)
              .collection('confirmOrders')
              .doc(orderId)
              .set(orderModel.toMap());
          // delete all products after confirm order
          await FirebaseFirestore.instance
              .collection('cart')
              .doc(user.uid)
              .collection('cartOrders')
              .doc(orderModel.productId)
              .delete()
              .then((value) =>
                  print('Delete cart Products ${orderModel.productId}'));
        }
      }
      print('Order confirm');
      Get.snackbar('Order Confirm', 'Thank you for your order',
          backgroundColor: AppConstant.appMainColor,
          colorText: Colors.white,
          duration: const Duration(
            seconds: 5,
          ));
      EasyLoading.dismiss();
      Get.offAll(() => MainScreen());
    } catch (e) {
      print(e.toString());
    }
  }
}

