import 'package:e_commerce_firebase/app/utils/theme/theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppThem.lightTheme,
      darkTheme: TAppThem.darkTheme,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
