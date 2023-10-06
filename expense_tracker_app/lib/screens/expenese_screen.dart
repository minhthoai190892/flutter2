import 'package:expense_tracker_app/data/expenese_data.dart';
import 'package:expense_tracker_app/model/expenese.dart';
import 'package:expense_tracker_app/widgets/expenese_list/expenese_list.dart';
import 'package:expense_tracker_app/widgets/new_expenese.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final _registeredExpense = expensesData;
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (context) => NewExpenese(onAddExpenese: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpense.add(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter ExpenseTracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const Text('The Chart'),
            Expanded(child: ExpensesList(expenses: _registeredExpense)),
          ],
        ),
      ),
    );
  }
}
