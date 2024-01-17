// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TextWidget extends SliverPersistentHeaderDelegate {
  final String title;
  TextWidget({
    required this.title,
  });
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    throw InkWell(
      child: Container(
        height: 80,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
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
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Signatra',
            fontSize: 30,
            letterSpacing: 2,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
