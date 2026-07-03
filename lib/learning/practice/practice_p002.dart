import 'package:flutter/material.dart';

class PracticeP002Screen extends StatelessWidget {
  const PracticeP002Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('연습 002 Stateless 텍스트')),
      body: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('안녕 플러터'),
            SizedBox(height: 12),
            Text('이 화면은 StatelessWidget 이야'),
            SizedBox(height: 12),
            Text('텍스트 위젯은 고정된 컨텐츠를 보여준다.'),
          ],
        ),
      ),
    );
  }
}
