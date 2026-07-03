import 'package:flutter/material.dart';

class LabT008DropdownSelection extends StatefulWidget {
  const LabT008DropdownSelection({super.key});

  @override
  State<LabT008DropdownSelection> createState() =>
      _LabT008DropdownSelectionState();
}

class _LabT008DropdownSelectionState extends State<LabT008DropdownSelection> {
  final List<String> _levels = const ['Beginner', 'Intermediate', 'Advanced'];
  String _selectedLevel = 'Beginner';

  void _setSelectedLevel(String? value) {
    if (value == null) {
      return;
    }

    setState(() {
      _selectedLevel = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('T-008 Dropdown Selection')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('DropdownButton lets the user choose one option.'),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              initialValue: _selectedLevel,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Level',
              ),
              items: _levels
                  .map(
                    (level) => DropdownMenuItem<String>(
                      value: level,
                      child: Text(level),
                    ),
                  )
                  .toList(),
              onChanged: _setSelectedLevel,
            ),
            const SizedBox(height: 24),
            Text('Selected level: $_selectedLevel'),
          ],
        ),
      ),
    );
  }
}
