# T-008 DropdownButton으로 선택 입력 다루기

## 목표

이번 레슨은 여러 선택지 중 하나를 고르는 입력을 다룹니다. 텍스트를 직접 입력하는 `TextField`와 달리, 드롭다운은 미리 정한 목록에서 하나만 선택하게 할 때 사용합니다.

## 새로 등장한 클래스

### DropdownButtonFormField

`DropdownButtonFormField`는 Flutter SDK가 제공하는 Material 입력 위젯입니다. 폼 필드처럼 보이는 드롭다운을 만들고, 처음 표시할 선택값을 `initialValue`로 받습니다.

자주 쓰는 속성:

- `initialValue`: 처음 표시할 선택값
- `items`: 사용자가 고를 수 있는 선택지 목록
- `onChanged`: 선택이 바뀌었을 때 실행할 함수
- `decoration`: `InputDecoration`으로 테두리, 라벨 등을 지정

현재 코드에서는 `_selectedLevel`이 `initialValue`입니다. 사용자가 다른 항목을 선택하면 `onChanged`가 실행되고, `setState()` 안에서 `_selectedLevel`을 새 값으로 바꿉니다.

### DropdownMenuItem

`DropdownMenuItem`은 드롭다운 안에 들어가는 항목 하나입니다.

자주 쓰는 속성:

- `value`: 이 항목이 선택되었을 때 상태에 저장될 값
- `child`: 화면에 보이는 위젯, 보통 `Text`

현재 코드에서는 `Beginner`, `Intermediate`, `Advanced` 문자열 각각을 `DropdownMenuItem<String>`으로 변환합니다.

## 코드 흐름

```dart
String _selectedLevel = 'Beginner';
```

처음 선택값을 정합니다. 이 값은 반드시 `items` 안에 있는 값 중 하나여야 합니다.

```dart
DropdownButtonFormField<String>(
  initialValue: _selectedLevel,
  items: _levels.map(...).toList(),
  onChanged: _setSelectedLevel,
)
```

`initialValue`는 처음 표시할 선택 상태이고, `items`는 선택 가능한 목록입니다. `onChanged`는 새 값이 들어오는 통로입니다.

```dart
void _setSelectedLevel(String? value) {
  if (value == null) {
    return;
  }

  setState(() {
    _selectedLevel = value;
  });
}
```

`onChanged`의 값은 nullable입니다. 그래서 `null`이면 무시하고, 실제 문자열이 들어오면 `setState()`로 상태를 바꿉니다.

## 헷갈리기 쉬운 점

- `items`에 없는 값을 `initialValue`로 넣으면 오류가 납니다.
- `DropdownMenuItem<String>`과 `DropdownButtonFormField<String>`처럼 타입을 맞추는 것이 좋습니다.
- `onChanged`에서 변수만 바꾸고 `setState()`를 호출하지 않으면 화면이 갱신되지 않습니다.
- `DropdownButtonFormField`는 `Form`과 함께 쓸 수 있지만, 이번 레슨에서는 선택 입력 자체에 집중합니다.



