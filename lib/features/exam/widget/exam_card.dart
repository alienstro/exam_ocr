import 'package:flutter/material.dart';

class ExamCard extends StatelessWidget {
  final String title, date, students, section;
  final VoidCallback onTap;

  const ExamCard({
    required this.title,
    required this.date,
    required this.students,
    required this.section,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(12),
      color: Colors.white,
      child: ListTile(
        leading: Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: Colors.green.shade100,
            borderRadius: BorderRadius.circular(12), // 👈 Rounded rectangle
          ),
          alignment: Alignment.center,
          child: Text(
            date,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.green.shade800,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Row(
          children: [
            Icon(Icons.computer, size: 16),
            SizedBox(width: 4),
            Text(students),
            SizedBox(width: 12),
            Icon(Icons.group, size: 16),
            SizedBox(width: 4),
            Text(section),
          ],
        ),
        trailing: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(100),
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              // border: Border.all(color: Colors.purple),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 2,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            alignment: Alignment.center,
            child: Text(
              'View',
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
