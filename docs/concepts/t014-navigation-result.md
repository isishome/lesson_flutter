# T-014 Navigator.pop으로 결과 돌려주기

## 목표

이번 레슨은 새 화면에서 값을 선택한 뒤 이전 화면으로 결과를 돌려주는 흐름을 다룹니다. T-013이 단순히 상세 화면으로 이동하는 구조였다면, T-014는 열린 화면이 닫힐 때 선택 결과를 부모 화면이 받아서 상태를 갱신합니다.

## 새로 등장한 개념

### Navigator.push의 반환값

`Navigator.push<T>()`는 새 route를 열고, 그 route가 닫힐 때 돌려준 값을 `Future<T?>`로 받습니다.

현재 코드에서는 색상 선택 화면을 열고 결과를 기다립니다.

```dart
final result = await Navigator.of(context).push<String>(
  MaterialPageRoute<String>(
    builder: (_) => const _ColorPickerScreen(),
  ),
);
```

`push<String>`은 이 route가 닫힐 때 `String` 결과를 받을 수 있다는 뜻입니다.

### Navigator.pop의 result

`Navigator.pop(context, result)`는 현재 화면을 닫으면서 이전 화면에 값을 돌려줍니다.

현재 코드에서는 색상 항목을 탭했을 때 선택한 색상 이름을 돌려줍니다.

```dart
onTap: () => Navigator.of(context).pop(color),
```

부모 화면은 `await`로 받은 값을 확인하고 상태를 갱신합니다.

```dart
if (result == null) {
  return;
}

setState(() {
  _selectedColor = 'Selected color: $result';
});
```

뒤로가기 버튼으로 닫으면 선택 결과가 없으므로 `result`는 `null`입니다. 이 경우 기존 선택값을 유지합니다.

## 코드 흐름

1. 부모 화면에서 `Choose color` 버튼을 누릅니다.
2. `Navigator.push<String>()`으로 색상 선택 화면을 엽니다.
3. 색상 선택 화면에서 `Green` 같은 항목을 탭합니다.
4. 선택 화면이 `Navigator.pop(context, 'Green')`으로 닫힙니다.
5. 부모 화면의 `await`가 끝나고 `Selected color: Green`으로 상태가 바뀝니다.

## 헷갈리기 쉬운 점

- `push`는 즉시 결과를 돌려주는 것이 아니라 `Future`를 돌려줍니다.
- 결과값을 쓰려면 `await`가 필요합니다.
- 사용자가 뒤로가기만 하면 결과가 없으므로 `null`을 처리해야 합니다.
- `push<String>`과 `MaterialPageRoute<String>`의 타입은 `pop`으로 돌려줄 결과 타입과 맞추는 것이 좋습니다.
