# T-002 StatelessWidget and Text

T-002는 화면 위젯을 별도 파일로 분리하고, `StatelessWidget`과 `Text`로 고정 화면을 만드는 실습입니다.

## 코드 구조

```text
main.dart
  MyApp
    MaterialApp
      home: LabT002StatelessText

lab_t002_stateless_text.dart
  LabT002StatelessText extends StatelessWidget
    Scaffold
      appBar: AppBar
        title: Text
      body: Center
        child: Column
          children:
            Text
            SizedBox
            Text
            SizedBox
            Text
```

## 직접 만든 클래스: LabT002StatelessText

`LabT002StatelessText`는 우리가 직접 만든 화면 위젯입니다.

```dart
class LabT002StatelessText extends StatelessWidget {
  const LabT002StatelessText({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(...);
  }
}
```

역할:

- T-002 실습 화면을 담당합니다.
- 고정된 텍스트만 보여주므로 `StatelessWidget`으로 만듭니다.
- `main.dart`에서 `MaterialApp.home`으로 연결합니다.

## StatelessWidget

`StatelessWidget`은 내부 상태가 없는 위젯입니다.

특징:

- 사용자 행동으로 내부 값이 바뀌지 않습니다.
- 같은 입력이면 같은 화면을 그립니다.
- `build()` 메서드에서 UI 구조를 반환합니다.

T-002에서는 화면에 고정 문구만 보여주므로 `StatelessWidget`이 적합합니다.

## 파일 분리와 import

T-002부터 실습 화면을 별도 파일로 분리했습니다.

```dart
import 'package:first_flutter_app/learning/labs/lab_t002_stateless_text.dart';
```

의미:

- `main.dart`에서 `LabT002StatelessText` 클래스를 사용하기 위해 import합니다.
- 실습 화면 코드가 커져도 `main.dart`가 복잡해지지 않습니다.

## MaterialApp.home

```dart
return const MaterialApp(home: LabT002StatelessText());
```

의미:

- 앱의 첫 화면으로 `LabT002StatelessText`를 보여줍니다.
- `home`에는 위젯 객체가 들어갑니다.

## Scaffold

`Scaffold`는 한 화면의 기본 뼈대입니다.

```dart
return Scaffold(
  appBar: AppBar(title: const Text('T-002 StatelessWidget')),
  body: const Center(...),
);
```

T-002에서 사용하는 속성:

- `appBar`: 화면 상단 제목 영역
- `body`: 화면 본문 영역

## AppBar

`AppBar`는 `Scaffold`의 상단 바입니다.

```dart
appBar: AppBar(title: const Text('T-002 StatelessWidget')),
```

역할:

- 화면 제목을 표시합니다.
- `title`에는 문자열이 아니라 `Text` 위젯을 넣습니다.

주의:

- `AppBar` 자체는 const 생성자가 아니므로 `const AppBar(...)`로 쓰지 않습니다.
- 대신 내부의 `Text`는 고정 문구이므로 `const Text(...)`로 쓸 수 있습니다.

## Text

`Text`는 문자열을 화면에 표시합니다.

T-002의 본문 텍스트:

```dart
Text('Hello, Flutter!')
Text('This screen is a StatelessWidget.')
Text('Text widgets show fixed content.')
```

역할:

- 사용자가 읽을 수 있는 문구를 화면에 보여줍니다.
- 상태가 없기 때문에 문구는 바뀌지 않습니다.

## Center

`Center`는 하나의 child를 중앙에 배치합니다.

```dart
body: const Center(
  child: Column(...),
),
```

역할:

- `body` 영역 안에서 `Column`을 중앙에 둡니다.

## Column

`Column`은 여러 위젯을 세로로 배치합니다.

```dart
Column(
  mainAxisSize: MainAxisSize.min,
  children: [
    Text('Hello, Flutter!'),
    SizedBox(height: 12),
    Text('This screen is a StatelessWidget.'),
    SizedBox(height: 12),
    Text('Text widgets show fixed content.'),
  ],
)
```

역할:

- `children`에 들어 있는 위젯들을 위에서 아래로 배치합니다.
- `mainAxisSize: MainAxisSize.min`은 필요한 높이만 차지하게 합니다.

## SizedBox

`SizedBox`는 고정된 빈 공간을 만들 때 사용합니다.

```dart
const SizedBox(height: 12)
```

역할:

- 텍스트 사이에 세로 간격을 만듭니다.

## child와 children

`child`는 자식 위젯이 하나일 때 사용합니다.

```dart
Center(child: Column(...))
```

`children`은 자식 위젯이 여러 개일 때 사용합니다.

```dart
Column(children: [Text('A'), Text('B')])
```

T-002에서는 `Center`가 `Column` 하나를 가지므로 `child`, `Column`이 여러 위젯을 가지므로 `children`을 사용합니다.

## T-002에서 기억할 것

- 화면 위젯은 별도 파일로 분리할 수 있습니다.
- 별도 파일의 클래스를 쓰려면 import가 필요합니다.
- `StatelessWidget`은 바뀌지 않는 화면에 적합합니다.
- `Scaffold`는 화면의 기본 뼈대입니다.
- `AppBar`는 화면 상단 제목 영역입니다.
- `Column`은 여러 위젯을 세로로 배치합니다.
- `child`는 하나, `children`은 여러 개입니다.


