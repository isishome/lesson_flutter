import 'package:flutter/material.dart';

class PracticeP003Screen extends StatefulWidget {
  const PracticeP003Screen({super.key});

  @override
  State<PracticeP003Screen> createState() => _PriacticeP003ScreenState();
}

class _PriacticeP003ScreenState extends State<PracticeP003Screen> {
  int _count = 0;

  void _increment() {
    setState(() {
      _count = _count + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('연습 003 Stateful 카운터')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('버튼을 탭하면 상태가 바뀝니다.'),
            const SizedBox(height: 12),
            Text('카운트: $_count'),
            const SizedBox(height: 12),
            ElevatedButton(onPressed: _increment, child: const Text('더하기 1!')),
          ],
        ),
      ),
    );
  }
}
