// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce/controllers/get_user_data_controller.dart';
import 'package:flutter_firebase_ecommerce/controllers/sign_in_controller.dart';
import 'package:flutter_firebase_ecommerce/screens/admin_panel/admin_main_screen.dart';
import 'package:flutter_firebase_ecommerce/screens/auth_ui/forget_password_screen.dart';
import 'package:flutter_firebase_ecommerce/screens/auth_ui/sign_up_screen.dart';
import 'package:flutter_firebase_ecommerce/screens/user_panel/main_screen.dart';
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
  SignInController signInController = Get.put(SignInController());
  GetUserDataController getUserDataController =
      Get.put(GetUserDataController());
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPassword = TextEditingController();
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
            // passwod
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Obx(() => TextFormField(
                      controller: userPassword,
                      cursorColor: AppConstant.appSecondoryColor,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: signInController.isPasswordVisible.value,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          contentPadding:
                              const EdgeInsets.only(top: 2, left: 8),
                          prefixIcon: const Icon(Icons.password),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              signInController.isPasswordVisible.toggle();
                            },
                            child: signInController.isPasswordVisible.value
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    )),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () => Get.to(() => const ForgetPasswordScreen()),
                child: const Text(
                  'Forget Password?',
                  style: TextStyle(
                      color: AppConstant.appSecondoryColor,
                      fontWeight: FontWeight.bold),
                ),
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
                    onPressed: () async {
                      String email = userEmail.text.trim();
                      String password = userPassword.text.trim();
                      if (email.isEmpty || password.isEmpty) {
                        Get.snackbar('Error', 'Please enter all details');
                      } else {
                        UserCredential? userCredential = await signInController
                            .signInMethod(email, password);
                        var userData = await getUserDataController
                            .getUserData(userCredential!.user!.uid);
                        if (userCredential != null) {
                          if (userCredential.user!.emailVerified) {
                            if (userData[0]['isAdmin'] == true) {
                              Get.snackbar(
                                  'Success Admin Login', 'Login successfully',
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: AppConstant.appMainColor,
                                  colorText: AppConstant.appTextColor);
                              Get.offAll(() => const AdminMainScrren());
                            } else {
                               Get.snackbar(
                                  'Success User Login', 'Login successfully',
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: AppConstant.appMainColor,
                                  colorText: AppConstant.appTextColor);
                              Get.offAll(() => const MainScreen());
                            }
                          } else {
                            Get.snackbar('Error',
                                'Please verify your email before logging',
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: AppConstant.appMainColor,
                                colorText: AppConstant.appTextColor);
                          }
                        } else {
                          Get.snackbar('Error', 'Please try again',
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: AppConstant.appMainColor,
                              colorText: AppConstant.appTextColor);
                        }
                      }
                    },
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
    );
  }
}
