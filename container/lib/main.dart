import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Container"),
          backgroundColor: Colors.blueGrey[900],
        ),
        backgroundColor: Colors.blueGrey,
        body: SafeArea(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            // verticalDirection:  VerticalDirection.down,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('images/android.jpg'),
                radius: 50.0,
              ),
              const Text(
                'Android',
                style: TextStyle(
                  fontSize: 40.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Fuggles',
                ),
              ),
              Text(
                'FLUTTER DEVELOPER',
                style: TextStyle(
                    fontFamily: 'DancingScript',
                    color: Colors.teal[100],
                    fontSize: 20.0,
                    letterSpacing: 2.5),
              ),
              Container(
                color: Colors.white,
                margin: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 25.0),
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Icon(
                      Icons.phone,
                      color: Colors.teal.shade600,
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      '+44 132 456 789',
                      style: TextStyle(
                          color: Colors.teal.shade900,
                          fontFamily: 'DancingScript',
                          fontSize: 20.0),
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                margin: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 25.0),
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Icon(
                      Icons.email,
                      color: Colors.teal.shade600,
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'email@gmail.com',
                      style: TextStyle(
                          color: Colors.teal.shade900,
                          fontFamily: 'DancingScript',
                          fontSize: 20.0),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container testContainer(content, height, width, color) {
    return Container(
      height: height,
      width: width,
      color: color,
      child: Text(content),
    );
  }
}
