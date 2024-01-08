import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();
final formatter = DateFormat.yMd();

enum Categoty { food, travel, leisure, work }

const categoryIcons = {
  Categoty.food: Icons.launch_outlined,
  Categoty.travel: Icons.flight_takeoff,
  Categoty.leisure: Icons.movie,
  Categoty.work: Icons.work
};

class Expense {
  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Categoty category;

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  ExpenseBucket({required this.categoty, required this.expenses});

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.categoty)
      : expenses = allExpenses
            .where((expense) => expense.category == categoty)
            .toList();

  final Categoty categoty;
  final List<Expense> expenses;

  double get tottalExpenses {
    double sum = 0;
    for (final expense in expenses) {
      sum += expense.amount;
    }

    return sum;
  }
}
