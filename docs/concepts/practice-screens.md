# Practice Screens

`lib/learning/practice/`는 사용자가 직접 작성하는 연습 화면을 두는 공간입니다. 앱 메인 화면의 `Practice` 섹션에서 레슨과 같은 방식으로 접근할 수 있습니다.

## 현재 구조

```text
lib/learning/practice/
  practice_p001.dart
  practices.dart
```

## practice 파일 만들기

예:

```dart
import 'package:flutter/material.dart';

class PracticeP002Screen extends StatelessWidget {
  const PracticeP002Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Practice 002')),
      body: const Center(child: Text('My practice')),
    );
  }
}
```

권장 규칙:

- 파일명: `practice_p001.dart`, `practice_p002.dart`처럼 번호를 붙입니다.
- 클래스명: `PracticeP001Screen`, `PracticeP002Screen`처럼 파일 번호와 맞춥니다.
- 화면에서 돌아올 수 있도록 `Scaffold.appBar`를 둡니다.

## registry에 등록하기

Dart/Flutter는 런타임에 폴더의 `.dart` 파일을 자동 import하지 않습니다. 그래서 새 practice 파일을 만들면 `practices.dart`에 직접 등록해야 합니다.

```dart
import 'package:first_flutter_app/learning/practice/practice_p002.dart';

final List<LessonDefinition> practices = [
  LessonDefinition(
    id: 'P-002',
    title: 'Practice 002',
    summary: 'My custom practice',
    builder: (_) => const PracticeP002Screen(),
  ),
];
```

등록하면 메인 화면의 `Practice` 섹션에 버튼이 나타납니다.

## 화면 이동

Practice 버튼도 Lesson 버튼과 같은 구조를 사용합니다.

```text
Practice 버튼 클릭
  -> Navigator.push
  -> builder가 practice 화면 생성
  -> AppBar back 버튼으로 홈 복귀
```

## 주의할 점

- `build()` 안에서는 화면 위젯을 `return`해야 합니다.
- `throw Scaffold(...)`처럼 쓰면 화면 진입 시 예외가 발생합니다.
- 새 practice 파일을 만들고 registry에 등록하지 않으면 UI에 표시되지 않습니다.


