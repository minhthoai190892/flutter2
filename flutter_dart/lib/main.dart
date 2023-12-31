import 'package:flutter/material.dart';
import 'package:flutter_dart/descriptions/cham_hoi_descriptions.dart';
import 'package:flutter_dart/descriptions/const_descriptions.dart';
import 'package:flutter_dart/descriptions/dau_ba_cham_descriptions.dart';
import 'package:flutter_dart/descriptions/map_descriptions.dart';
import 'package:flutter_dart/descriptions/stateful_widget_descriptions.dart';
import 'package:flutter_dart/descriptions/stateless_widget_descriptions.dart';
import 'package:flutter_dart/screens/dice_screen.dart';
import 'package:flutter_dart/screens/quiz_app/quiz_screen.dart';
import 'package:flutter_dart/widgets/card_widget.dart';
import 'package:flutter_dart/widgets/drawer_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter and Dart'),
        backgroundColor: Colors.blueGrey,
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //Header
              Material(
                color: Colors.blue.shade800,
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.only(
                        top: 24 + MediaQuery.of(context).padding.top,
                        bottom: 24),
                    child: const Column(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              AssetImage('assets/images/flutter.png'),
                        ),
                        Text(
                          'Flutter and Darts',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              //Menu Items
              Container(
                padding: const EdgeInsets.all(24),
                child: Wrap(
                  // runSpacing: 16,
                  children: [
                    DrawerMenuItems(
                      title: 'Home',
                      iconData: FontAwesomeIcons.houseMedical,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MyHomePage(),
                            ));
                      },
                    ),
                    DrawerMenuItems(
                      title: 'Dice',
                      iconData: FontAwesomeIcons.dice,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DiceScreen(),
                            ));
                      },
                    ),
                    DrawerMenuItems(
                      title: 'Qiz',
                      iconData: FontAwesomeIcons.question,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const QuizScreen(),
                            ));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                // alignment: WrapAlignment.center,
                direction: Axis.horizontal,
                spacing: 16,
                runSpacing: 16,
                children: [
                  CardWidget(
                    title: 'Const',
                    fontSize: 25,
                    onTap: () {
                      ConstDescription.constDescription(context);
                    },
                  ),
                  CardWidget(
                    fontSize: 25,
                    title: '?',
                    onTap: () {
                      QuestionMarkDescription.questionMarkDescription(context);
                    },
                  ),
                  CardWidget(
                    title: 'Stateless Widgets',
                    fontSize: 18,
                    onTap: () {
                      StatelessWidgetDescription.statelessWidgetDescription(
                          context);
                    },
                  ),
                  CardWidget(
                    title: 'Stateful Widgets',
                    fontSize: 18,
                    onTap: () {
                      StatefulWidgetDescription.statefulWidgetDescription(
                          context);
                    },
                  ),
                  CardWidget(
                    title: 'map()',
                    fontSize: 18,
                    onTap: () {
                      MapDescription.mapDescription(context);
                    },
                  ),
                  CardWidget(
                    title: '...',
                    fontSize: 18,
                    onTap: () {
                      DauBaChamDescription.dauBaChamDescription(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
