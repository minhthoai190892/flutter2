// ignore_for_file: avoid_print, unnecessary_overrides

import 'package:chatty/app/modules/sign_in/index/index.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInController extends GetxController {
  //TODO: Implement SignInController
  SignInController();
  final state = SignInState();
  final count = 0.obs;
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['openId']);
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

  /// @param type loại đăng nhập
  /// 1. google
  /// 2. facebook
  /// 3. apple
  /// 4. phone number
  void handleSignIn({required String type}) async {
    try {
      if (type == 'phone number') {
        print('.... you are logging in with phone number....');
      } else if (type == 'google') {
        print('.... you are logging in with google....');
        var user = await _googleSignIn.signIn();
        if (user != null) {
          String? displayName = user.displayName;
          String email = user.email;
          String id = user.id;
          String photoUrl = user.photoUrl ?? 'assets/icons/google.png';
        }
      } else if (type == 'facebook') {
        print('.... you are logging in with facebook....');
      } else if (type == 'apple') {
        print('.... you are logging in with apple....');
      } else {}
    } catch (e) {
      print('.... error: $e');
    }
  }
}
