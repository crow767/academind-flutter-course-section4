import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import './chart_bar.dart';

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

  double get totalSpending {
    // change a list to another type
    return groupedTransactions.fold(0.0, (sum, item) {
      return sum + item['amount'];

      /// ???
    }); // starting value, function
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 6,
        margin: EdgeInsets.all(6),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: groupedTransactions.map((data) {
              return Flexible(
                  fit: FlexFit.tight,
                  child: ChartBar(
                      data['day'],
                      data['amount'],
                      totalSpending == 0.0
                          ? 0.0
                          : totalSpending / data['amount']));
            }).toList(),
          ),
        ),
      ),
    );
  }
}
