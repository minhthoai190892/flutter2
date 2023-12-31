import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tiktok_flutter/constraint.dart';

class UploadVideoController extends GetxController {
  uploadVideo(
      {required String songName,
      required String caption,
      required String videoPath}) async {
    try {
      // lấy uid người dùng hiện tại
      String uid = firebaseAuth.currentUser!.uid;
      // lấy thông tin người dùng từ firebase bằng uid
      DocumentSnapshot userDoc =
          await firebaseFirestore.collection('users').doc(uid).get();
    } catch (e) {
      print(e.toString());
    }
  }
}
