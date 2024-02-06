import 'package:chatty/app/common/style/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/sign_in_controller.dart';

class SignInView extends GetView<SignInController> {
  const SignInView({Key? key}) : super(key: key);
  Widget _buildLogo() => Container(
        margin: EdgeInsets.only(top: 100.h, bottom: 80.h),
        child: Text(
          'Chatty .',
          style: TextStyle(
              color: AppColor.primaryText,
              fontWeight: FontWeight.bold,
              fontSize: 34.sp),
        ),
      );
  Widget _buildThirdPartyGoogleLogin({required String loginType}) => Container(
        width: 295.w,
        height: 44.h,
        margin: EdgeInsets.only(bottom: 15.h),
        padding: EdgeInsetsDirectional.all(10.h),
        decoration: BoxDecoration(
          color: AppColor.primaryBackground,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(
                0,
                1,
              ),
            ),
          ],
          borderRadius: const BorderRadius.all(
            Radius.circular(
              5,
            ),
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.only(left: 40.w, right: 30.w),
              child: Image.asset('assets/icons/google.png'),
            ),
            Container(
              child: Text(
                loginType,
                style: TextStyle(
                  color: AppColor.primaryText,
                  fontWeight: FontWeight.normal,
                  fontSize: 14.sp,
                ),
              ),
            ),
          ],
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primarySecondaryBackground,
      appBar: AppBar(
        title: const Text('SignInView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            _buildLogo(),
            _buildThirdPartyGoogleLogin(loginType: 'Sign in with Google'),
            _buildThirdPartyGoogleLogin(loginType: 'Google Login'),
            _buildThirdPartyGoogleLogin(loginType: 'Google Login'),
          ],
        ),
      ),
    );
  }
}
