// ignore_for_file: avoid_print

import 'package:chatty/app/common/style/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/message_controller.dart';

class MessageView extends GetView<MessageController> {
  const MessageView({Key? key}) : super(key: key);
  Widget _headBar({required Size size}) => Center(
        child: Container(
          width: size.width.w,
          height: size.width / 8.7.h,
          margin: EdgeInsets.only(bottom: 20.h, top: 20.h),
          child: Row(
            children: [
              Stack(
                children: [
                  GestureDetector(
                    child: Container(
                      width: size.width / 8.7.h,
                      height: size.width / 8.7.h,
                      decoration: BoxDecoration(
                        color: AppColor.primarySecondaryBackground,
                        borderRadius: BorderRadius.all(
                          Radius.circular(22.h),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: controller.stata.head_detail.value.avatar == null
                          ? Image.asset('assets/images/account_header.png')
                          : Image.asset('assets/images/actionbar_search.png'),
                    ),
                  ),
                  Positioned(
                    bottom: 4.w,
                    right: 0.w,
                    height: 14.w,
                    child: Container(
                      width: 14.w,
                      height: 14.h,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2.w,
                          color: AppColor.primaryElement,
                        ),
                        color: AppColor.primaryElementStatus,
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.w),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      );
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print(size);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  title: _headBar(size: size),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
