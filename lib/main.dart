import 'package:flutter/material.dart';
import 'package:tedx_app/HomePage/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final Widget _home = HomePage();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: _home,
        routes: <String, WidgetBuilder>{
          '/home': (BuildContext context) => HomePage(),

        });
  }
}