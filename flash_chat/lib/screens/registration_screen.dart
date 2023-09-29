// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flash_chat/components/input_field.dart';
import 'package:flash_chat/components/rounded_button.dart';

import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});
  static const String id = 'registration-screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: SizedBox(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            const SizedBox(
              height: 48.0,
            ),
            InputField(
              title: 'Enter email',
              onChanged: (value) {},
            ),
            const SizedBox(
              height: 8.0,
            ),
            InputField(
              title: 'Enter your password',
              onChanged: (value) {},
            ),
            const SizedBox(
              height: 24.0,
            ),
            RoundedButton(
                title: 'Register', onPressed: () {}, color: Colors.blueAccent)
          ],
        ),
      ),
    );
  }
}
