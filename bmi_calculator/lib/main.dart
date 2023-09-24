// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bmi_calculator/cart_content.dart';
import 'package:bmi_calculator/icon_content.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                      childWidget: IconContent(
                          icon: FontAwesomeIcons.mars, label: 'Male'),
                    ),
                  ),
                  Expanded(
                    child: CardContainer(
                      color: activeColor,
                      childWidget: IconContent(
                          icon: FontAwesomeIcons.venus, label: 'Female'),
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
