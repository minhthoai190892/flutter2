// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:audioplayers/audioplayers.dart';

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
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: "Xylophone"),
    );
  }
}

// ignore: must_be_immutable
class MyHomePage extends StatelessWidget {
  String title;
  MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: Text(title, style: const TextStyle(color: Colors.white)),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: ElevatedButtonPlayer(number: 1, color: Colors.red)),
            Expanded(
                child: ElevatedButtonPlayer(number: 2, color: Colors.yellow)),
            Expanded(
                child: ElevatedButtonPlayer(number: 3, color: Colors.blue)),
            Expanded(
                child: ElevatedButtonPlayer(number: 4, color: Colors.orange)),
            Expanded(
                child: ElevatedButtonPlayer(number: 5, color: Colors.teal)),
            Expanded(
                child: ElevatedButtonPlayer(number: 6, color: Colors.pink)),
            Expanded(
                child: ElevatedButtonPlayer(number: 7, color: Colors.purple)),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ElevatedButtonPlayer extends StatelessWidget {
  int number;
  Color color;
  ElevatedButtonPlayer({
    Key? key,
    required this.number,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        final player = AudioPlayer();
        await player.play(AssetSource('note$number.wav'));
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
      ),
      child: Text(
        'note $number',
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
