import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final Function handlerAddTransaction;

  TransactionForm({@required this.handlerAddTransaction});

  @override
  State<StatefulWidget> createState() {
    return _TransactionFormState();
  }
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime dateSelected;

  void _submitData(BuildContext context) {
    final enteredTitle = _titleController.text;
    final enteredAmount = _amountController.text;

    if (enteredTitle.isEmpty || enteredAmount.isEmpty || dateSelected == null) {
      return;
    }

    widget.handlerAddTransaction(title: enteredTitle, amount: double.parse(enteredAmount), datetime: dateSelected);
    FocusScope.of(context).requestFocus(new FocusNode()); // fecha o teclado
    Navigator.of(context)
        .pop(context); // remove a tela mais no topo da pilha (modal)
  }

  void _showDatePicker(BuildContext context) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime(2020))
        .then((date) {
      if (date != null) {
        setState(() {
          dateSelected = date;
        });
      }
    });
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
                    controller: _titleController,
                    onSubmitted: (_) => _submitData(context)),
                TextField(
                    decoration: InputDecoration(labelText: 'Amount'),
                    controller: _amountController,
                    keyboardType: TextInputType.number,
                    onSubmitted: (_) => _submitData(context)),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: <Widget>[
                    Text(dateSelected == null
                        ? 'Date not found'
                        : '${DateFormat('d/M/y').format(dateSelected)}'),
                    FlatButton(
                        child: Text('Choose the date',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold)),
                        onPressed: () {
                          _showDatePicker(context);
                        })
                  ],
                ),
                RaisedButton(
                    child: Text(
                      'Add expense',
                    ),
                    color: Theme.of(context).primaryColor,
                    textColor: Theme.of(context).textTheme.button.color,
                    onPressed: () => _submitData(context))
              ],
            )));
  }
}
