<<<<<<< HEAD
enum ExpenseCategory {
  food,
  transport,
  fun,
  other,
}

class Expense {
  Expense({
    required this.id,
    required this.title,
    required this.amount,
    required this.category,
    required this.date,
  });

  final String id;
  final String title;
  final double amount;
  final ExpenseCategory category;
  final DateTime date;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'amount': amount,
      'category': category.name,
      'date': date.toIso8601String(),
    };
  }

  factory Expense.fromJson(
      Map<String, dynamic> json,
      ) {
    final String categoryName =
    (json['category'] ?? 'food')
        .toString();

    final ExpenseCategory category =
    ExpenseCategory.values.firstWhere(
          (ExpenseCategory item) {
        return item.name ==
            categoryName;
      },
      orElse: () {
        return ExpenseCategory.food;
      },
    );

    final dynamic amountValue =
    json['amount'];

    final double amount =
    amountValue is num
        ? amountValue.toDouble()
        : double.tryParse(
      amountValue.toString(),
    ) ??
        0;

    final String? dateString =
    json['date'] as String?;

    final DateTime date =
    dateString != null
        ? DateTime.parse(
      dateString,
    )
        : DateTime.now();

    return Expense(
      id: (json['id'] ?? DateTime.now().millisecondsSinceEpoch.toString())
          .toString(),

      title:
      (json['title'] ?? '')
          .toString(),

      amount: amount,

      category: category,

      date: date,
    );
  }
}

extension ExpenseCategoryLabel
on ExpenseCategory {
  String get label {
    switch (this) {
      case ExpenseCategory.food:
        return 'Food';

      case ExpenseCategory.transport:
        return 'Transport';

      case ExpenseCategory.fun:
        return 'Fun';

      case ExpenseCategory.other:
        return 'Other';
    }
  }}
=======
enum ExpenseCategory { food, travel, bills, shopping, other }

class Expense {
  final String id;
  final String title;
  final double amount;
  final ExpenseCategory category;
  final DateTime date;

  Expense({
    required this.id,
    required this.title,
    required this.amount,
    required this.category,
    required this.date,
  });
}
>>>>>>> 29879fcc7c434736ac46d019c8f65f3daa525093
