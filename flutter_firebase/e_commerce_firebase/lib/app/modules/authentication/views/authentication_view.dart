import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/authentication_controller.dart';

class AuthenticationView extends GetView<AuthenticationController> {
  const AuthenticationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AuthenticationView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AuthenticationView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
