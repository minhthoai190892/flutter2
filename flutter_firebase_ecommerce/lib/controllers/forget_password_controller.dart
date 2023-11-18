// ignore_for_file: unused_field, body_might_complete_normally_nullable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_firebase_ecommerce/screens/auth_ui/sign_in_screen.dart';
import 'package:get/get.dart';

import '../utils/app_constant.dart';

class ForgetPasswordController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // for  password visibility
  var isPasswordVisible = true.obs;
  Future<void> forgetpasswordMethod(String userEmail) async {
    try {
      EasyLoading.show(status: 'Please wait...');
      await _auth.sendPasswordResetEmail(email: userEmail);
      Get.snackbar(
          'Request Sent Successfully', 'Password reset sent to $userEmail',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppConstant.appMainColor,
          colorText: AppConstant.appTextColor);
      Get.offAll(() => const SignInScreen());
      EasyLoading.dismiss();
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();

      Get.snackbar('Error', '$e',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppConstant.appMainColor,
          colorText: AppConstant.appTextColor);
    }
  }
}
