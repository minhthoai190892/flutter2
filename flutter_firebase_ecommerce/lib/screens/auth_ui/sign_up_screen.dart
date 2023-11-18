// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce/controllers/sign_up_controller.dart';
import 'package:flutter_firebase_ecommerce/screens/auth_ui/sign_in_screen.dart';
import 'package:flutter_firebase_ecommerce/utils/app_constant.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';

import '../../widgets/text_form_field_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final SignUpController signUpController = Get.put(SignUpController());
  TextEditingController userName = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPhone = TextEditingController();
  TextEditingController userCity = TextEditingController();
  TextEditingController userPassword = TextEditingController();
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
              TextFormFieldWidget(
                  controller: userEmail,
                  hitText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icons.email),
              // User name
              TextFormFieldWidget(
                  controller: userName,
                  hitText: 'User Name',
                  keyboardType: TextInputType.name,
                  prefixIcon: Icons.person),
              // phone
              TextFormFieldWidget(
                  controller: userPhone,
                  hitText: 'Phone',
                  keyboardType: TextInputType.number,
                  prefixIcon: Icons.phone),
              // City
              TextFormFieldWidget(
                  controller: userCity,
                  hitText: 'City',
                  keyboardType: TextInputType.streetAddress,
                  prefixIcon: Icons.location_city),
              // passwod
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Obx(() => TextFormField(
                        controller: userPassword,
                        cursorColor: AppConstant.appSecondoryColor,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: signUpController.isPasswordVisible.value,
                        decoration: InputDecoration(
                            hintText: 'Password',
                            contentPadding:
                                const EdgeInsets.only(top: 2, left: 8),
                            prefixIcon: const Icon(Icons.password),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                signUpController.isPasswordVisible.toggle();
                              },
                              child: signUpController.isPasswordVisible.value
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      )),
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
                        String name = userName.text.trim();
                        String email = userEmail.text.trim();
                        String phone = userPhone.text.trim();
                        String city = userCity.text.trim();
                        String password = userPassword.text.trim();
                        String userDeviceToken = '';
                        if (name.isEmpty ||
                            email.isEmpty ||
                            password.isEmpty ||
                            phone.isEmpty ||
                            city.isEmpty) {
                          Get.snackbar('Error', 'Please enter all details',
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: AppConstant.appMainColor,
                              colorText: AppConstant.appTextColor);
                        } else {
                          UserCredential? userCredential =
                              await signUpController.signUpMethod(name, email,
                                  phone, city, password, userDeviceToken);
                          if (userCredential != null) {
                            Get.snackbar('Verification email sent.',
                                'Please check your email',
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: AppConstant.appMainColor,
                                colorText: AppConstant.appTextColor);
                            FirebaseAuth.instance.signOut();
                            Get.offAll(() => const SignInScreen());
                          }
                        }
                      },
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
    );
  }
}
