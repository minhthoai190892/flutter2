import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce/utils/app_constant.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

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
      body: Container(
        child: Column(
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
                    onPressed: () {},
                    icon: Image.asset('assets/images/google-icon.png'),
                    label: const Text(
                      'Login with google',
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
                    onPressed: () {},
                    icon: const Icon(
                      Icons.email,
                      color: AppConstant.appTextColor,
                    ),
                    label: const Text(
                      'Login with google',
                      style: TextStyle(color: AppConstant.appTextColor),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
