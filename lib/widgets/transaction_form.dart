import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function handlerAddTransaction;

  TransactionForm({@required this.handlerAddTransaction});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 2.0,
        child: Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: 'Title'),
                  controller: titleController,
                ),
                TextField(
                    decoration: InputDecoration(labelText: 'Amount'),
                    controller: amountController,
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true)),
                FlatButton(
                    child: Text(
                      'Add expense',
                      style: TextStyle(color: Colors.purple),
                    ),
                    // color: Colors.purple,
                    onPressed: () {
                      handlerAddTransaction(
                          title: titleController.text,
                          amount: amountController.text);
                    })
              ],
            )));
  }
}
