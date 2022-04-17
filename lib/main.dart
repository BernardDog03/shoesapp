import 'package:flutter/material.dart';
import 'package:shoes_app/MainScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sneakers.co.id',
      theme: ThemeData(),
      home: MainScreen(),
    );
  }
}
