// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 50,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(width: 2, color: Colors.grey)),
          gradient: LinearGradient(
            colors: [
              Colors.cyan,
              Colors.amber,
            ],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.mirror,
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontFamily: 'Signatra',
            fontSize: 30,
            letterSpacing: 2,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
