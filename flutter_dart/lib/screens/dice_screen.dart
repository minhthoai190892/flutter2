import 'package:flutter/material.dart';

class DiceScreen extends StatefulWidget {
  const DiceScreen({super.key});

  @override
  State<DiceScreen> createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dice Screen'),
      ),
      body: const SafeArea(
        child: Center(
          child: Image(
            width: 200,
            image: AssetImage('assets/images/dice-1.png'),
          ),
        ),
      ),
    );
  }
}
