import 'package:flutter/material.dart';

class LabT003StatefulCounter extends StatefulWidget {
  const LabT003StatefulCounter({super.key});

  @override
  State<LabT003StatefulCounter> createState() => _LabT003StatefulCounterState();
}

class _LabT003StatefulCounterState extends State<LabT003StatefulCounter> {
  int _count = 0;

  void _increment() {
    setState(() {
      _count = _count + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('T-003 StatefulWidget')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Button taps change state.'),
            const SizedBox(height: 12),
            Text('Count: $_count'),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _increment,
              child: const Text('Add one!'),
            ),
          ],
        ),
      ),
    );
  }
}
