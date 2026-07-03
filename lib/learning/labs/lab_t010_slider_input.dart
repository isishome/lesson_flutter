import 'package:flutter/material.dart';

class LabT010SliderInput extends StatefulWidget {
  const LabT010SliderInput({super.key});

  @override
  State<LabT010SliderInput> createState() => _LabT010SliderInputState();
}

class _LabT010SliderInputState extends State<LabT010SliderInput> {
  double _volume = 40;

  void _setVolume(double value) {
    setState(() {
      _volume = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final roundedVolume = _volume.round();

    return Scaffold(
      appBar: AppBar(title: const Text('T-010 Slider Input')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Slider selects a number within a range.'),
            const SizedBox(height: 24),
            Text('Volume: $roundedVolume'),
            Slider(
              value: _volume,
              min: 0,
              max: 100,
              divisions: 10,
              label: '$roundedVolume',
              onChanged: _setVolume,
            ),
            const SizedBox(height: 16),
            Text('Selected volume: $roundedVolume'),
          ],
        ),
      ),
    );
  }
}
