// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

//tạo Id duy nhất
const uuid = Uuid();
//định dạng ngày
final format = DateFormat.yMd();

enum Category { food, travel, leisure, work }

const categoryIcon = {
  Category.food: Icons.restaurant,
  Category.travel: Icons.local_florist,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4(); //=>tính năng danh sách khởi tạo
  String get formatDate {
    return format.format(date);
  }
}
