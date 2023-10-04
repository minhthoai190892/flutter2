import 'package:flutter/material.dart';

class MapDescription {
  static Future<dynamic> mapDescription(BuildContext context) {
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
                  'map()',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                Expanded(
                  child: Text(
                    'Phương thức map() cho phép chúng tao tạo một mảng mới dựa trên mảng cũ và không làm thay đổi giá trị của mảng cũ. '
                    ,style: TextStyle(fontSize: 18),
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
