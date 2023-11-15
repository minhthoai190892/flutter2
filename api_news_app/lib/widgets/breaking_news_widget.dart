import 'package:flutter/material.dart';

class BreakingNewsWidget extends StatelessWidget {
  const BreakingNewsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Breaking News!',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'Pacifico'),
          ),
          Text(
            'View all',
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: Colors.blueAccent),
          ),
        ],
      ),
    );
  }
}
