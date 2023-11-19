// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce/controllers/forget_password_controller.dart';
import 'package:flutter_firebase_ecommerce/utils/app_constant.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../widgets/text_form_field_widget.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  ForgetPasswordController forgetPasswordController =
      Get.put(ForgetPasswordController());
  TextEditingController userEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) => Scaffold(
        appBar: AppBar(
          backgroundColor: AppConstant.appSecondoryColor,
          centerTitle: true,
          title: const Text(
            'Forget Password',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: AppConstant.appTextColor),
          ),
        ),
        body: Column(
          children: [
            isKeyboardVisible
                ? const Text(
                    'Welcome to app',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                : Column(
                    children: [
                      Lottie.asset('assets/images/splash-icon.json'),
                    ],
                  ),
            SizedBox(
              height: Get.height / 30,
            ),
            // email
            TextFormFieldWidget(
                controller: userEmail,
                hitText: 'Email',
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Icons.email),

            SizedBox(
              height: Get.height / 20,
            ),
            Material(
              child: Container(
                width: Get.width / 2,
                height: Get.height / 18,
                decoration: BoxDecoration(
                    color: AppConstant.appMainColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: TextButton(
                    onPressed: () async {
                      String email = userEmail.text.trim();

                      if (email.isEmpty) {
                        Get.snackbar('Error', 'Please enter all details',
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: AppConstant.appMainColor,
                            colorText: AppConstant.appTextColor);
                      } else {
                        String email = userEmail.text.trim();
                        forgetPasswordController
                            .forgetpasswordMethod(email);
                      }
                    },
                    child: const Text(
                      'Forget Password',
                      style: TextStyle(color: AppConstant.appTextColor),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
