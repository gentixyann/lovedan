import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import './screens/top_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LoveDan',
      theme: ThemeData(
        primaryColor: Colors.pink[50],
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('start'),
      ),
    );
  }
}
