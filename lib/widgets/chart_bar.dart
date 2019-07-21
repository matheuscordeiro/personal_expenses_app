import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final double total;
  final double percentage;
  final String day;

  ChartBar(
      {@required this.total, @required this.percentage, @required this.day});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            height: 20.0,
            child: FittedBox(child: Text('R\$ ${total.toStringAsFixed(2)}'))),
        SizedBox(height: 2.0),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10.0)),
              ),
              FractionallySizedBox(
                heightFactor: 1.0 - percentage,
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(10.0)),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 2.0),
        Text(day)
      ],
    );
  }
}
