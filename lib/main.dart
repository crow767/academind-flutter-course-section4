import 'package:flutter/material.dart';

import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter App', home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {

  final List<Transaction> transactions = [
    Transaction(id: '1', title: 'Cheese Pizza', date: DateTime.now(), amount: 12.01),
    Transaction(id: '2', title: 'Stella Artois Beer', date: DateTime.now(), amount: 4.11)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                child: Card(
                  child: Text(
                    'CHART!',
                  ),
                  elevation: 10,
                  color: Colors.blue,
                ),
              ),
              Card(
                color: Colors.red,
                child: Text('LIST OF TX'),
              )
            ],
          ),
        ));
  }
}
