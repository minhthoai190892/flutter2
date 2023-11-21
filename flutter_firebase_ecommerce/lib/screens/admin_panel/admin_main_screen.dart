import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../auth_ui/welcome_screen.dart';

class AdminMainScrren extends StatefulWidget {
  const AdminMainScrren({super.key});

  @override
  State<AdminMainScrren> createState() => _AdminMainScrrenState();
}

class _AdminMainScrrenState extends State<AdminMainScrren> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Panel'),
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth auth = FirebaseAuth.instance;
                auth.signOut();
                Get.offAll(() => WelcomeScreen());
              },
              icon: const Icon(Icons.logout))
        ],
      ),
    );
  }
}
