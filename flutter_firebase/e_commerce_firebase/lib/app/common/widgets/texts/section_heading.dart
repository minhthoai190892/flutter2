import 'package:flutter/material.dart';

class TSectionHeading extends StatelessWidget {
  /// title of the category section
  ///
  /// [textColor] màu của chữ
  ///
  /// [showActionButton] cho phép hiển thị text button hay không
  ///
  /// [title] title
  ///
  /// [buttonTitle] tên của title text button
  ///
  /// [onPressed]
  const TSectionHeading({
    super.key,
    this.textColor,
    this.showActionButton = false,
    required this.title,
    this.buttonTitle = 'View all',
    this.onPressed,
  });
  final Color? textColor;
  final bool showActionButton;
  final String title, buttonTitle;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: textColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (showActionButton)
          TextButton(onPressed: onPressed, child: Text(buttonTitle))
      ],
    );
  }
}
