import 'package:flutter/material.dart';
import '../widget/exam_card.dart';

class ExamScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exams', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: const Color.fromARGB(255, 239, 239, 239),
            height: 1.0,
          ),
        ),
      ),

      body: ListView(
        children: [
          ExamCard(
            title: 'ComSci Exam',
            date: 'May\n10',
            students: '13',
            section: 'BSCS 3A',
            onTap: () {}, // Navigate to detail
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.white,
        child: Icon(Icons.add, color: Colors.green),
      ),
    );
  }
}
