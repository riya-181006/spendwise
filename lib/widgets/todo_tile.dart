import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/todo.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({
    super.key,
    required this.todo,
    required this.onChanged,
  });

  final Todo todo;
  final ValueChanged<bool?> onChanged;

  static const Color _teal = Color(0xFF0F7A80);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: CheckboxListTile(
        value: todo.isDone,
        onChanged: onChanged,

        activeColor: _teal,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),

        title: Text(
          todo.title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: todo.isDone
                ? Colors.grey.shade500
                : const Color(0xFF042B30),
            decoration: todo.isDone
                ? TextDecoration.lineThrough
                : null,
          ),
        ),

        subtitle: Text(
          'Added on ${DateFormat.yMMMd().format(todo.createdAt)}',
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade600,
          ),
        ),
      ),
    );
  }
}