import 'package:flutter/material.dart';

class QuestionMarkDescription {
  static Future<dynamic> questionMarkDescription(BuildContext context) {
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
                  '?(question mark)',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ví dụ: String? a.',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'Thông báo cho DART biết biến là kiểu String hoặc là Null => đây là một tùy chọn',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
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
