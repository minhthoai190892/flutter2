
import 'package:flutter/material.dart';

class DrawerMenuItems extends StatelessWidget {
  const DrawerMenuItems({
    super.key,
    required this.title,
    required this.iconData,
    required this.onTap,
  });
  final String title;
  final IconData iconData;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(iconData),
      title: Text(title),
      onTap: onTap,
    );
  }
}
