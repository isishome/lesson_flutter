import 'package:flutter/material.dart';

class LabT001AppEntry extends StatelessWidget {
  const LabT001AppEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('T-001 App Entry')),
      body: const Center(child: Text('Hello, Flutter!')),
    );
  }
}
