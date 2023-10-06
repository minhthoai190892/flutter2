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
      //đặt chiều cao của bottom sheet
      isScrollControlled: true,
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpense.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpense.indexOf(expense);
    setState(() {
      _registeredExpense.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense deleted'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpense.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainConten = const Center(
      child: Text('No expense found. Start adding some!'),
    );
    if (_registeredExpense.isNotEmpty) {
      mainConten = ExpensesList(
          expenses: _registeredExpense, onRemoveExpense: _removeExpense);
    }
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
            Expanded(
              child: mainConten,
            ),
          ],
        ),
      ),
    );
  }
}
