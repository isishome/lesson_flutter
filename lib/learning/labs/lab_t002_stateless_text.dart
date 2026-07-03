import 'package:flutter/material.dart';

class LabT002StatelessText extends StatelessWidget {
  const LabT002StatelessText({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('T-002 StatelessWidget')),
      body: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Hello, Flutter!'),
            SizedBox(height: 12),
            Text('This screen is a StatelessWidget.'),
            SizedBox(height: 12),
            Text('Text widgets show fixed content.'),
          ],
        ),
      ),
    );
  }
}
