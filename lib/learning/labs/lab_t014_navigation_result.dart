import 'package:flutter/material.dart';

class LabT014NavigationResult extends StatefulWidget {
  const LabT014NavigationResult({super.key});

  @override
  State<LabT014NavigationResult> createState() =>
      _LabT014NavigationResultState();
}

class _LabT014NavigationResultState extends State<LabT014NavigationResult> {
  String _selectedColor = 'No color selected.';

  Future<void> _openColorPicker() async {
    final result = await Navigator.of(context).push<String>(
      MaterialPageRoute<String>(builder: (_) => const _ColorPickerScreen()),
    );

    if (result == null) {
      return;
    }

    setState(() {
      _selectedColor = 'Selected color: $result';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('T-014 Navigation Result')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Open a screen and wait for the selected result.'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _openColorPicker,
              child: const Text('Choose color'),
            ),
            const SizedBox(height: 24),
            Text(_selectedColor),
          ],
        ),
      ),
    );
  }
}

class _ColorPickerScreen extends StatelessWidget {
  const _ColorPickerScreen();

  static const List<String> _colors = ['Red', 'Green', 'Blue'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Choose a Color')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: _colors.length,
        separatorBuilder: (_, _) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          final color = _colors[index];

          return Card(
            child: ListTile(
              title: Text(color),
              trailing: const Icon(Icons.check),
              onTap: () => Navigator.of(context).pop(color),
            ),
          );
        },
      ),
    );
  }
}
