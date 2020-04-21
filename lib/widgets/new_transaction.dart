import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {

  final Function handleAddTransaction;

  NewTransaction(this.handleAddTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void onSubmit() {

    var title = titleController.text;
    var amount = double.parse(amountController.text);

    if (title.isEmpty || amount < 0) {
      return;
    }

    widget.handleAddTransaction(title, amount);

    // close the modal
    Navigator.of(context).pop();

  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
               onSubmitted: (_) => onSubmit(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => onSubmit(),
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Colors.purple,
              onPressed: onSubmit,
            )
          ],
        ),
      ),
    );
  }
}
