import 'package:chatty/app/common/style/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({Key? key}) : super(key: key);
  Widget _buildPageHeaderTitle({required String title}) {
    return Container(
      // margin: EdgeInsets.only(top: 350),
      child: Text(
        title,
        style: TextStyle(
          color: AppColor.primaryElementText,
          fontWeight: FontWeight.bold,
          fontFamily: 'Montserrat',
          fontSize: 45.sp,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryElement,
      // appBar: AppBar(
      //   title: const Text('WelcomeView'),
      //   centerTitle: true,
      // ),
      body: SizedBox(
        width: 300.w,
        height: 780.h,
        child: Center(
          child: _buildPageHeaderTitle(title: controller.title),
        ),
      ),
    );
  }
}
