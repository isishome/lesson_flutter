import 'package:flutter/material.dart';

class LabT009RadioSelection extends StatefulWidget {
  const LabT009RadioSelection({super.key});

  @override
  State<LabT009RadioSelection> createState() => _LabT009RadioSelectionState();
}

class _LabT009RadioSelectionState extends State<LabT009RadioSelection> {
  String _selectedPlan = 'Basic';

  void _setSelectedPlan(String? value) {
    if (value == null) {
      return;
    }

    setState(() {
      _selectedPlan = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('T-009 Radio Selection')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Radio selects one option from a group.'),
            const SizedBox(height: 12),
            RadioGroup<String>(
              groupValue: _selectedPlan,
              onChanged: _setSelectedPlan,
              child: Column(
                children: [
                  RadioListTile<String>(
                    title: const Text('Basic'),
                    value: 'Basic',
                    selected: _selectedPlan == 'Basic',
                  ),
                  RadioListTile<String>(
                    title: const Text('Standard'),
                    value: 'Standard',
                    selected: _selectedPlan == 'Standard',
                  ),
                  RadioListTile<String>(
                    title: const Text('Premium'),
                    value: 'Premium',
                    selected: _selectedPlan == 'Premium',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Text('Selected plan: $_selectedPlan'),
          ],
        ),
      ),
    );
  }
}
