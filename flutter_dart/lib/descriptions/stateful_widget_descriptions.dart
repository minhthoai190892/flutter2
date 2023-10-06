import 'package:flutter/material.dart';

class StatefulWidgetDescription {
  static Future<dynamic> statefulWidgetDescription(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return const SizedBox(
          height: 400,
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Stateful Widget',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                Expanded(
                  child: Text(
                    'Stateful Widget là tiện có trạng thái nó hỗ trợ dữ liệu nội bộ có thể thay đổi. Và khi dữ liệu đó thay đổi thì sẽ dẫn đến một giao diện người dùng được cập nhật',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
