// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:foodpanda_users_app/widgets/progress_bar_widget.dart';

class LoadingDialogWidget extends StatelessWidget {
  final String message;
  const LoadingDialogWidget({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      key: key,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          circularProgress(),
          const SizedBox(
            height: 10,
          ),
          Text('$message, Please wait...'),
        ],
      ),
    );
  }
}
