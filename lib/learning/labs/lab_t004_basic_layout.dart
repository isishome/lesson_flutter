import 'package:flutter/material.dart';

class LabT004BasicLayout extends StatelessWidget {
  const LabT004BasicLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('T-004 Basic Layout')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Column places widgets vertically.'),
            const SizedBox(height: 12),
            const Text('Row places widgets horizontally.'),
            const SizedBox(height: 24),
            Row(
              children: const [
                Expanded(
                  child: _LayoutTile(label: 'One', color: Colors.teal),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: _LayoutTile(label: 'Two', color: Colors.indigo),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: _LayoutTile(label: 'Three', color: Colors.deepOrange),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text('Expanded shares the available width.'),
          ],
        ),
      ),
    );
  }
}

class _LayoutTile extends StatelessWidget {
  const _LayoutTile({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      alignment: Alignment.center,
      color: color,
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
