import 'dart:math';

import 'package:flutter/material.dart';

class DiceScreen extends StatefulWidget {
  const DiceScreen({super.key});

  @override
  State<DiceScreen> createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> {
  var rollDiceImage = 3;
  void rollDice() {
    var diceRollNumber = Random().nextInt(6) + 1;
    setState(() {
      rollDiceImage = diceRollNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dice Screen'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                width: 200,
                image: AssetImage('assets/images/dice-$rollDiceImage.png'),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                style: TextButton.styleFrom(
                    foregroundColor: Colors.red,
                    textStyle: const TextStyle(fontSize: 28)),
                onPressed: rollDice,
                child: const Text('Roll Dice'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
