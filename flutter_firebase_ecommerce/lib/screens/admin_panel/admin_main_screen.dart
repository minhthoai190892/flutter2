import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
      ),
    );
  }
}
