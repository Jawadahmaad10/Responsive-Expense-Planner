import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

//setting for date
final formatter = DateFormat.yMd();

//which we can now use anywhere in this file
//to generate unique IDs.
//And I wanna generate a unique ID
//for this expense class whenever it is instantiated.
// to generate a unique id when it is initiated
const uuid = Uuid();

enum Category { food, travel, leisure, work }

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid
            .v4(); // : initializer list    // uuid.v4 v4 generates a unique string id

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category; // custom type

  //getter
  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({
    required this.category,
    required this.expenses,
  });

  //named constrcutor function
  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;

    for (final expense in expenses) {
      sum += expense.amount; //sum = sum+expense.amount;
    }
    return sum;
  }
}
