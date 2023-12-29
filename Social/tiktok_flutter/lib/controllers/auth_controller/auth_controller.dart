import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_flutter/constraint.dart';
import 'package:tiktok_flutter/models/models.dart';

class AuthController extends GetxController {
  // khai báo đường dẫn
  static AuthController instance = Get.find();
  late Rx<File?> _pickedImage;
  // getter image
  File? get profilePhoto => _pickedImage.value;
  pickImage() async {
    // lấy hình ảnh từ gallery
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      Get.snackbar('Profile Picture',
          'You have successfully selected a profile picture');
    } else {
      Get.snackbar(
          'Error Select Picture', 'You selected erro a profile picture');
    }
    // lưu hình ảnh vào biến
    _pickedImage = Rx<File?>(File(pickedImage!.path));
  }

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
        // tạo thông tin user
        UserModel userModel = UserModel(
          name: username,
          email: email,
          profilePhoto: downloadUrl,
          uid: cred.user!.uid,
        );
        // lưu thông tin trên firestore
        await firebaseFirestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(userModel.toMap());
        Get.snackbar('Success', 'Create a new account successfully');

      } else {
        Get.snackbar('Error Creating Account', 'Please enter all fields');
      }
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

  void loginUser({required String email, required String password}) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
        Get.snackbar('Success', 'Login successfully');
            
      } else {
        Get.snackbar('Error Logging in', 'Please enter all fields');
      }
    } catch (e) {
      Get.snackbar('Error Login', e.toString());
    }
  }
}
