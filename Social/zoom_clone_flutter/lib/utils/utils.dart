import 'package:flutter/material.dart';

showSnackBar({required BuildContext context, required String text}) {
  return ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(text)));
}
