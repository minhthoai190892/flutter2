import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_firebase_ecommerce/models/user_model.dart';
import 'package:flutter_firebase_ecommerce/utils/app_constant.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // for  password visibility
  var isPasswordVisible = true.obs;
  Future<UserCredential?> signUpMethod(
    String userName,
    String userEmail,
    String userPhone,
    String userCity,
    String userPassword,
    String userDeviceToken,
  ) async {
    try {
      EasyLoading.show(status: 'Please wait...');
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: userEmail, password: userPassword);
      // Send email verification
      await userCredential.user!.sendEmailVerification();
      UserModel userModel = UserModel(
          uId: userCredential.user!.uid,
          userName: userName,
          email: userEmail,
          phone: userPhone,
          userImg: '',
          userDeviceToken: userDeviceToken,
          country: '',
          userAddress: '',
          street: '',
          isAdmin: false,
          isActive: true,
          city: userCity,
          createOn: DateTime.now());
      // add data into database
      _firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .set(userModel.toMap());
      EasyLoading.dismiss();
      return userCredential;
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();

      Get.snackbar('Error', '$e',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppConstant.appMainColor,
          colorText: AppConstant.appTextColor);
    }
  }
}
