import 'package:flutter/material.dart';

class ExamAddScreen extends StatefulWidget {
  @override
  _ExamAddScreenState createState() => _ExamAddScreenState();
}

class _ExamAddScreenState extends State<ExamAddScreen> {
  String? _selectedClass;
  String? _selectedType;
  DateTime? _selectedDate;
  final _examNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Add Exam', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            height: 1.0,
            color: Color(0xFFEFEFEF),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Class Name Dropdown
            _buildLabel('Class Name'),
            _buildDropdown(
              value: _selectedClass,
              items: ['BSCS 3A', 'BSCS 3B'],
              onChanged: (val) => setState(() => _selectedClass = val),
            ),

            SizedBox(height: 16),

            // Exam Name
            _buildLabel('Exam Name'),
            TextField(
              controller: _examNameController,
              decoration: _inputDecoration(),
            ),

            SizedBox(height: 16),

            // Exam Date with calendar icon
            _buildLabel('Exam Date'),
            GestureDetector(
              onTap: () => _selectDate(context),
              child: AbsorbPointer(
                child: TextField(
                  decoration: _inputDecoration(
                    suffixIcon: Icon(Icons.calendar_today, color: Colors.green),
                    hintText: _selectedDate != null
                        ? "${_selectedDate!.month}/${_selectedDate!.day}/${_selectedDate!.year}"
                        : '',
                  ),
                ),
              ),
            ),

            SizedBox(height: 16),

            // Exam Type Dropdown
            _buildLabel('Type'),
            _buildDropdown(
              value: _selectedType,
              items: ['OLSAT', 'RAVEN'],
              onChanged: (val) => setState(() => _selectedType = val),
            ),

            Spacer(),

            // Buttons Row
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.green),
                    ),
                    child: Text('Cancel', style: TextStyle(color: Colors.green)),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Save logic
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: Text('Save'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Label for form fields
  Widget _buildLabel(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(text, style: TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  // Dropdown form field
  Widget _buildDropdown({
    String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      onChanged: onChanged,
      items: items
          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
          .toList(),
      decoration: _inputDecoration(),
    );
  }

  // Common input decoration
  InputDecoration _inputDecoration({Widget? suffixIcon, String? hintText}) {
    return InputDecoration(
      hintText: hintText,
      suffixIcon: suffixIcon,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
    );
  }

  // Date picker logic
  Future<void> _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) setState(() => _selectedDate = picked);
  }
}
