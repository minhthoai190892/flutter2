// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce/screens/auth_ui/sign_screen.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'package:flutter_firebase_ecommerce/utils/app_constant.dart';

import '../../widgets/text_form_field_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) => Scaffold(
        appBar: AppBar(
          backgroundColor: AppConstant.appSecondoryColor,
          centerTitle: true,
          title: const Text(
            'Sign Up',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: AppConstant.appTextColor),
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: Get.height / 20,
                ),
                const Text(
                  'Welcome to app',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppConstant.appSecondoryColor),
                ),
                SizedBox(
                  height: Get.height / 30,
                ),
                // email
                const TextFormFieldWidget(
                    hitText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: Icons.email),
                // User name
                const TextFormFieldWidget(
                    hitText: 'User Name',
                    keyboardType: TextInputType.name,
                    prefixIcon: Icons.person),
                // phone
                const TextFormFieldWidget(
                    hitText: 'Phone',
                    keyboardType: TextInputType.number,
                    prefixIcon: Icons.phone),
                // City
                const TextFormFieldWidget(
                    hitText: 'City',
                    keyboardType: TextInputType.streetAddress,
                    prefixIcon: Icons.location_city),
                // passwod
                const TextFormFieldWidget(
                  hitText: 'Password',
                  keyboardType: TextInputType.visiblePassword,
                  prefixIcon: Icons.password,
                  suffixIcon: Icons.visibility_off,
                  obscureText: true,
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
                          'SIGN UP',
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
                      "Already have an account? ",
                      style: TextStyle(color: AppConstant.appSecondoryColor),
                    ),
                    GestureDetector(
                      onTap: () => Get.offAll(() => const SignInScreen()),
                      child: const Text(
                        "Sign In",
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
      ),
    );
  }
}
