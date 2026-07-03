import 'package:flutter/material.dart';

class PracticeP001Screen extends StatelessWidget {
  const PracticeP001Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('연습 001 앱 시작')),
      body: const Center(
        child: Text(
          '안녕 여긴 내 첫 플러터 연습화면이야!',
          style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
