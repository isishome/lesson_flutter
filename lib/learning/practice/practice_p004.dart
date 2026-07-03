import 'package:flutter/material.dart';

class PracticeP004Screen extends StatelessWidget {
  const PracticeP004Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('연습 004 기본 레이아웃')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Column은 위젯들을 세로로 배치합니다.'),
            const SizedBox(height: 12),
            const Text('Row는 위젯들을 가로로 배치합니다.'),
            const SizedBox(height: 24),
            Row(
              children: const [
                Expanded(
                  child: _LayoutTile(label: '첫 번째', color: Colors.lightBlue),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: _LayoutTile(label: '두 번째', color: Colors.blueAccent),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: _LayoutTile(label: '세 번째', color: Colors.indigo),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text('Expanded는 사용 가능한 너비를 공유합니다.'),
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
