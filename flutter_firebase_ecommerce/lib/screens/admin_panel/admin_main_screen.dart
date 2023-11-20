import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_firebase_ecommerce/screens/auth_ui/welcome_screen.dart';
import 'package:get/get.dart';

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
