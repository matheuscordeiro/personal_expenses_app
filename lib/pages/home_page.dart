import 'package:flutter/material.dart';

import '../models/transaction.dart';
import '../widgets/transaction_form.dart';
import '../widgets/transaction_list.dart';
import '../widgets/chart.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  // Apenas o ponteiro é final, o valor em si pode ser modificado
  final List<Transaction> _transactions = [];

  void _addTransaction({@required String title, @required double amount}) {
    dynamic transaction = Transaction(
        id: _transactions.length + 1,
        title: title,
        amount: amount,
        datetime: DateTime.now());
    setState(() {
      _transactions.add(transaction);
    });
  }

  void _openModal(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return TransactionForm(handlerAddTransaction: _addTransaction, isModal: true);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses'),
        centerTitle: false,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () {
                _openModal(context);
              })
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
            TransactionForm(handlerAddTransaction: _addTransaction),
            SizedBox(height: 20),
            Chart(recentTransactions: _transactions),
            SizedBox(height: 20),
            TransactionList(transactions: _transactions),
          ])),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            _openModal(context);
          }),
      bottomNavigationBar:
          BottomAppBar(color: Colors.blueGrey, child: Container(height: 50)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
