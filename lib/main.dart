import 'package:flutter/material.dart';
import 'modules/auth/login.page.dart';
import 'modules/teste/amazon.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Amazon(),
    );
  }
}