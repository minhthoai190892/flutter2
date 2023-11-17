import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_firebase_ecommerce/screens/auth_ui/welcome_screen.dart';
import 'package:flutter_firebase_ecommerce/utils/app_constant.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: AppConstant.appSecondoryColor,
            statusBarIconBrightness: Brightness.light),
        backgroundColor: AppConstant.appMainColor,
        title: Text(AppConstant.appMainName),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              GoogleSignIn googleSignIn = GoogleSignIn();
              googleSignIn.signOut();
              Get.offAll(() => WelcomeScreen());
            },
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Icon(Icons.logout),
            ),
          )
        ],
      ),
      body: const Center(
        child: Text('data'),
      ),
    );
  }
}
