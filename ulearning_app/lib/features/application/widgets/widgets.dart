import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';
import 'package:ulearning_app/features/home/view/home.dart';

var bottomTabs = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    label: 'Home',
    icon: bottomContainer(imagePath: ImageRes.home),
    activeIcon: bottomContainer(color: AppColors.primaryElement),
    backgroundColor: AppColors.primaryBackground,
  ),
  BottomNavigationBarItem(
    label: 'Search',
    icon: bottomContainer(imagePath: ImageRes.search),
    activeIcon: bottomContainer(
        color: AppColors.primaryElement, imagePath: ImageRes.search),
    backgroundColor: AppColors.primaryBackground,
  ),
  BottomNavigationBarItem(
    label: 'Play',
    icon: bottomContainer(imagePath: ImageRes.play),
    activeIcon: bottomContainer(
        color: AppColors.primaryElement, imagePath: ImageRes.play),
    backgroundColor: AppColors.primaryBackground,
  ),
  BottomNavigationBarItem(
    label: 'Message',
    icon: bottomContainer(imagePath: ImageRes.message),
    activeIcon: bottomContainer(
        color: AppColors.primaryElement, imagePath: ImageRes.message),
    backgroundColor: AppColors.primaryBackground,
  ),
  BottomNavigationBarItem(
    label: 'Profile',
    icon: bottomContainer(imagePath: ImageRes.profile),
    activeIcon: bottomContainer(
        color: AppColors.primaryElement, imagePath: ImageRes.profile),
    backgroundColor: AppColors.primaryBackground,
  ),
];

SizedBox bottomContainer({
  String imagePath = 'assets/icons/home.png',
  double width = 15,
  double height = 15,
  Color color = AppColors.primaryFourElementText,
}) {
  return SizedBox(
    width: 15.w,
    height: 15.w,
    child: appImageWithColor(imagePath: imagePath, color: color),
  );
}

Widget appScreens(int index) {
  List<Widget> screens = [
    const Home(),
    Center(
      child: appImage(imagePath: ImageRes.search),
    ),
    Center(
      child: appImage(imagePath: ImageRes.play),
    ),
    Center(
      child: appImage(imagePath: ImageRes.message),
    ),
    Center(
      child: appImage(imagePath: ImageRes.profile),
    ),
  ];
  return screens[index];
}
