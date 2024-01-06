// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class OTPScreen extends StatelessWidget {
  static const String routeName = "/otp-screen";
  final String verificationId;
  const OTPScreen({
    Key? key,
    required this.verificationId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("verificationId$verificationId");
    return const Placeholder();
  }
}
