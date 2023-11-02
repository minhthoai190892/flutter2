import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AddProductController extends GetxController {
  //TODO: Implement AddProductController

  final count = 0.obs;

  void increment() => count.value++;

  RxBool isLoading = false.obs;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<Map<String, dynamic>> addProduct(Map<String, dynamic> data) async {
    try {
      // nhập vào firebase để thêm trường id vào
      var hasil = await firestore.collection('products').add(data);
      //update firestore
      firestore
          .collection('products')
          .doc(hasil.id)
          .update({'productId': hasil.id});
      return {'error': false, 'message': 'add product successful'};
    } catch (e) {
      return {'error': true, 'message': 'add product  failed'};
    }
  }
}
