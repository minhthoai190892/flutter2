import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:tiktok_flutter/constraint.dart';

class AuthController extends GetxController {
  // registering the user
  void registerUser(
      {required String username,
      required String email,
      required String password,
      required File? image}) async {
    try {
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
        // save out user to our ath firebase firestore
        UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
        // call upload image method
       String downloadUrl = await _uploadToStorage(image);
       
      } else {}
    } catch (e) {
      Get.snackbar('Error Creating Account', e.toString());
    }
  }

  Future<String> _uploadToStorage(File image) async {
    // create storage
    // -.child('profilePics') kho lưu trữ hình ảnh
    // - .child(firebaseAuth.currentUser!.uid); kho lưu trữ của người đang đăng nhập
    Reference ref = firebaseStorage
        .ref()
        .child('profilePics')
        .child(firebaseAuth.currentUser!.uid);
    // tải hình ảnh lên
    UploadTask uploadTask = ref.putFile(image);
    // chụp nhanh hình ảnh
    TaskSnapshot snap = await uploadTask;
    // tải hình ảnh xuống
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }
}
