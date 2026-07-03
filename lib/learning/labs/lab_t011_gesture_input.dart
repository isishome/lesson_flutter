import 'package:flutter/material.dart';

class LabT011GestureInput extends StatefulWidget {
  const LabT011GestureInput({super.key});

  @override
  State<LabT011GestureInput> createState() => _LabT011GestureInputState();
}

class _LabT011GestureInputState extends State<LabT011GestureInput> {
  String _lastGesture = 'No gesture yet.';
  int _gestureCount = 0;

  void _recordGesture(String gesture) {
    setState(() {
      _lastGesture = gesture;
      _gestureCount += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('T-011 Gesture Input')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('GestureDetector listens for raw pointer gestures.'),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () => _recordGesture('GestureDetector tap'),
              onDoubleTap: () => _recordGesture('GestureDetector double tap'),
              onLongPress: () => _recordGesture('GestureDetector long press'),
              child: Container(
                height: 120,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text('Tap, double tap, or long press this box'),
              ),
            ),
            const SizedBox(height: 24),
            const Text('InkWell adds a Material tap effect.'),
            const SizedBox(height: 16),
            Material(
              color: Colors.green.shade50,
              borderRadius: BorderRadius.circular(8),
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () => _recordGesture('InkWell tap'),
                child: Container(
                  height: 72,
                  alignment: Alignment.center,
                  child: const Text('Tap this InkWell area'),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text('Last gesture: $_lastGesture'),
            Text('Gesture count: $_gestureCount'),
          ],
        ),
      ),
    );
  }
}
