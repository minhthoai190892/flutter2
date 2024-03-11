import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/personalization_controller.dart';

class PersonalizationView extends GetView<PersonalizationController> {
  const PersonalizationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PersonalizationView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PersonalizationView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
