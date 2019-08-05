import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/transaction.dart';
import '../widgets/chart.dart';
import '../widgets/transaction_form.dart';
import '../widgets/transaction_list.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  // Apenas o ponteiro é final, o valor em si pode ser modificado
  final List<Transaction> _transactions = [];

  void _addTransaction(
      {@required String title,
      @required double amount,
      @required DateTime datetime}) {
    dynamic transaction = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        datetime: datetime);
    setState(() {
      _transactions.add(transaction);
    });
  }

  void _deleteTransaction({@required String id}) {
    setState(() {
      _transactions.removeWhere((tx) {
        return tx.id == id;
      });
    });
  }

  void _openModal(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return TransactionForm(handlerAddTransaction: _addTransaction);
        });
  }

  PreferredSizeWidget _buildAppBar(){
    return Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text('Personal Expenses'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                GestureDetector(
                  child: Icon(CupertinoIcons.add),
                  onTap: () => _openModal(context),
                )
              ],
            ),
          )
        : AppBar(
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
          );
  }

  @override
  Widget build(BuildContext context) {
    final PreferredSizeWidget appBar = _buildAppBar();
    final Widget appBody = SafeArea(
        child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
          const SizedBox(height: 20),
          Switch.adaptive(
            value: true,
            onChanged: (_) {},
            activeColor: Theme.of(context).accentColor,
          ),
          const SizedBox(height: 20),
          Container(
            child: Chart(recentTransactions: _transactions),
            height: 150,
          ),
          const SizedBox(height: 20),
          TransactionList(
              transactions: _transactions,
              handlerDeleteTransaction: _deleteTransaction),
        ])));

    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: appBody,
            navigationBar: appBar,
          )
        : Scaffold(
            appBar: appBar,
            body: appBody,
            floatingActionButton: Platform.isIOS
                ? Container()
                : FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: () {
                      _openModal(context);
                    }),
            bottomNavigationBar: BottomAppBar(
                color: Colors.blueGrey, child: Container(height: 50)),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
          );
  }
}
