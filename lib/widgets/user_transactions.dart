import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './transaction_list.dart';
import './new_transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> transactions = [
    Transaction(
        id: '1', title: 'Cheese Pizza', date: DateTime.now(), amount: 12.01),
    Transaction(
        id: '2',
        title: 'Stella Artois Beer',
        date: DateTime.now(),
        amount: 4.11)
  ];

  void addNewTransaction(String txTitle, double txAmount) {
    var newTransaction = Transaction(
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState((){
      transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(addNewTransaction),
        TransactionList(transactions),
      ],
    );
  }
}
