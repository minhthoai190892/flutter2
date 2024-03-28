import 'package:e_commerce_firebase/app/utils/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: TAppThem.lightTheme,
      darkTheme: TAppThem.darkTheme,
      title: "Application",
      initialRoute: Routes.ONBOARDING,
      getPages: AppPages.routes,
    ),
  );
}
