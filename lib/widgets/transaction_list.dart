import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../models/transaction.dart';
import './transaction_item.dart';

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
            child: Text(
              'Não há transações cadastradas',
              style: Theme.of(context).textTheme.title,
            ),
            margin: EdgeInsets.only(top: 20),
          ))
        : Container(
            height: 300,
            child: ListView.builder(
              itemBuilder: (BuildContext bcx, int index) {
                return TransactionItem(
                    transaction: transactions[index],
                    handlerDeleteTransaction: handlerDeleteTransaction);
              },
              itemCount: transactions.length,
            ));
  }
}
