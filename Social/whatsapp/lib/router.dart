import 'package:flutter/material.dart';
import 'package:whatsapp/commons/widgets/error_screen_widget.dart';
import 'package:whatsapp/features/auths/screens/login_screen.dart';
import 'package:whatsapp/features/auths/screens/otp_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      );
    case OTPScreen.routeName:
    // lay gia tri arguments duoc truyen di
    final verificationId = settings.arguments as String;
      return MaterialPageRoute(
        builder: (context) =>  OTPScreen(verificationId: verificationId),
      );

    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: ErrorScreenWidget(error: "This page doesn't exist"),
        ),
      );
  }
}
