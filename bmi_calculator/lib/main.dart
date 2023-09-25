// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bmi_calculator/card_content.dart';
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
const activeCardColor = Color(0xFF1D1E33);
const bottomContainerColor = Color(0xFFEB1555);
const inactiveCardColor = Color(0xFF111328);

enum Gender { male, female }

class _MyAppState extends State<MyApp> {
  Color maleCardColor = inactiveCardColor;
  Color femaleCardColor = inactiveCardColor;
// 1 = male, 2 = female
  void updateColor(Gender selectedGender) {
    // male card pressed
    if (selectedGender ==Gender.male ) {
      if (maleCardColor == inactiveCardColor) {
        maleCardColor = activeCardColor;
        femaleCardColor = inactiveCardColor;
      } else {
        maleCardColor = inactiveCardColor;
      }
    } else {
      if (femaleCardColor == inactiveCardColor) {
        femaleCardColor = activeCardColor;
        maleCardColor = inactiveCardColor;
      } else {
        femaleCardColor = inactiveCardColor;
      }
    }
  }

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
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          updateColor(Gender.male);
                        });
                      },
                      child: CardContainer(
                        color: maleCardColor,
                        childWidget: const IconContent(
                            icon: FontAwesomeIcons.mars, label: 'Male'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          updateColor(Gender.female);
                        });
                      },
                      child: CardContainer(
                        color: femaleCardColor,
                        childWidget: const IconContent(
                            icon: FontAwesomeIcons.venus, label: 'Female'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(
              child: CardContainer(
                color: activeCardColor,
              ),
            ),
            const Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: CardContainer(
                      icon: Icon(Icons.access_time_rounded),
                      color: activeCardColor,
                    ),
                  ),
                  Expanded(
                    child: CardContainer(
                      color: activeCardColor,
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
