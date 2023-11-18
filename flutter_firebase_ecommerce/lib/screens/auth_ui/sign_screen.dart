// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce/screens/auth_ui/sign_up_screen.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'package:flutter_firebase_ecommerce/utils/app_constant.dart';

import '../../widgets/text_form_field_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) => Scaffold(
        appBar: AppBar(
          backgroundColor: AppConstant.appSecondoryColor,
          centerTitle: true,
          title: const Text(
            'Sign in',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: AppConstant.appTextColor),
          ),
        ),
        body: Container(
          child: Column(
            children: [
              isKeyboardVisible
                  ? const Text(
                      'Welcome to app',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
              const TextFormFieldWidget(
                  hitText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icons.email),
              // passwod
              const TextFormFieldWidget(
                hitText: 'Password',
                keyboardType: TextInputType.visiblePassword,
                prefixIcon: Icons.password,
                suffixIcon: Icons.visibility_off,
                obscureText: true,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                alignment: Alignment.centerRight,
                child: const Text(
                  'Forget Password?',
                  style: TextStyle(
                      color: AppConstant.appSecondoryColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
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
                      onPressed: () {},
                      child: const Text(
                        'SIGN IN',
                        style: TextStyle(color: AppConstant.appTextColor),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: Get.height / 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(color: AppConstant.appSecondoryColor),
                  ),
                  GestureDetector(
                    onTap: () => Get.offAll(() => const SignUpScreen()),
                    child: const Text(
                      "Sign up",
                      style: TextStyle(
                          color: AppConstant.appSecondoryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
