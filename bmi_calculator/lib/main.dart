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

const bottomContainerHeight = 80.0;
const activeColor = Color(0xFF1D1E33);
const bottomContainerColor = Color(0xFFEB1555);

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
            const Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: CardContainer(
                      color: activeColor,
                    ),
                  ),
                  Expanded(
                    child: CardContainer(
                      color: activeColor,
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(
              child: CardContainer(
                color: activeColor,
              ),
            ),
            const Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: CardContainer(
                      icon: Icon(Icons.access_time_rounded),
                      color: activeColor,
                    ),
                  ),
                  Expanded(
                    child: CardContainer(
                      color: activeColor,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: bottomContainerColor,
              margin: const EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: bottomContainerHeight,
            )
          ],
        ),
      ),
    );
  }
}

class CardContainer extends StatelessWidget {
  final Icon? icon;
  final Color? color;
  const CardContainer({
    Key? key,
    this.icon,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 170.0,
      // height: 200.0,
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: color,
      ),
      child: Center(child: icon),
    );
  }
}
