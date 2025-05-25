
import 'package:flutter/material.dart';
import '../widget/exam_card.dart';
import './exam_detail_screen.dart';
import './exam_add_screen.dart';
import 'package:flutter/services.dart'; 

class ExamScreen extends StatelessWidget {
  final List<Map<String, String>> examList = [
    {
      'title': 'ComSci Exam',
      'date': 'May\n10',
      'students': '13',
      'section': 'BSCS 3A',
    },
    {
      'title': 'CS Elective 5 Exam',
      'date': 'May\n15',
      'students': '12',
      'section': 'BSCS 3B',
    },
    {
      'title': 'Soft Eng Exam',
      'date': 'May\n18',
      'students': '14',
      'section': 'BSCS 3A',
    },
    {
      'title': 'Valorant Exam',
      'date': 'May\n20',
      'students': '10',
      'section': 'BSCS 3C',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark, // 👈 forces dark icons (on light bg)
      child: Scaffold(
        appBar: AppBar(
          title: Text('Exams', style: TextStyle(fontWeight: FontWeight.bold)),
          backgroundColor: Colors.white,
          elevation: 0,
          foregroundColor:
              Colors.black, // 👈 also ensure appbar text is visible
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(1.0),
            child: Container(
              height: 1.0,
              color: const Color.fromARGB(255, 239, 239, 239),
            ),
          ),
        ),
        body: ListView(
          children: examList.map((exam) {
            return ExamCard(
              title: exam['title']!,
              date: exam['date']!,
              students: exam['students']!,
              section: exam['section']!,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ExamDetailScreen()),
                );
              },
            );
          }).toList(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ExamAddScreen()),
            );
          },
          backgroundColor: Colors.white,
          child: Icon(Icons.add, color: Colors.green),
        ),
      ),
    );
  }
}
