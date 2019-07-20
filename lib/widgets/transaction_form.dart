import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final Function handlerAddTransaction;
  final bool isModal;

  TransactionForm({@required this.handlerAddTransaction, this.isModal = false});

  @override
  State<StatefulWidget> createState() {
    return _TransactionFormState();
  }
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void _submitData(BuildContext context) {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    if (widget.isModal) {
      Navigator.of(context).pop(context); // remove a tela mais no topo da pilha
    }
    widget.handlerAddTransaction(title: enteredTitle, amount: enteredAmount);
    FocusScope.of(context).requestFocus(new FocusNode()); // fecha o teclado
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
                    onSubmitted: (_) => _submitData(context)),
                TextField(
                    decoration: InputDecoration(labelText: 'Amount'),
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    onSubmitted: (_) => _submitData(context)),
                FlatButton(
                    child: Text(
                      'Add expense',
                      style: TextStyle(color: Colors.purple),
                    ),
                    // color: Colors.purple,
                    onPressed: () => _submitData(context))
              ],
            )));
  }
}
