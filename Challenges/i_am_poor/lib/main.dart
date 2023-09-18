import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("I am poor"),
          backgroundColor: Colors.blueGrey[900],
        ),
          backgroundColor: Colors.blueGrey,
          body: const Center(
            child: Image(image: AssetImage('images/icons8-poor-48.png') ),
          ),
      ),
    ),
  );
}
