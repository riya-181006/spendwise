import 'package:flutter/material.dart';
import '../models/expense.dart';

class ExpenseCard extends StatelessWidget {
  final Expense expense;

  const ExpenseCard({
    super.key,
    required this.expense,
  });

  IconData get _categoryIcon {
    switch (expense.category) {
      case ExpenseCategory.food:
        return Icons.restaurant_outlined;
      case ExpenseCategory.transport:
        return Icons.directions_car_outlined;
      case ExpenseCategory.fun:
        return Icons.celebration_outlined;
      case ExpenseCategory.other:
        return Icons.category_outlined;
    }
  }

  Color get _categoryColor {
    switch (expense.category) {
      case ExpenseCategory.food:
        return const Color(0xFF17A398);
      case ExpenseCategory.transport:
        return const Color(0xFFF0997B);
      case ExpenseCategory.fun:
        return const Color(0xFFED93B1);
      case ExpenseCategory.other:
        return const Color(0xFF7A93A6);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: _categoryColor.withValues(alpha: 0.16),
              child: Icon(
                _categoryIcon,
                color: _categoryColor,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    expense.title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${expense.category.label} • ${expense.date.day}/${expense.date.month}/${expense.date.year}',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              '₹${expense.amount.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Color(0xFF0F7A80),
              ),
            ),
          ],
        ),
      ),
    );
  }
}