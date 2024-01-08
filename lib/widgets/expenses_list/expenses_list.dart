import 'package:expense_track/models/expense.dart';
import 'package:expense_track/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemoveItem});

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveItem;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, index) {
          return Dismissible(
            onDismissed: (direction) {
              onRemoveItem(expenses[index]);
            },
            key: ValueKey(expenses[index]),
            background: Container(
              color: Theme.of(context).colorScheme.error,
            ),
            child: ExpenseItem(expenses[index]),
          );
        });
  }
}
