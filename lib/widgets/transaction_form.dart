import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final Function handlerAddTransaction;

  TransactionForm({@required this.handlerAddTransaction});

  @override
  State<StatefulWidget> createState() {
    return _TransactionFormState();
  }
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void _submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.handlerAddTransaction(title: enteredTitle, amount: enteredAmount);
  }

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
                  onSubmitted: (_) {
                    _submitData();
                    Navigator.of(context)
                        .pop(context); // remove a tela mais no topo da pilha
                  },
                ),
                TextField(
                    decoration: InputDecoration(labelText: 'Amount'),
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    onSubmitted: (_) {
                      _submitData();
                      Navigator.of(context)
                          .pop(context); // remove a tela mais no topo da pilha
                    }),
                FlatButton(
                    child: Text(
                      'Add expense',
                      style: TextStyle(color: Colors.purple),
                    ),
                    // color: Colors.purple,
                    onPressed: _submitData)
              ],
            )));
  }
}
