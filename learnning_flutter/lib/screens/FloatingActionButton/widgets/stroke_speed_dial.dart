// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:learnning_flutter/screens/FloatingActionButton/data/data.dart';

class StrokeSpeedDial extends StatefulWidget {
  const StrokeSpeedDial({
    Key? key,
    required this.onSelected,
  }) : super(key: key);
  final void Function(double) onSelected;

  @override
  State<StrokeSpeedDial> createState() => _StrokeSpeedDialState();
}

class _StrokeSpeedDialState extends State<StrokeSpeedDial> {
  late double currentStrokeWidth;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentStrokeWidth = strokeWidths[0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      child: SpeedDial(
        overlayOpacity: 0.0,
        backgroundColor: Theme.of(context).primaryColor,
        child: buildText(currentStrokeWidth),
        visible: true,
        curve: Curves.elasticInOut,
        children: strokeWidths.map(speedDialChild).toList(),
      ),
    );
  }

  SpeedDialChild speedDialChild(double strokeWidth) {
    return SpeedDialChild(
        child: CircleAvatar(
          child: buildText(strokeWidth),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        onTap: () => onTap(strokeWidth),
        labelStyle:
            const TextStyle(fontWeight: FontWeight.bold, color: Colors.white));
  }

  Widget buildText(double strokeWidth) {
    return FittedBox(
      fit: BoxFit.contain,
      child: Text('${strokeWidth.toInt()}'),
    );
  }

  void onTap(double strokeWidth) {
    setState(() {
      currentStrokeWidth = strokeWidth;
    });
    widget.onSelected(strokeWidth);
  }
}
