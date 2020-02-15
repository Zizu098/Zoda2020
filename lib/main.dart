import 'package:flutter/material.dart';
import 'package:zoda/setup/startPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ZODA',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: myApp(),
    );
  }
}
