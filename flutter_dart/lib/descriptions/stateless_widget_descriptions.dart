import 'package:flutter/material.dart';

class StatelessWidgetDescription {
  static Future<dynamic> statelessWidgetDescription(BuildContext context) {
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
                  'Stateless Widget',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                Expanded(
                  child: Text(
                    'Stateless Widget là tiện ích không trạng thái không có dữ liệu thay đổi bên trong, khi thay đổi sẽ phải cập nhật lại giao diện người dùng',
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
