import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList({@required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: ListView.builder(
          itemBuilder: (BuildContext bcx, int index) {
            return Card(
              child: Row(
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.all(10.0),
                      padding: EdgeInsets.all(2.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.purple, width: 2)),
                      child: Text(
                        'R\$ ${transactions[index].amount.toStringAsFixed(2)}',
                        style: TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )),
                  Container(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '${transactions[index].title}',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${DateFormat.Hms().format(transactions[index].datetime)}  ${DateFormat.yMd().format(transactions[index].datetime)}',
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      )
                    ],
                  )),
                ],
              ),
            );
          },
          itemCount: transactions.length,
        ));
  }
}