// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFF0A0E21),
          primaryColor: Colors.red,
          textTheme: const TextTheme(bodyLarge: TextStyle(color: Colors.red))),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'BMI Calculator',
          ),
          // backgroundColor: const Color(0xFF0A0E21),
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: CardContainer(),
                  ),
                  Expanded(
                    child: CardContainer(),
                  ),
                ],
              ),
            ),
            Expanded(
              child: CardContainer(),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: CardContainer(
                      icon: Icon(Icons.access_time_rounded),
                    ),
                  ),
                  Expanded(
                    child: CardContainer(),
                  ),
                ],
              ),
            ),
          ],
        ),
        // backgroundColor: Colors.blueGrey,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class CardContainer extends StatelessWidget {
  Icon? icon;
  CardContainer({
    Key? key,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 170.0,
      // height: 200.0,
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: const Color(0xFF1D1E33),
      ),
      child:  Center(
        child: icon
      ),
    );
  }
}
