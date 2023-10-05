import 'package:flutter/material.dart';

class Expenese extends StatefulWidget {
  const Expenese({super.key});

  @override
  State<Expenese> createState() => _ExpeneseState();
}

class _ExpeneseState extends State<Expenese> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('data'),
          ],
        ),
      ),
    );
  }
}
