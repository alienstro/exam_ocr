import 'package:flutter/material.dart';
import 'navigation/bottom_nav.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exam App',
      theme: ThemeData(primarySwatch: Colors.green, scaffoldBackgroundColor: Colors.white),
      home: BottomNavScreen(),
    );
  }
}
