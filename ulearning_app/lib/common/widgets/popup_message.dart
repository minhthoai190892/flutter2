import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// positional optional parameter
toastInfo(
  String msg, {
  Color backgroundColor = Colors.blue,
  Color textColor = Colors.white,
}) {
  return Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 1,
    backgroundColor: backgroundColor,
    textColor: textColor,
    fontSize: 16.0,
  );
}
