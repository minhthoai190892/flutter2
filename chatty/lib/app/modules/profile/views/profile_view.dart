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
              width: size.width / 3.2.w,
              height: size.width / 3.2.w,
            ),
          ),
          Positioned(
            bottom: 20.w,
            right: 0.w,
            child: Container(
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
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                child: Column(
                  children: [
                    _buildProfilePhoto(size: size),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
