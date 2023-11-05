import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/common/widgets/app_bar.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/global.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(text: 'Home'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: text24Normal(
                    text: 'Hello,',
                    color: AppColors.primaryThreeElementText,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                child: text24Normal(
                    text: Global.storageService.getString(AppConstants.STORAGE_USER_PROFILE_KEY), fontWeight: FontWeight.bold),
              ),
               Container(
                child: text24Normal(
                    text: Global.storageService.getString(AppConstants.STORAGE_USER_TOKEN_KEY), fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
