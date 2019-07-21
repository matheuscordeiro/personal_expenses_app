import 'package:flutter/material.dart';

import 'pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.purple,
          textTheme: ThemeData.light().textTheme.copyWith(
            button: TextStyle(color: Colors.white)
          ),
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                  title: TextStyle(fontFamily: 'Montserrat', fontSize: 20)))),
      home: HomePage(),
    );
  }
}
