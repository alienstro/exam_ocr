import 'package:flutter/material.dart';

class ExamResultScreenStudents extends StatelessWidget {
  final List<Map<String, dynamic>> students = [
    {'name': 'Robinx Phrynz Aquino', 'score': 45, 'total': 60},
    {'name': 'Robinx Phrynz Aquino', 'score': 45, 'total': 60},
    {'name': 'Robinx Phrynz Aquino', 'score': 45, 'total': 60},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Text(
          'ComSci Exam Results',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(height: 1.0, color: Colors.black12),
        ),
      ),

      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
            child: Text(
              'Students (${students.length})',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ...students.map((student) {
            String name = student['name'];
            int score = student['score'];
            int total = student['total'];
            String initial = name[0].toUpperCase();

            return ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.green.shade100,
                child: Text(initial, style: TextStyle(color: Colors.black)),
              ),
              title: Text(name),
              trailing: Text(
                '$score / $total',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
