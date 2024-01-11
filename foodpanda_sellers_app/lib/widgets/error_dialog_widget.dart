// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ErrorDialogWidget extends StatelessWidget {
  final String message;
  const ErrorDialogWidget({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      key: key,
      content: Text(message),
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Center(child: Text('Ok')),
        ),
      ],
    );
  }
}
