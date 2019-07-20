import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './chart_bar.dart';
import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart({@required this.recentTransactions});

  List<Map<String, Object>> get groupDayValues {
    return List.generate(7, (index) {
      final DateTime agora = DateTime.now();
      final DateTime date =
          agora.subtract(Duration(days: agora.weekday - index));
      String day = DateFormat.E().format(date);
      double total = 0.0;
      for (Transaction t in recentTransactions) {
        if (t.datetime.weekday == index &&
            t.datetime.month == agora.month &&
            t.datetime.year == agora.year) {
          total += t.amount;
        }
      }
      return {'day': day, 'totalByDay': total};
    });
  }

  double get totalSpending {
    return groupDayValues.fold(0.0, (sum, item) {
      return sum + item['totalByDay'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 2.0,
        child: Container(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                ...groupDayValues.map((obj) {
                  return Flexible(
                      fit: FlexFit.tight,
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                          child: ChartBar(
                              total: obj['totalByDay'],
                              percentage: totalSpending != 0.0 ? (obj['totalByDay'] as double) / totalSpending : 0,
                              day: obj['day'])));
                }).toList()
              ],
            ),
          ),
        ));
  }
}
