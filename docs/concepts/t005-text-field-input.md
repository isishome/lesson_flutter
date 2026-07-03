# T-005 TextField Input

T-005는 `TextField`로 사용자 입력을 받고, 입력값을 화면에 반영하는 기본 흐름을 다룹니다.

## 코드 구조

```text
main.dart
  MyApp
    MaterialApp
      home: LabT005TextFieldInput

lab_t005_text_field_input.dart
  LabT005TextFieldInput extends StatefulWidget
    createState()
      _LabT005TextFieldInputState extends State
        _nameController
        _name
        dispose()
        _handleNameChanged()
        build()
          Scaffold
            appBar: AppBar
            body: Padding
              child: Column
                children:
                  Text
                  SizedBox
                  TextField
                    controller: _nameController
                    decoration: InputDecoration
                    onChanged: _handleNameChanged
                  SizedBox
                  Text(greeting)
```

## 직접 만든 클래스: LabT005TextFieldInput

`LabT005TextFieldInput`은 T-005 실습 화면입니다.

```dart
class LabT005TextFieldInput extends StatefulWidget {
  const LabT005TextFieldInput({super.key});

  @override
  State<LabT005TextFieldInput> createState() => _LabT005TextFieldInputState();
}
```

역할:

- 사용자 입력을 받아 화면에 반영합니다.
- 입력값이 바뀌면 화면도 바뀌므로 `StatefulWidget`을 사용합니다.

## TextField

`TextField`는 사용자가 키보드로 텍스트를 입력할 수 있는 위젯입니다.

```dart
TextField(
  controller: _nameController,
  decoration: const InputDecoration(
    border: OutlineInputBorder(),
    labelText: 'Name',
    hintText: 'Enter your name',
  ),
  onChanged: _handleNameChanged,
)
```

역할:

- 입력 칸을 화면에 표시합니다.
- 사용자가 입력한 값을 받을 수 있습니다.
- `onChanged`로 입력이 바뀔 때마다 함수를 실행할 수 있습니다.

## TextEditingController

`TextEditingController`는 `TextField`의 현재 텍스트를 다루는 컨트롤러입니다.

```dart
final TextEditingController _nameController = TextEditingController();
```

역할:

- `TextField`와 연결됩니다.
- 현재 입력값을 읽거나 직접 바꿀 수 있습니다.
- T-005에서는 컨트롤러를 연결하는 기본 패턴을 익히는 용도로 사용합니다.

주의:

- `TextEditingController`는 사용이 끝나면 `dispose()`로 정리해야 합니다.

## dispose()

`dispose()`는 `State` 객체가 제거될 때 호출되는 메서드입니다.

```dart
@override
void dispose() {
  _nameController.dispose();
  super.dispose();
}
```

역할:

- 컨트롤러 같은 리소스를 정리합니다.
- 메모리 누수를 피하는 기본 습관입니다.

순서:

1. `_nameController.dispose()`로 컨트롤러를 정리합니다.
2. `super.dispose()`로 부모 클래스의 정리 로직을 실행합니다.

## 상태 변수 _name

```dart
String _name = '';
```

역할:

- 현재 입력된 이름을 저장합니다.
- 처음에는 빈 문자열입니다.
- 입력이 바뀌면 `_handleNameChanged()`에서 갱신합니다.

## onChanged

`onChanged`는 `TextField` 입력값이 바뀔 때마다 호출되는 콜백입니다.

```dart
onChanged: _handleNameChanged,
```

`_handleNameChanged`는 아래처럼 생겼습니다.

```dart
void _handleNameChanged(String value) {
  setState(() {
    _name = value;
  });
}
```

흐름:

1. 사용자가 글자를 입력합니다.
2. `TextField`가 새 문자열을 `value`로 전달합니다.
3. `_name` 상태가 새 값으로 바뀝니다.
4. `setState()`가 화면 갱신을 요청합니다.
5. `Text(greeting)`이 새 인사 문구를 표시합니다.

## InputDecoration

`InputDecoration`은 `TextField`의 모양과 안내 문구를 설정합니다.

```dart
decoration: const InputDecoration(
  border: OutlineInputBorder(),
  labelText: 'Name',
  hintText: 'Enter your name',
),
```

T-005에서 사용하는 속성:

- `border`: 입력 칸 테두리
- `labelText`: 입력 칸 이름
- `hintText`: 입력 전 안내 문구

## OutlineInputBorder

`OutlineInputBorder`는 `TextField`에 테두리 박스 모양을 줍니다.

```dart
border: OutlineInputBorder()
```

역할:

- 입력 영역이 명확히 보이게 합니다.

## greeting 변수

```dart
final greeting = _name.isEmpty ? 'Type your name above.' : 'Hello, $_name';
```

역할:

- `_name`이 비어 있으면 안내 문구를 보여줍니다.
- `_name`에 값이 있으면 인사 문구를 보여줍니다.

이 문법은 Dart의 조건 연산자입니다.

```dart
조건 ? 참일 때 값 : 거짓일 때 값
```

## Text(greeting)

```dart
Text(greeting)
```

역할:

- 현재 상태에 맞는 문구를 화면에 표시합니다.
- 입력 전에는 `Type your name above.`를 보여줍니다.
- `Ada`를 입력하면 `Hello, Ada`를 보여줍니다.

## T-005 코드 읽는 순서

1. `main()`에서 앱이 시작됩니다.
2. `MyApp`이 `MaterialApp`을 반환합니다.
3. `MaterialApp.home`이 `LabT005TextFieldInput`을 보여줍니다.
4. `State` 안에 `_nameController`와 `_name`이 만들어집니다.
5. 화면에는 `TextField`와 안내 문구가 표시됩니다.
6. 사용자가 이름을 입력합니다.
7. `onChanged`가 `_handleNameChanged()`를 호출합니다.
8. `setState()` 안에서 `_name`이 갱신됩니다.
9. Flutter가 `build()`를 다시 실행합니다.
10. `Text(greeting)`이 `Hello, 입력값`으로 바뀝니다.

## T-005에서 기억할 것

- `TextField`는 사용자 입력을 받는 위젯입니다.
- 입력값이 화면에 반영되므로 `StatefulWidget`을 사용합니다.
- `onChanged`는 입력이 바뀔 때마다 실행됩니다.
- `setState()`를 호출해야 화면이 새 입력값으로 갱신됩니다.
- `TextEditingController`는 사용 후 `dispose()`에서 정리합니다.
- `InputDecoration`은 입력 칸의 label, hint, border를 설정합니다.


