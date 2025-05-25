import 'package:flutter/material.dart';
import './classes_add_student.dart';
import './classes_edit_student.dart';

class ClassesDetailScreen extends StatefulWidget {
  final String className;

  ClassesDetailScreen({this.className = 'BSCS 3A CLASS'});

  @override
  _ClassesDetailScreenState createState() => _ClassesDetailScreenState();
}

class _ClassesDetailScreenState extends State<ClassesDetailScreen> {
  List<Map<String, String>> students = [
    {'name': 'Robinx Phrynz Aquino'},
    {'name': 'Jane Dela Cruz'},
    {'name': 'Michael Santos'},
    {'name': 'Alyssa Reyes'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: Text(
          widget.className,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
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

          ...students.asMap().entries.map((entry) {
            int index = entry.key;
            String name = entry.value['name']!;
            final initial = name[0].toUpperCase();

            return ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.green.shade100,
                child: Text(initial, style: TextStyle(color: Colors.black)),
              ),
              title: Text(name),
              trailing: Theme(
                data: Theme.of(context).copyWith(cardColor: Colors.white),
                child: PopupMenuButton<String>(
                  icon: Icon(Icons.more_vert, color: Colors.green),
                  onSelected: (value) {
                    if (value == 'edit') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ClassesEditStudentScreen(),
                        ),
                      );
                    } else if (value == 'delete') {
                      // _deleteStudent(index);
                    }
                  },
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 'edit',
                      child: Center(child: Text('Edit')),
                    ),
                    PopupMenuItem(
                      value: 'delete',
                      child: Center(child: Text('Delete')),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => ClassesAddStudentScreen()),
          );
        },
        backgroundColor: Colors.white,
        child: Icon(Icons.add, color: Colors.green),
      ),
    );
  }
}
