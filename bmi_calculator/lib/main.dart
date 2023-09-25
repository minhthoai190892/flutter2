// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bmi_calculator/card_content.dart';
import 'package:bmi_calculator/constants.dart';
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

enum Gender { male, female }

class _MyAppState extends State<MyApp> {
//   Color maleCardColor = inactiveCardColor;
//   Color femaleCardColor = inactiveCardColor;
// // 1 = male, 2 = female
//   void updateColor(Gender selectedGender) {
//     // male card pressed
//     if (selectedGender ==Gender.male ) {
//       if (maleCardColor == inactiveCardColor) {
//         maleCardColor = activeCardColor;
//         femaleCardColor = inactiveCardColor;
//       } else {
//         maleCardColor = inactiveCardColor;
//       }
//     } else {
//       if (femaleCardColor == inactiveCardColor) {
//         femaleCardColor = activeCardColor;
//         maleCardColor = inactiveCardColor;
//       } else {
//         femaleCardColor = inactiveCardColor;
//       }
//     }
//   }
  Gender selectedGender = Gender.male;
  int height = 180;
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: CardContainer(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      color: selectedGender == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      childWidget: const IconContent(
                          icon: FontAwesomeIcons.mars, label: 'Male'),
                    ),
                  ),
                  Expanded(
                    child: CardContainer(
                      onPress: () {
                        selectedGender = Gender.female;
                      },
                      color: selectedGender == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      childWidget: const IconContent(
                          icon: FontAwesomeIcons.venus, label: 'Female'),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: CardContainer(
                color: kActiveCardColor,
                childWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'HEIGHT',
                      style: kLabelStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kNumberTextStyle,
                        ),
                        const Text(
                          'cm',
                          style: kLabelStyle,
                        ),
                      ],
                    ),
                    Slider(
                      min: 120.0,
                      max: 220.0,
                      activeColor: const Color(0xFFEB1555),
                      inactiveColor: const Color(0xFF8D8E98),
                      value: height.toDouble(),
                      onChanged: (newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                        print(newValue);
                      },
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  const Expanded(
                    child: CardContainer(
                      icon: Icon(Icons.access_time_rounded),
                      color: kActiveCardColor,
                    ),
                  ),
                  Expanded(
                    child: CardContainer(
                      onPress: () {},
                      color: kActiveCardColor,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: kBottomContainerColor,
              margin: const EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: kBottomContainerHeight,
            )
          ],
        ),
      ),
    );
  }
}
