import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              width: width,
              height: height / 2.5,
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0xFFff5c30),
                  Color(0xFFe74b1a),
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              ),
            )
          ],
        ),
      ),
    );
  }
}
