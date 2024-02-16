import 'package:chatty/app/common/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'app/global.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  Global.init();

  runApp(
    ScreenUtilInit(
      designSize: const Size(360, 780),
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,

        title: "Application",
        theme: AppTheme.light,
        // initialRoute: AppPages.INITIAL,

        initialRoute: Routes.PROFILE,
        getPages: AppPages.routes,
      ),
    ),
  );
}
