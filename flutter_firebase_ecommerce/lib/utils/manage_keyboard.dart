import 'package:flutter/material.dart';

class KeyboardUtil {
  static void hideKeyboard(BuildContext context) {
    FocusScopeNode currentFoucs = FocusScope.of(context);
    if (!currentFoucs.hasPrimaryFocus) {
      currentFoucs.unfocus();
    }
  }
}
