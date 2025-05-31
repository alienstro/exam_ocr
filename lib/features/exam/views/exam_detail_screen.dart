import 'package:exam_ocr/features/exam/views/exam_exam_results_screen.dart';
import 'package:flutter/material.dart';
import './exam_scan_screen.dart';
import './exam_answerskey_screen.dart';
import './exam_result_screen.dart';

class ExamDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('ComSci', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(height: 1, color: Colors.black12),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Top Card Row
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Date
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'May\n10',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.green.shade900,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: 12),

                  // Title & details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ComSci Exam',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(Icons.computer, size: 16, color: Colors.grey),
                            SizedBox(width: 4),
                            Text('13'),
                            SizedBox(width: 12),
                            Icon(Icons.group, size: 16, color: Colors.grey),
                            SizedBox(width: 4),
                            Text('BSCS 3A'),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Scan Button
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to exam_scan_screen.dart
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => ExamScanScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 10,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Scan',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 24),

            /// Management Title
            Text('Management', style: TextStyle(fontWeight: FontWeight.bold)),

            SizedBox(height: 12),

            /// Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildActionButton(
                  icon: Icons.key,
                  label: 'Answer Key',
                  onTap: () {
                    // Navigate to exam_answerkey_screen.dart
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => ExamAnswerKeyScreen()),
                    );
                  },
                ),
                SizedBox(width: 24),
                _buildActionButton(
                  icon: Icons.bar_chart,
                  label: 'Results',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => ExamResultScreenStudents()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(30),
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Icon(icon, color: Colors.green),
          ),
        ),
        SizedBox(height: 8),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}
