# T-012 Dismissible로 스와이프 삭제 리스트 만들기

## 목표

이번 레슨은 리스트 항목을 옆으로 밀어서 삭제하는 패턴을 다룹니다. 사용자가 항목을 직접 누르는 대신 스와이프 동작으로 항목을 제거하고, 남은 항목 수와 삭제 결과를 화면에 표시합니다.

## 새로 등장한 클래스

### Dismissible

`Dismissible`은 Flutter SDK가 제공하는 위젯입니다. 자식 위젯을 감싸고, 사용자가 옆으로 밀었을 때 해당 항목을 사라지게 만들 수 있습니다.

자주 쓰는 속성:

- `key`: 항목을 구분하는 고유 값
- `background`: 오른쪽으로 밀 때 뒤에 보이는 위젯
- `secondaryBackground`: 왼쪽으로 밀 때 뒤에 보이는 위젯
- `onDismissed`: 스와이프가 완료된 뒤 실행할 함수
- `child`: 실제 화면에 보이는 리스트 항목

현재 코드에서는 각 할 일 문자열을 `ValueKey(task)`로 구분합니다. 스와이프가 끝나면 `onDismissed`에서 `_removeTask(task)`를 호출합니다.

### ListView.builder

`ListView.builder`는 항목 개수만큼 리스트 아이템을 만들어 주는 위젯입니다. 항목이 많거나 상태에 따라 개수가 바뀌는 리스트에 적합합니다.

자주 쓰는 속성:

- `itemCount`: 리스트 항목 개수
- `itemBuilder`: 각 인덱스에 어떤 위젯을 만들지 정하는 함수

현재 코드에서는 `_tasks.length`를 `itemCount`로 사용하고, 각 항목을 `Dismissible`로 감싼 `ListTile`로 표시합니다.

## 코드 흐름

```dart
final List<String> _tasks = ['Read docs', 'Write code', 'Run tests'];
String _lastRemoved = 'No item removed yet.';
```

삭제할 수 있는 리스트와 마지막으로 삭제된 항목 문구를 상태로 둡니다.

```dart
void _removeTask(String task) {
  setState(() {
    _tasks.remove(task);
    _lastRemoved = 'Removed: $task';
  });
}
```

항목을 삭제할 때는 리스트에서 값을 제거하고, 삭제 결과 문구를 갱신합니다.

```dart
Dismissible(
  key: ValueKey(task),
  onDismissed: (_) => _removeTask(task),
  child: ListTile(title: Text(task)),
)
```

`Dismissible`에는 반드시 안정적인 `key`가 필요합니다. 리스트 항목이 삭제되거나 순서가 바뀔 때 Flutter가 각 항목을 구분하기 위해 사용합니다.

## 헷갈리기 쉬운 점

- `Dismissible`은 `key`가 꼭 필요합니다. 같은 key를 여러 항목에 쓰면 안 됩니다.
- 스와이프 후 실제 데이터도 삭제해야 합니다. 화면에서만 사라지고 리스트 데이터가 그대로 남으면 다음 빌드에서 문제가 생깁니다.
- `background`와 `secondaryBackground`는 삭제 동작을 사용자에게 알려주는 시각적 힌트입니다.
- 리스트가 화면 안에서 남은 공간을 차지해야 할 때는 `Expanded` 안에 `ListView`를 넣습니다.
