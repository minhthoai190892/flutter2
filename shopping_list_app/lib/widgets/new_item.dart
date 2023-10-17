import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shopping_list_app/data/categories.dart';
import 'package:shopping_list_app/model/category.dart';
import 'package:shopping_list_app/model/grocery_item.dart';
import 'package:http/http.dart' as http;

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  var enterName = '';
  var enterQuantity = 1;
  var selectCategory = categories[Categories.carbs]!;
  final keyForm = GlobalKey<FormState>();
  //chưa gửi dữ liệu
  var _isSending = false;
  void saveItem() async {
    if (keyForm.currentState!.validate()) {
      //lưu các giá trị người dùng nhập
      keyForm.currentState!.save();
      setState(() {
        //nhấn gửi dữ liệu
        _isSending = true;
      });
      final url = Uri.https('flutter-prep-6f6b9-default-rtdb.firebaseio.com',
          'shopping-list.json');
      final response = await http.post(
        url,
        headers: {
          // kiểu dữ liệu định dạng cho firebase
          'Content-Type': 'application/json',
        },
        //encode: chuyển đổi dữ liệu thành văn bản có dạng json
        body: json.encode(
          {
            //id sẽ được firebase tự tạo là duy nhất
            'name': enterName,
            'quantity': enterQuantity,
            'category': selectCategory.title
          },
        ),
      );
      final Map<String, dynamic> resData = json.decode(response.body);
      if (!context.mounted) {
        return;
      }
      // Navigator.pop(context);
      //Trả về dữ liệu trang đã gọi
      Navigator.pop(
        context,
        GroceryItem(
            id: resData['name'],
            name: enterName,
            quantity: enterQuantity,
            category: selectCategory),
      );
      print("key>>>>>>> " + resData['name']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: keyForm,
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length <= 1 ||
                      value.trim().length > 50) {
                    return 'Must be between 1 and 50 characters';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  enterName = newValue!;
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Quantity',
                      ),
                      initialValue: enterQuantity.toString(),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            int.tryParse(value) == null ||
                            int.tryParse(value)! <= 0) {
                          return 'Must be between 1 and 50 characters';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        enterQuantity = int.tryParse(newValue!)!;
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: DropdownButtonFormField(
                      value: selectCategory,
                      //hiện giá trị mặc định cho dropdown
                      items: [
                        for (var category in categories.entries)
                          DropdownMenuItem(
                            //giá trị người dùng chọn trong menu và được onChang nhận
                            value: category.value,
                            child: Row(
                              children: [
                                Container(
                                  height: 24,
                                  width: 24,
                                  color: category.value.color,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(category.value.title)
                              ],
                            ),
                          ),
                      ],
                      onChanged: (value) {
                        selectCategory = value!;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: _isSending
                        ? null
                        : () {
                            keyForm.currentState!.reset();
                          },
                    child: const Text('Reset'),
                  ),
                  ElevatedButton(
                    onPressed: _isSending ? null : saveItem,
                    child: _isSending
                        ? const SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(),
                          )
                        : const Text('Add Item'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
