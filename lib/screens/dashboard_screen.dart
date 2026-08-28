import 'package:flutter/material.dart';

import '../models/expense.dart';
import '../models/todo.dart';

import '../widgets/dashboard_metric_card.dart';

class DashboardScreen
    extends StatelessWidget {
  const DashboardScreen({
    super.key,
    required this.expenses,
    required this.todos,
  });

  final List<Expense> expenses;
  final List<Todo> todos;

  static const Color _tealDark = Color(0xFF042B30);
  static const Color _tealMid = Color(0xFF0F7A80);
  static const Color _tealLight = Color(0xFF17A398);

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();

    final double totalSpent =
    expenses.fold<double>(
      0,
          (
          double sum,
          Expense expense,
          ) {
        return sum + expense.amount;
      },
    );

    final double todaySpent =
    expenses
        .where(
          (Expense expense) {
        return expense.date.year ==
            now.year &&
            expense.date.month ==
                now.month &&
            expense.date.day ==
                now.day;
      },
    )
        .fold<double>(
      0,
          (
          double sum,
          Expense expense,
          ) {
        return sum +
            expense.amount;
      },
    );

    final int completedTasks =
        todos
            .where(
              (Todo todo) {
            return todo.isDone;
          },
        )
            .length;

    final int todayTasks =
        todos
            .where(
              (Todo todo) {
            return todo
                .createdAt.year ==
                now.year &&
                todo.createdAt.month ==
                    now.month &&
                todo.createdAt.day ==
                    now.day;
          },
        )
            .length;

    return Scaffold(
      backgroundColor: const Color(0xFFF1FBF9),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 100,
            backgroundColor: _tealMid,
            foregroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Dashboard'),
              background: Container(
                decoration: const BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment(-0.6, -1),
                    radius: 1.4,
                    colors: [_tealLight, _tealMid, _tealDark],
                    stops: [0.0, 0.5, 1.0],
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                DashboardMetricCard(
                  label: 'Total Spent',
                  value: '₹${totalSpent.toStringAsFixed(2)}',
                  icon: Icons.account_balance_wallet_outlined,
                  color: _tealMid,
                ),
                const SizedBox(height: 12),
                DashboardMetricCard(
                  label: "Today's Spending",
                  value: '₹${todaySpent.toStringAsFixed(2)}',
                  icon: Icons.today_outlined,
                  color: _tealLight,
                ),
                const SizedBox(height: 12),
                DashboardMetricCard(
                  label: 'Tasks Completed',
                  value: '$completedTasks / ${todos.length}',
                  icon: Icons.check_circle_outline,
                  color: _tealDark,
                ),
                const SizedBox(height: 12),
                DashboardMetricCard(
                  label: 'Tasks Added Today',
                  value: '$todayTasks',
                  icon: Icons.playlist_add_check_outlined,
                  color: const Color(0xFF5FB8AE),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}