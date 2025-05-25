import 'package:flutter/material.dart';

class ExamAnswerKeyScreen extends StatefulWidget {
  @override
  _AnswerKeyScreenState createState() => _AnswerKeyScreenState();
}

class _AnswerKeyScreenState extends State<ExamAnswerKeyScreen> {
  // Store selected answers: { "A1": 1, "B3": 4, ... }
  Map<String, int?> _answers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: Text('ComSci Answer Key', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(height: 1, color: Colors.black12),
        ),
      ),

      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                _buildSection('A'),
                _buildSection('B'),
                _buildSection('C'),
                _buildSection('D'),
                _buildSection('E'),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      setState(() => _answers.clear());
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.green),
                    ),
                    child: Text('Reset', style: TextStyle(color: Colors.green)),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: Save logic
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    child: Text('Save', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  /// Builds a section (e.g. A1–A12)
  Widget _buildSection(String letter) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(12, (index) {
        String key = "$letter${index + 1}";
        return _buildAnswerRow(key);
      }),
    );
  }

  /// Builds a row like: A1 [1][2][3]...[8]
  Widget _buildAnswerRow(String questionId) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Row(
        children: [
          Container(
            width: 40,
            child: Text(questionId, style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: List.generate(8, (index) {
                final choice = index + 1;
                final isSelected = _answers[questionId] == choice;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _answers[questionId] = choice;
                    });
                  },
                  child: Container(
                    width: 32,
                    height: 32,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.green : Colors.grey.shade300,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '$choice',
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
