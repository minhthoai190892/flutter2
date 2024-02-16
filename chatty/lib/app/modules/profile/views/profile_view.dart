// ignore_for_file: avoid_print

import 'package:chatty/app/common/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  Widget _buildProfilePhoto({required Size size}) => Stack(
        children: [
          Container(
            width: size.width / 3.2.w,
            height: size.width / 3.2.w,
            decoration: BoxDecoration(
              color: AppColor.primarySecondaryBackground,
              borderRadius: BorderRadius.all(
                Radius.circular(60.w),
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 2,
                  spreadRadius: 1,
                  color: Colors.grey.withOpacity(0.1),
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Image.asset(
              'assets/images/account_header.png',
              fit: BoxFit.cover,
              width: size.width / 3.2.w,
              height: size.width / 3.2.w,
            ),
          ),
          Positioned(
            bottom: 0.w,
            right: 0.w,
            child: Container(
              padding: EdgeInsets.all(7.w),
              width: size.width / 11.w,
              height: size.width / 11.w,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(
                  Radius.circular(size.width / 9.w),
                ),
              ),
              child: Image.asset('assets/icons/edit.png'),
            ),
          ),
        ],
      );
  Widget _buildCompleteBtn({required Size size}) => GestureDetector(
        onTap: () {
          print('Complete button');
        },
        child: Container(
          width: size.width.w,
          height: 44.h,
          margin: EdgeInsets.only(
              top: size.height / 14.h, bottom: size.height / 28.h),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 2,
                spreadRadius: 1,
                color: Colors.grey.withOpacity(0.1),
                offset: const Offset(0, 1),
              ),
            ],
            color: AppColor.primaryElement,
            borderRadius: BorderRadius.all(
              Radius.circular(4.h),
            ),
          ),
          child: Center(
            child: Text(
              'Complete',
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal,
                  color: AppColor.primaryElementText),
            ),
          ),
        ),
      );
  Widget _buildLogoutBtn({required Size size}) => GestureDetector(
        onTap: () {
          print('Logout button');
          Get.defaultDialog(
            // backgroundColor: Colors.white,
            title: 'Are you sure to logout',
            onConfirm: () {
              controller.goLogout();
            },
            onCancel: () {},
            textConfirm: 'Confirm',
            textCancel: 'Cancel',
          );
        },
        child: Container(
          width: size.width.w,
          height: 44.h,
          margin: EdgeInsets.only(top: 0.h, bottom: size.height / 28.h),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 2,
                spreadRadius: 1,
                color: Colors.grey.withOpacity(0.1),
                offset: const Offset(0, 1),
              ),
            ],
            color: AppColor.primarySecondElementText,
            borderRadius: BorderRadius.all(
              Radius.circular(4.h),
            ),
          ),
          child: Center(
            child: Text(
              'Logout',
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal,
                  color: AppColor.primaryElementText),
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print(size);
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfileView'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  child: Column(
                    children: [
                      _buildProfilePhoto(size: size),
                      _buildCompleteBtn(size: size),
                      _buildLogoutBtn(size: size),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
