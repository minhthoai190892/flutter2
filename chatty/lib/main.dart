import 'package:chatty/app/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  Global.init();
  runApp(ScreenUtilInit(
    designSize: const Size(360, 780),
    builder: (context, child) => GetMaterialApp(
      debugShowCheckedModeBanner: false,

      title: "Application",
      theme: ThemeData(primarySwatch: Colors.blue),
      // initialRoute: AppPages.INITIAL,

      initialRoute: Routes.WELCOME,
      getPages: AppPages.routes,
    ),
  ));
}
