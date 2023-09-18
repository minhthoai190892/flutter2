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
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              testContainer('Text Container 1', 100.0, 100.0, Colors.blue),
              testContainer('Text Container 2', 100.0, 300.0, Colors.red),
              testContainer('Text Container 3', 100.0, 100.0, Colors.green),
              const SizedBox(
                height: 10.0,
              ),
              testContainer(
                  'Text Container 4', 100.0, double.infinity, Colors.yellow),
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
