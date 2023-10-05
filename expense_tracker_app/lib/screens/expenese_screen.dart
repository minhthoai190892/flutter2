import 'package:expense_tracker_app/data/expenese_data.dart';
import 'package:expense_tracker_app/widgets/expenese_list/expenese_list.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  var data = expensesData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text('The Chart'),
            Expanded(child: ExpensesList(expenses: expensesData)),
          ],
        ),
      ),
    );
  }
}
