import 'package:fb_auth_bloc/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'pages/home_page.dart';
import 'pages/signin_page.dart';
import 'pages/signup_page.dart';
import 'pages/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Auth',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SignupPage(),
      routes: {
        SignupPage.routeName: (context) => const SignupPage(),
        SigninPage.routeName: (context) => const SigninPage(),
        HomePage.routeName: (context) => const HomePage(),
      },
    );
  }
}
