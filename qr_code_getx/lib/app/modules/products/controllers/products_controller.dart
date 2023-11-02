import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController {
  //TODO: Implement ProductsController
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final count = 0.obs;

  Stream<QuerySnapshot<Map<String, dynamic>>> streamProducts() async* {
    // chụp nhanh màng hình
    yield* firestore.collection('products').snapshots();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
