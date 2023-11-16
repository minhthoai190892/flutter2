import 'package:flutter/material.dart';
import 'package:learnning_flutter/screens/FloatingActionButton/widgets/color_speed_dial.dart';
import 'package:learnning_flutter/screens/FloatingActionButton/widgets/stroke_speed_dial.dart';
import 'package:learnning_flutter/widgets/app_appbar.dart';

class FloatingActionButtonScreen extends StatefulWidget {
  const FloatingActionButtonScreen({super.key});

  @override
  State<FloatingActionButtonScreen> createState() =>
      _FloatingActionButtonScreenState();
}

class _FloatingActionButtonScreenState
    extends State<FloatingActionButtonScreen> {
  Color color = Colors.black;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(title: 'Floating Action Button'),
      body: Container(
        width: 300,
        height: 300,
        color: color,
      ),
      floatingActionButton: Row(
        children: [
          ColorSpeedDial(
            onSelected: (p0) {
              setState(() {
                color = p0;
              });
            },
          ),
          StrokeSpeedDial(onSelected: (p0) {
            
          },)
        ],
      ),
    );
  }
}
