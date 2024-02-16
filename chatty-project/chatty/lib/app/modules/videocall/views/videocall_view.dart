import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/videocall_controller.dart';

class VideocallView extends GetView<VideocallController> {
  const VideocallView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VideocallView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'VideocallView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
