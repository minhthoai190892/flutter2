import 'package:flutter/material.dart';

class DauBaChamDescription {
  static Future<dynamic> dauBaChamDescription(BuildContext context) {
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
                  '...(3-dot method)',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'var number = [1,2,3]\nvar moreNumber = [number,4,5] --> [[1,2,3],4,5]\nvar moreNumber = [...number,4,5] --> [1,2,3,4,5]',
                        style: TextStyle(color: Colors.red, fontSize: 16),
                      ),
                      Text(
                        'Là một phương thức tích hợp giúp ta lấy các giá trị có trong một mảng ra trở thành từng phần tử riêng lẻ',
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
