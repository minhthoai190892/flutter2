import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../controllers/google_sign_in_controller.dart';
import '../../utils/app_constant.dart';
import 'sign_in_screen.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});
  final GoogleSignInController _googleSignInController =
      Get.put(GoogleSignInController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstant.appMainColor,
        title: const Text(
          'Welcome to my app',
          style: TextStyle(color: AppConstant.appTextColor),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            child: Lottie.asset('assets/images/splash-icon.json'),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: const Text(
              'Happy shopping ',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: Get.height / 12,
          ),
          Material(
            child: Container(
              width: Get.width / 1.2,
              height: Get.height / 12,
              decoration: BoxDecoration(
                  color: AppConstant.appMainColor,
                  borderRadius: BorderRadius.circular(20)),
              child: TextButton.icon(
                  onPressed: () {
                    _googleSignInController.signInWithGoogle();
                  },
                  icon: Image.asset('assets/images/google-icon.png'),
                  label: const Text(
                    'Sig in with google',
                    style: TextStyle(color: AppConstant.appTextColor),
                  )),
            ),
          ),
          SizedBox(
            height: Get.height / 50,
          ),
          Material(
            child: Container(
              width: Get.width / 1.2,
              height: Get.height / 12,
              decoration: BoxDecoration(
                  color: AppConstant.appMainColor,
                  borderRadius: BorderRadius.circular(20)),
              child: TextButton.icon(
                  onPressed: () {
                    Get.to(() => const SignInScreen());
                  },
                  icon: const Icon(
                    Icons.email,
                    color: AppConstant.appTextColor,
                    size: 40,
                  ),
                  label: const Text(
                    'Sign in with email',
                    style: TextStyle(color: AppConstant.appTextColor),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
