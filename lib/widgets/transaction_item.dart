import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  final Transaction transaction;
  final Function handlerDeleteTransaction;

  TransactionItem(
      {@required this.transaction, @required this.handlerDeleteTransaction});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 2.0,
        child: ListTile(
          leading: CircleAvatar(
              radius: 30.0,
              child: Padding(
                  padding: EdgeInsets.all(6.0),
                  child: FittedBox(
                    child: Text(
                      'R\$ ${transaction.amount.toStringAsFixed(2)}',
                    ),
                  ))),
          title: Text('${transaction.title}',
              style: Theme.of(context).textTheme.title),
          subtitle: Text(
            '${DateFormat.yMd().format(transaction.datetime)}',
            style: TextStyle(color: Colors.grey, fontSize: 13),
          ),
          trailing: MediaQuery.of(context).size.width > 500
              ? FlatButton.icon(
                  icon: Icon(Icons.delete),
                  label: Text('Delete transaction'),
                  textColor: Colors.blueGrey,
                  onPressed: () => handlerDeleteTransaction(id: transaction.id),
                )
              : IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Colors.blueGrey,
                  ),
                  onPressed: () => handlerDeleteTransaction(id: transaction.id),
                ),
        ));
  }
}
