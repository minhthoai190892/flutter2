// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:learnning_flutter/screens/flip_animation/flip_animation.dart';

void main() {
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navKey,
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
        title: const Text('Learnning Flutter'),
      ),
      drawer: Drawer(
          child: ListView(
        children: [
          const DrawerHeader(
            child: Text('Drawer header'),
          ),
          NewWidget(text: 'Page View', screen: PageView()),
          const NewWidget(text: 'FlipAnimation', screen: FlipAnimation()),
        ],
      )),
      body: const SafeArea(
        child: Center(
          child: Text('data'),
        ),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key? key,
    required this.text,
    required this.screen,
  }) : super(key: key);
  final String text;
  final Widget screen;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(text),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => screen,
            ));
      },
    );
  }
}
