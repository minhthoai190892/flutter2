import 'package:flutter/material.dart';

class TSettingsMenuTitle extends StatelessWidget {
  /// Menu title
  ///
  /// [leading] icon
  ///
  /// [title] title
  ///
  /// [subtitle] subtitle
  ///
  /// [trailing] icon button
  const TSettingsMenuTitle({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
    this.trailing,
    this.onTap,
  });
  final IconData icon;
  final String title, subTitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 28,
        color: Colors.white,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: Text(
        subTitle,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
