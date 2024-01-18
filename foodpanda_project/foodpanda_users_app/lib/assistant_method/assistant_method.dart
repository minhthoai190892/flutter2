import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodpanda_users_app/global/global.dart';

void addItemToCart(
    {required String itemId,
    required BuildContext context,
    required int itemCounter}) {
  List<String> tempList = sharedPreferences!.getStringList('userCart')!;
  tempList.add('$itemId:$itemCounter');
  firebaseFirestore
      .collection('users')
      .doc(firebaseAuth.currentUser!.uid)
      .set({'userCart': tempList}).then((value) {
    Fluttertoast.showToast(msg: 'Item Added Successfully');
    sharedPreferences!.setStringList('userCart', tempList);
  });
}
