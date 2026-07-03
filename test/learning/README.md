# Learning Tests

학습 실습에 붙이는 테스트를 모으는 공간입니다.

## 권장 구조

```text
test/learning/
  lab_t001_counter_basics_test.dart
  lab_t002_layout_constraints_test.dart
  lab_t003_todo_state_test.dart
```

## 작성 규칙

- 순수 Dart 로직은 일반 `test`로 검증합니다.
- 화면 동작은 `testWidgets`로 검증합니다.
- 테스트 이름은 사용자가 기대하는 동작으로 씁니다.

예:

```dart
testWidgets('tap increments the counter text', (tester) async {
  // arrange
  // act
  // assert
});
```

