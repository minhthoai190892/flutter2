import 'package:chatty/app/common/style/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/sign_in_controller.dart';

class SignInView extends GetView<SignInController> {
  const SignInView({Key? key}) : super(key: key);

  /// Logo
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

  /// login type
  Widget _buildThirdPartyLogin(
      {required String loginType,
      required String iconType,
      required BuildContext context}) {
    print(MediaQuery.of(context).size);
    return GestureDetector(
      onTap: () {
        print('loginType $loginType');
        controller.handleSignIn(type: loginType);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.06,
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
          mainAxisAlignment: iconType == ''
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          children: [
            iconType == ''
                ? Container()
                : Container(
                    padding: EdgeInsets.only(left: 40.w, right: 30.w),
                    child: Image.asset('assets/icons/$iconType.png'),
                  ),
            Text(
              'Sign in with $loginType',
              style: TextStyle(
                color: AppColor.primaryText,
                fontWeight: FontWeight.normal,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primarySecondaryBackground,
      // appBar: AppBar(
      //   title: const Text('SignInView'),
      //   centerTitle: true,
      // ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: [
              _buildLogo(),
              _buildThirdPartyLogin(
                loginType: 'Google',
                iconType: 'google',
                context: context,
              ),
              _buildThirdPartyLogin(
                loginType: 'Facebook',
                iconType: 'facebook',
                context: context,
              ),
              _buildThirdPartyLogin(
                loginType: 'Apple',
                iconType: 'apple',
                context: context,
              ),
              buildOrWidget(),
              _buildThirdPartyLogin(
                loginType: 'Phone number',
                iconType: '',
                context: context,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              buildSignupWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Column buildSignupWidget() {
    return Column(
      children: [
        Text(
          'Already have an account',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColor.primaryText,
            fontWeight: FontWeight.normal,
            fontSize: 12.sp,
          ),
        ),
        GestureDetector(
          onTap: () {
            print('object');
          },
          child: Text(
            'Sign up here',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColor.primaryElement,
              fontWeight: FontWeight.normal,
              fontSize: 12.sp,
            ),
          ),
        ),
      ],
    );
  }

  Container buildOrWidget() {
    return Container(
      margin: EdgeInsets.only(top: 20.h, bottom: 35.h),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              height: 2.h,
              // indent: 50,
              color: AppColor.primarySecondElementText,
            ),
          ),
          const Text(' or '),
          Expanded(
            child: Divider(
              height: 2.h,
              // endIndent: 50,
              color: AppColor.primarySecondElementText,
            ),
          ),
        ],
      ),
    );
  }
}
