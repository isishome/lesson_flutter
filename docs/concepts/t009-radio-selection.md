# T-009 Radio 단일 선택 다루기

## 목표

이번 레슨은 여러 항목 중 하나만 선택하는 `Radio` 입력을 다룹니다. `Checkbox`는 여러 개를 동시에 선택할 수 있지만, `Radio`는 같은 그룹 안에서 하나만 선택하게 만들 때 사용합니다.

## 새로 등장한 클래스

### RadioGroup

`RadioGroup`은 Flutter SDK가 제공하는 위젯입니다. Flutter 3.44 기준으로 `RadioListTile`의 선택 상태는 `RadioGroup`이 관리하는 방식이 권장됩니다.

자주 쓰는 속성:

- `groupValue`: 현재 선택된 값
- `onChanged`: 그룹 안의 선택이 바뀌었을 때 실행할 함수
- `child`: 그룹에 포함할 radio 위젯들

현재 코드에서는 `_selectedPlan`이 `groupValue`입니다. 사용자가 `Premium`을 선택하면 `onChanged`가 실행되고, `setState()` 안에서 `_selectedPlan`이 `Premium`으로 바뀝니다.

### RadioListTile

`RadioListTile`은 라디오 버튼과 텍스트 라벨이 합쳐진 Material 위젯입니다. 사용자가 행 전체를 눌러 선택할 수 있어 연습용 UI로 보기 쉽습니다.

자주 쓰는 속성:

- `value`: 이 항목이 선택되었을 때 그룹에 전달할 값
- `title`: 화면에 보이는 라벨
- `selected`: ListTile 텍스트/스타일을 선택 상태처럼 보이게 할지 여부

현재 Flutter 버전에서는 `RadioListTile`에 `groupValue`와 `onChanged`를 직접 넣는 방식이 deprecated입니다. 대신 부모에 `RadioGroup`을 두고, 각 `RadioListTile`에는 `value`를 둡니다.

## 코드 흐름

```dart
String _selectedPlan = 'Basic';
```

처음 선택값을 정합니다.

```dart
RadioGroup<String>(
  groupValue: _selectedPlan,
  onChanged: _setSelectedPlan,
  child: Column(
    children: [
      RadioListTile<String>(
        title: Text('Basic'),
        value: 'Basic',
      ),
    ],
  ),
)
```

`RadioGroup`은 현재 선택값과 변경 함수를 갖고, `RadioListTile`은 자기 값만 갖습니다.

```dart
void _setSelectedPlan(String? value) {
  if (value == null) {
    return;
  }

  setState(() {
    _selectedPlan = value;
  });
}
```

`onChanged` 값은 nullable입니다. 실제 값이 들어오면 상태를 바꾸고, `setState()`가 화면을 다시 그립니다.

## 헷갈리기 쉬운 점

- `Radio`는 같은 그룹 안에서 하나만 선택됩니다.
- 여러 라디오가 서로 영향을 주려면 같은 `RadioGroup` 아래에 있어야 합니다.
- `value` 타입과 `RadioGroup<String>` 타입을 맞춰야 합니다.
- `selected`는 ListTile의 시각적 선택 스타일이고, 실제 선택 상태는 `RadioGroup.groupValue`가 결정합니다.
