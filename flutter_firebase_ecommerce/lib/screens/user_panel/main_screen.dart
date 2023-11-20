// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_firebase_ecommerce/screens/auth_ui/welcome_screen.dart';
import 'package:flutter_firebase_ecommerce/utils/app_constant.dart';
import 'package:flutter_firebase_ecommerce/widgets/banner_widget.dart';
import 'package:flutter_firebase_ecommerce/widgets/custom_drawer_widget.dart';
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
        title: Text(
          AppConstant.appMainName,
          style: const TextStyle(color: AppConstant.appTextColor),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppConstant.appTextColor),
      ),
      drawer: const DrawerWidget(),
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: Get.height / 90,
                ),
                const Text('carousel'),
                const BannerWidget(),
              ],
            ),
          )),
    );
  }
}
