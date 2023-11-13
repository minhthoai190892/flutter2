// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'package:learnning_flutter/screens/FloatingActionButton/data/data.dart';

class ColorSpeedDial extends StatefulWidget {
  const ColorSpeedDial({
    Key? key,
    required this.onSelected,
  }) : super(key: key);
  final void Function(Color) onSelected;
  @override
  State<ColorSpeedDial> createState() => _ColorSpeedDialState();
}

class _ColorSpeedDialState extends State<ColorSpeedDial> {
  late Color currentColor;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentColor = speedDials[0].color;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      child: SpeedDial(
        children: speedDials
            .map((entry) => speedDialChild(entry.color, entry.label))
            .toList(),
        overlayOpacity: 0.0,
        backgroundColor: currentColor,
        visible: true,
        curve: Curves.elasticInOut,
      ),
    );
  }

  SpeedDialChild speedDialChild(Color color, String label) => SpeedDialChild(
        child: CircleAvatar(
          backgroundColor: color,
        ),
        // backgroundColor: Colors.white,
        onTap: () {
          setState(() {
            currentColor = color;
          });
          widget.onSelected(color);
        },
        label: label,
        labelStyle:
            const TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
        labelBackgroundColor: color,
        backgroundColor: color,
      );
}
