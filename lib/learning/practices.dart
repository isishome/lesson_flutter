import 'package:first_flutter_app/learning/lessons.dart';
import 'package:first_flutter_app/learning/practice/practice_p001.dart';
import 'package:first_flutter_app/learning/practice/practice_p002.dart';
import 'package:first_flutter_app/learning/practice/practice_p003.dart';
import 'package:first_flutter_app/learning/practice/practice_p004.dart';

final List<LessonDefinition> practices = [
  LessonDefinition(
    id: 'P-001',
    title: 'Practice 001 앱 시작',
    summary: 'User practice screen',
    builder: (_) => const PracticeP001Screen(),
  ),
  LessonDefinition(
    id: 'P-002',
    title: '연습 002 Stateless 텍스트',
    summary: 'User practice screen',
    builder: (_) => const PracticeP002Screen(),
  ),
  LessonDefinition(
    id: 'P-003',
    title: '연습 003 Stateful 카운터',
    summary: 'User practice screen',
    builder: (_) => const PracticeP003Screen(),
  ),
  LessonDefinition(
    id: 'P-004',
    title: '연습 004 기본 레이아웃',
    summary: 'User practice screen',
    builder: (_) => const PracticeP004Screen(),
  ),
];
