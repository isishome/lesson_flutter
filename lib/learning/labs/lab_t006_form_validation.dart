import 'package:flutter/material.dart';

class LabT006FormValidation extends StatefulWidget {
  const LabT006FormValidation({super.key});

  @override
  State<LabT006FormValidation> createState() => _LabT006FormValidationState();
}

class _LabT006FormValidationState extends State<LabT006FormValidation> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  String _submittedName = '';

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  String? _validateName(String? value) {
    final text = value?.trim() ?? '';

    if (text.isEmpty) {
      return 'Name is required.';
    }

    if (text.length < 2) {
      return 'Name must be at least 2 characters.';
    }

    return null;
  }

  void _submit() {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) {
      setState(() {
        _submittedName = '';
      });
      return;
    }

    setState(() {
      _submittedName = _nameController.text.trim();
    });
  }

  @override
  Widget build(BuildContext context) {
    final result = _submittedName.isEmpty
        ? 'Submit the form to see the result.'
        : 'Submitted: $_submittedName';

    return Scaffold(
      appBar: AppBar(title: const Text('T-006 Form Validation')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('Form validates input before submit.'),
              const SizedBox(height: 12),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                  hintText: 'At least 2 characters',
                ),
                validator: _validateName,
              ),
              const SizedBox(height: 16),
              ElevatedButton(onPressed: _submit, child: const Text('Submit')),
              const SizedBox(height: 24),
              Text(result),
            ],
          ),
        ),
      ),
    );
  }
}
