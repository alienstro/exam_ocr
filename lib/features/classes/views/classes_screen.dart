import 'package:flutter/material.dart';

class ClassesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text('Classes', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: const Color.fromARGB(255, 239, 239, 239),
            height: 1.0,
          ),
        ),
      ),
      body: Center(child: Text('Classes tab')),
    );
  }
}
