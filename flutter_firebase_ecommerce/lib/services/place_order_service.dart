import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce/services/generate_order_id_service.dart';

void placeOrder(
    {required BuildContext context,
    required String customerName,
    required String customerPhone,
    required String customerAddres,
    required customerDeviceToken}) async {
  final User? user = FirebaseAuth.instance.currentUser;
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
        Map<String, dynamic>? data = doc.data as Map<String, dynamic>;
        String orderId = generateOrderId();
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
