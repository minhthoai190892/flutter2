import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Lottie.asset('assets/images/on_boarding_images/delivery.json'),
          const Center(
            child: Text(
              'HomeView is workingasdwqeqweasdasd',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
