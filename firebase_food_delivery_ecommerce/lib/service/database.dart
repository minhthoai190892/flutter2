import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethod {
  Future addUserDetail(Map<String, dynamic> userInforMap) async {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userInforMap['id'])
        .set(userInforMap);
  }

  updateUserWallet(String id, String amount) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .update({'wallet':amount});
  }
}
