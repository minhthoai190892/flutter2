// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:uuid/uuid.dart';

//tạo Id duy nhất
const uuid = Uuid();

enum Category { food, travel, leisure, work }

class Expenese {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
  Expenese({

    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4(); //=>tính năng danh sách khởi tạo
}
