import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(
        days: index,
      ));
      var totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        var transactionDate = recentTransactions[i].date;

        if (weekDay.day == transactionDate.day &&
            weekDay.month == transactionDate.month &&
            weekDay.year == transactionDate.year) {
          totalSum += recentTransactions[i].amount;
        }
      }

      return {'day': DateFormat.E().format(weekDay), 'amount': totalSum};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 6,
        margin: EdgeInsets.all(6),
        child: Row(
          children: groupedTransactions.map((tx) {
            return Text('${tx['day']}:${tx['amount']}');
          }).toList(),
        ),
      ),
    );
  }
}
