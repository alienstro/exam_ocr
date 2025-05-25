import 'package:flutter/material.dart';
import './exam_result_screen.dart';

class ExamScanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: Text('Scan', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(height: 1, color: Colors.black12),
        ),
      ),

      body: Stack(
        children: [
          // Image in center
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              child: Image.asset(
                'assets/images/sample_scan.jpg',
                fit: BoxFit.contain,
              ),
            ),
          ),

          // Camera button at bottom center
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: FloatingActionButton(
                onPressed: () {
                  // TODO: Open camera or start scan

                  // Navigate to exam_result_screen.dart for now
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => ExamResultScreen()),
                  );
                },
                backgroundColor: Colors.white,
                elevation: 4,
                child: Icon(Icons.camera_alt, color: Colors.green),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
