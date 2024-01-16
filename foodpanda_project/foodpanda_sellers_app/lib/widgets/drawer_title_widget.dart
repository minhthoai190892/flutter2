import 'package:flutter/material.dart';

class DrawerTitleWidget extends StatelessWidget {
  final String title;
  final IconData iconData;
  final VoidCallback onTap;
  const DrawerTitleWidget({
    Key? key,
    required this.title,
    required this.iconData,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        iconData,
        color: Colors.black,
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.black),
      ),
      onTap: onTap,
    );
  }
}
