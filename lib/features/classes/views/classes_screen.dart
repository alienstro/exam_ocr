import 'package:flutter/material.dart';
import './classes_detail_screen.dart';
import './classes_add_class.dart';

class ClassesScreen extends StatelessWidget {
  final List<Map<String, dynamic>> classList = [
    {'name': 'BSCS3A', 'students': 4},
    {'name': 'BSCS3B', 'students': 5},
    {'name': 'BSCS3C', 'students': 3},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Classes', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            height: 1.0,
            color: Color.fromARGB(255, 239, 239, 239),
          ),
        ),
      ),

      body: ListView.builder(
        itemCount: classList.length,
        itemBuilder: (context, index) {
          final classData = classList[index];
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  /// Left side: Title and subtitle
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          classData['name'],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(Icons.group, size: 16, color: Colors.grey),
                            SizedBox(width: 4),
                            Text('${classData['students']} Students'),
                          ],
                        ),
                      ],
                    ),
                  ),

                  /// Right side: View button
                  Material(
                    color: Colors.white,
                    shape: CircleBorder(),
                    elevation: 2,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ClassesDetailScreen(
                              className: classData['name'],
                            ),
                          ),
                        );
                      },
                      customBorder: CircleBorder(),
                      child: Container(
                        width: 50,
                        height: 50,
                        alignment: Alignment.center,
                        child: Text(
                          'View',
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => ClassesAddClassScreen()),
          );
        },
        backgroundColor: Colors.white,
        child: Icon(Icons.add, color: Colors.green),
      ),
    );
  }
}
