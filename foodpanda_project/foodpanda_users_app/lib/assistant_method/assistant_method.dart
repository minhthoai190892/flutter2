import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodpanda_users_app/assistant_method/cart_item_counter.dart';
import 'package:foodpanda_users_app/global/global.dart';
import 'package:provider/provider.dart';

void addItemToCart(
    {required String itemId,
    required BuildContext context,
    required int itemCounter}) {
  List<String> tempList = sharedPreferences!.getStringList('userCart')!;
  tempList.add('$itemId:$itemCounter');
  firebaseFirestore
      .collection('users')
      .doc(firebaseAuth.currentUser!.uid)
      .update({'userCart': tempList}).then((value) {
    Fluttertoast.showToast(msg: 'Item Added Successfully');
    sharedPreferences!.setStringList('userCart', tempList);
    // update the badge
    Provider.of<CartItemCounter>(context, listen: false)
        .displayCartListItemsNumber();
  });
}

separateItemIDs() {
  // tạo 2 mảng
  List<String> separateItemIDList = [], defaultItemList = [];
  //lấy dữ liệu từ firebase
  defaultItemList = sharedPreferences!.getStringList('userCart')!;
  for (var i = 0; i < defaultItemList.length; i++) {
    // lấy từng dữ liệu trong mảng
    String item = defaultItemList[i].toString(); //=>65557:7
    // lấy vị trí cuối cùng của chuổi tại (:)
    var pos = item.lastIndexOf(":"); //=>4
    //65557
    String getItemId = (pos != -1) ? item.substring(0, pos) : item;
    print('This is itemId now= $getItemId');
    separateItemIDList.add(getItemId);
  }
  for (var element in separateItemIDList) {
    print('This is List now= $element}');
  }
  return separateItemIDList;
}

separateItemQuantities() {
  List<int> separateItemQuantityList = [];
  List<String> defaultItemList = [];
  int i = 1;

  defaultItemList = sharedPreferences!.getStringList("userCart")!;

  for (i; i < defaultItemList.length; i++) {
    //56557657:7
    String item = defaultItemList[i].toString();
    print("Test : =>>>"+defaultItemList[i].toString());

    //0=:
    //1=7
    //:7
    List<String> listItemCharacters = item.split(":").toList();

    //7
    var quanNumber = int.parse(listItemCharacters[1].toString());

    print("\nThis is Quantity Number = " + quanNumber.toString());

    separateItemQuantityList.add(quanNumber);
  }

  print("\nThis is Quantity List now = ");
  print(separateItemQuantityList);

  return separateItemQuantityList;
}
