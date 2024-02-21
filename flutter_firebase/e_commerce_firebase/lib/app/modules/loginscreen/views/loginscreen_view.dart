import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/loginscreen_controller.dart';

class LoginscreenView extends GetView<LoginscreenController> {
  const LoginscreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginscreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'LoginscreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
