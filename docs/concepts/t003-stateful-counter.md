# T-003 StatefulWidget and setState

T-003은 버튼을 눌렀을 때 화면 값이 바뀌는 구조를 다룹니다. 핵심은 `StatefulWidget`, `State`, 상태 변수, `setState()`입니다.

## 코드 구조

```text
main.dart
  MyApp
    MaterialApp
      home: LabT003StatefulCounter

lab_t003_stateful_counter.dart
  LabT003StatefulCounter extends StatefulWidget
    createState()
      _LabT003StatefulCounterState extends State
        _count
        _increment()
        build()
          Scaffold
            appBar: AppBar
              title: Text
            body: Center
              child: Column
                children:
                  Text
                  SizedBox
                  Text('Count: $_count')
                  SizedBox
                  ElevatedButton
                    onPressed: _increment
                    child: Text
```

## 직접 만든 클래스: LabT003StatefulCounter

`LabT003StatefulCounter`는 우리가 직접 만든 상태 있는 화면 위젯입니다.

```dart
class LabT003StatefulCounter extends StatefulWidget {
  const LabT003StatefulCounter({super.key});

  @override
  State<LabT003StatefulCounter> createState() => _LabT003StatefulCounterState();
}
```

역할:

- T-003 실습 화면을 대표합니다.
- 실제 상태 값은 별도의 `State` 클래스가 가집니다.
- `createState()`로 상태 객체를 연결합니다.

## StatefulWidget

`StatefulWidget`은 화면이 바뀌는 위젯을 만들 때 사용합니다.

적합한 경우:

- 버튼을 누르면 숫자가 바뀜
- 입력 필드에 글자를 입력함
- 체크박스를 켜고 끔
- 탭 선택 상태가 바뀜

T-003에서는 버튼을 누를 때 `Count` 값이 바뀌므로 `StatefulWidget`을 사용합니다.

## State

`State`는 `StatefulWidget`의 바뀌는 값을 보관하고 화면을 그립니다.

```dart
class _LabT003StatefulCounterState extends State<LabT003StatefulCounter> {
  int _count = 0;

  void _increment() {
    setState(() {
      _count = _count + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(...);
  }
}
```

역할:

- `_count` 같은 상태 변수를 보관합니다.
- 버튼을 눌렀을 때 상태를 바꿉니다.
- `build()`에서 현재 상태를 화면에 표시합니다.

## 상태 변수 _count

```dart
int _count = 0;
```

의미:

- 화면에 표시할 숫자 상태입니다.
- 처음 값은 0입니다.
- `_increment()`가 호출될 때마다 1씩 증가합니다.

Dart에서 이름 앞의 `_`는 같은 라이브러리 파일 안에서만 쓰겠다는 의미입니다.

## _increment()

```dart
void _increment() {
  setState(() {
    _count = _count + 1;
  });
}
```

역할:

- 버튼을 눌렀을 때 실행됩니다.
- `_count` 값을 증가시킵니다.
- `setState()`를 호출해 화면 갱신을 요청합니다.

## setState()

`setState()`는 상태가 바뀌었으니 화면을 다시 그리라고 Flutter에 알려주는 메서드입니다.

```dart
setState(() {
  _count = _count + 1;
});
```

흐름:

1. `_count` 값이 바뀝니다.
2. Flutter가 `build()`를 다시 실행합니다.
3. `Text('Count: $_count')`가 새 값으로 표시됩니다.

주의:

- `_count`만 바꾸고 `setState()`를 호출하지 않으면 화면이 갱신되지 않습니다.
- 화면에 영향을 주는 상태 변경을 `setState()` 안에 넣습니다.

## Scaffold

T-003의 `Scaffold`는 화면 뼈대를 만듭니다.

```dart
return Scaffold(
  appBar: AppBar(title: const Text('T-003 StatefulWidget')),
  body: Center(...),
);
```

역할:

- `appBar`에는 화면 제목을 넣습니다.
- `body`에는 카운터 UI를 넣습니다.

## AppBar

```dart
appBar: AppBar(title: const Text('T-003 StatefulWidget')),
```

역할:

- 화면 상단에 현재 실습 이름을 보여줍니다.

## Center

```dart
body: Center(
  child: Column(...),
),
```

역할:

- `Column`을 화면 중앙에 배치합니다.

## Column

`Column`은 여러 위젯을 세로로 배치합니다.

```dart
Column(
  mainAxisSize: MainAxisSize.min,
  children: [
    const Text('Button taps change state.'),
    const SizedBox(height: 12),
    Text('Count: $_count'),
    const SizedBox(height: 12),
    ElevatedButton(...),
  ],
)
```

역할:

- 설명 텍스트, 카운트 텍스트, 버튼을 위에서 아래로 배치합니다.

## Text('Count: $_count')

```dart
Text('Count: $_count')
```

의미:

- `_count` 상태 값을 문자열 안에 넣어 표시합니다.
- `_count`가 바뀌면 `setState()` 이후 이 텍스트도 바뀝니다.

주의:

- `_count` 값에 따라 바뀌므로 `const`를 붙일 수 없습니다.

## ElevatedButton

`ElevatedButton`은 사용자가 누를 수 있는 버튼입니다.

```dart
ElevatedButton(
  onPressed: _increment,
  child: const Text('Add one'),
)
```

역할:

- `onPressed`에는 버튼을 눌렀을 때 실행할 함수를 넣습니다.
- `child`에는 버튼 안에 표시할 위젯을 넣습니다.

현재 흐름:

```text
사용자가 Add one 클릭
  -> onPressed 실행
  -> _increment() 호출
  -> setState() 안에서 _count 증가
  -> build() 다시 실행
  -> Count 텍스트 갱신
```

## const를 붙일 수 있는 것과 없는 것

붙일 수 있는 예:

```dart
const Text('Button taps change state.')
const SizedBox(height: 12)
const Text('Add one')
```

붙일 수 없는 예:

```dart
Text('Count: $_count')
```

이 텍스트는 `_count` 상태에 따라 바뀌기 때문입니다.

## T-003 코드 읽는 순서

1. `main()`에서 앱이 시작됩니다.
2. `runApp(const MyApp())`이 `MyApp`을 루트 위젯으로 등록합니다.
3. `MyApp.build()`가 `MaterialApp`을 반환합니다.
4. `MaterialApp.home`이 `LabT003StatefulCounter`를 첫 화면으로 보여줍니다.
5. `LabT003StatefulCounter.createState()`가 `_LabT003StatefulCounterState`를 만듭니다.
6. `_LabT003StatefulCounterState.build()`가 `Count: 0` 화면을 그립니다.
7. 사용자가 `Add one` 버튼을 누릅니다.
8. `_increment()`가 실행됩니다.
9. `setState()` 안에서 `_count`가 증가합니다.
10. Flutter가 `build()`를 다시 실행합니다.
11. 화면에 `Count: 1`이 표시됩니다.

## T-003에서 기억할 것

- `StatefulWidget`은 바뀌는 화면에 사용합니다.
- 실제 바뀌는 값은 `State` 클래스가 가집니다.
- 상태 변수는 화면에 표시될 수 있습니다.
- 버튼의 `onPressed`에 함수를 연결합니다.
- `setState()`는 상태 변경 후 화면을 다시 그리게 합니다.
- 상태에 따라 바뀌는 위젯에는 `const`를 붙일 수 없습니다.


