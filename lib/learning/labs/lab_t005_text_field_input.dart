import 'package:flutter/material.dart';

class LabT005TextFieldInput extends StatefulWidget {
  const LabT005TextFieldInput({super.key});

  @override
  State<LabT005TextFieldInput> createState() => _LabT005TextFieldInputState();
}

class _LabT005TextFieldInputState extends State<LabT005TextFieldInput> {
  final TextEditingController _nameController = TextEditingController();
  String _name = '';

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _handleNameChanged(String value) {
    setState(() {
      _name = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final greeting = _name.isEmpty ? 'Type your name above.' : 'Hello, $_name';

    return Scaffold(
      appBar: AppBar(title: const Text('T-005 TextField Input')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('TextField receives keyboard input.'),
            const SizedBox(height: 12),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
                hintText: 'Enter your name',
              ),
              onChanged: _handleNameChanged,
            ),
            const SizedBox(height: 24),
            Text(greeting),
          ],
        ),
      ),
    );
  }
}
