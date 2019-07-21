import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function handlerDeleteTransaction;

  TransactionList(
      {@required this.transactions, @required this.handlerDeleteTransaction});

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Center(
            child: Container(
            child: Text('Não há transações cadastradas'),
            margin: EdgeInsets.only(top: 20),
          ))
        : Container(
            height: 300,
            child: ListView.builder(
              itemBuilder: (BuildContext bcx, int index) {
                return Card(
                    elevation: 2.0,
                    child: ListTile(
                      leading: CircleAvatar(
                          radius: 30.0,
                          child: Padding(
                              padding: EdgeInsets.all(6.0),
                              child: FittedBox(
                                child: Text(
                                  'R\$ ${transactions[index].amount.toStringAsFixed(2)}',
                                ),
                              ))),
                      title: Text('${transactions[index].title}',
                          style: Theme.of(context).textTheme.title),
                      subtitle: Text(
                        '${DateFormat.yMd().format(transactions[index].datetime)}',
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.blueGrey,
                        ),
                        onPressed: () => handlerDeleteTransaction(
                            id: transactions[index].id),
                      ),
                    ));
              },
              itemCount: transactions.length,
            ));
  }
}
