// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

pickImage({required ImageSource source}) async {
  final ImagePicker imagePicker = ImagePicker();
  XFile? flie = await imagePicker.pickImage(source: source);
  if (flie != null) {
    return await flie.readAsBytes();
  }
  print('No image selected');
}

showSnackBar({required String content, required BuildContext context}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}
