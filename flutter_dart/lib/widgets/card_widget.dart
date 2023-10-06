import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.title,
    required this.onTap,
    this.fontSize,
  });
  final double? fontSize;
  final String title;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    List<Color> a = [
      const Color.fromARGB(255, 121, 101, 99),
      const Color.fromARGB(255, 62, 84, 102)
    ];
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: a,
              begin: Alignment.bottomCenter,
              end: Alignment.bottomLeft,
              transform: const GradientRotation(30),
            ),
          ),
          width: 100,
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: fontSize,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
