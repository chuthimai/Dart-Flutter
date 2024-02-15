import 'package:expense/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

import '../../models/expense.dart';

class ExpensesList extends StatelessWidget {
  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length, // co bao nhieu muc se dc hien thi cuoi cung
      itemBuilder: (ctx, index) {
        return Dismissible(
            key: ValueKey(expenses.elementAt(index)),
            background: Container(
              color: Theme.of(context).colorScheme.errorContainer,
              margin: Theme.of(context).cardTheme.margin,
            ),
            onDismissed: (direction) {
              onRemoveExpense(expenses.elementAt(index));
            },
            child: ExpenseItem(
              expense: expenses.elementAt(index),
            ));
      }, // 0 ≤ index < expenses.length
    );
  }
}
