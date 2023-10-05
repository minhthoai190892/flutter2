// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:expense_tracker_app/widgets/expenese_list/expenese_item.dart';
import 'package:flutter/material.dart';

import 'package:expense_tracker_app/model/expenese.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    Key? key,
    required this.expenses,
  }) : super(key: key);
  //danh sách data
  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => ExpenseItem(expense: expenses[index]),
      itemCount: expenses.length,
    );
  }
}
