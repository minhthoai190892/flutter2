import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce/controllers/get_user_data_controller.dart';
import 'package:flutter_firebase_ecommerce/screens/admin_panel/admin_main_screen.dart';
import 'package:flutter_firebase_ecommerce/screens/user_panel/main_screen.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../utils/app_constant.dart';
import 'welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      logged(context);
    });
  }

  Future<void> logged(BuildContext context) async {
    if (user != null) {
      final GetUserDataController getUserDataController =
          Get.put(GetUserDataController());
      var userData = await getUserDataController.getUserData(user!.uid);
      if (userData[0]['isAdmin'] == true) {
        Get.offAll(() => const AdminMainScrren());
      } else {
        Get.offAll(() => const MainScreen());
      }
    }else{
        Get.offAll(() =>  WelcomeScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: SizedBox(
              width: Get.width,
              child: Lottie.asset('assets/images/splash-icon.json'),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            width: Get.width,
            alignment: Alignment.center,
            child: Text(
              AppConstant.appPoweredBy,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
