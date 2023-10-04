import 'package:flutter/material.dart';

class ConstDescription {
  static Future<dynamic> constDescription(BuildContext context) {
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
                  'Const',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                Expanded(
                  child: Text(
                    'Const là hắng số sẽ lưu trữ nội bộ trong bộ nhớ của thiết bị chạy ứng dụng. Khi sử dụng lại giá trị đó lần thứ hai thì lấy từ bộ nhớ hiện có thay vì một đối tượng bộ nhớ thứ 2 được tạo. '
                    'Do đó việc sử dụng CONST cho phép DART sử dụng lại các giá trị thực sự bằng nhau và tránh trùng lặp dữ liệu trong bộ nhớ.',
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
