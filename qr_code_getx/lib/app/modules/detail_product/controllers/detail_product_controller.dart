import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DetailProductController extends GetxController {
  //TODO: Implement DetailProductController

  final count = 0.obs;
  RxBool isLoadingUpdate = false.obs;
  RxBool isLoadingDelete = false.obs;

  void increment() => count.value++;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<Map<String, dynamic>> editProduct(Map<String, dynamic> data) async {
    try {
      //update firestore
      await firestore.collection('products').doc(data['id']).update({
        'name': data['name'],
        'qty': data['qty'],
      });
      return {'error': false, 'message': 'update product successful'};
    } catch (e) {
      return {'error': true, 'message': 'update product  failed'};
    }
  }

  Future<Map<String, dynamic>> deleteProduct(String id) async {
    try {
      //update firestore
      await firestore.collection('products').doc(id).delete();
      return {'error': false, 'message': 'delete product successful'};
    } catch (e) {
      return {'error': true, 'message': 'delete product  failed'};
    }
  }
}
