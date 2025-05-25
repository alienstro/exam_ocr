import 'package:flutter/material.dart';

class ClassesEditStudentScreen extends StatefulWidget {
  @override
  _ClassesEditStudentScreenState createState() => _ClassesEditStudentScreenState();
}

class _ClassesEditStudentScreenState extends State<ClassesEditStudentScreen> {
  final _nameController = TextEditingController(text: 'Robinx Phrynz Aquino');
  final _sexController = TextEditingController(text: 'Male');
  final _ageController = TextEditingController(text: '21');
  final _schoolController = TextEditingController(text: 'Gordon College');
  final _gradeController = TextEditingController(text: '3rd Year');
  final _birthdateController = TextEditingController(text: 'September 1, 2023');

  void _onCancel() {
    Navigator.pop(context);
  }

  void _onSave() {
    // TODO: Handle save logic
    Navigator.pop(context);
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 6),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Edit Student', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('+ Edit Student', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 14)),
          ],
        ),
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildTextField('Student Name', _nameController),
              _buildTextField('Sex', _sexController),
              _buildTextField('Age', _ageController),
              _buildTextField('School', _schoolController),
              _buildTextField('Grade', _gradeController),
              _buildTextField('Birthdate', _birthdateController),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: _onCancel,
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.green),
                ),
                child: Text('Cancel', style: TextStyle(color: Colors.green)),
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: ElevatedButton(
                onPressed: _onSave,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: Text('Save', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
