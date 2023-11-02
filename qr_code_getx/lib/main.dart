import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/modules/loading/loading_screen.dart';
import 'app/routes/app_pages.dart';
import 'firebase_options.dart';
import 'app/controllers/auth_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Get.put(AuthController(),permanent: true);
  runApp(
    const MyApp(),
  );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    return StreamBuilder(
      stream: auth.authStateChanges(),
      builder: (context, snapAuth) {
        if (snapAuth.connectionState == ConnectionState.waiting) {
          return const LoadingScreen();
        }
        return GetMaterialApp(
          title: "QR Code",
          // initialRoute: AppPages.INITIAL,
          initialRoute: snapAuth.hasData ? Routes.HOME : Routes.LOGIN,
          getPages: AppPages.routes,
        );
      },
    );
  }
}
