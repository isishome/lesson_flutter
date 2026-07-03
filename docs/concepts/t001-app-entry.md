# T-001 App Entry and MaterialApp

T-001은 Flutter 앱이 시작되는 가장 작은 구조를 다룹니다.

## 코드 구조

```text
main()
  runApp(MyApp)
    MyApp extends StatelessWidget
      MaterialApp
        home: Scaffold
          body: Center
            child: Text
```

## main()

`main()`은 Dart 프로그램의 시작점입니다.

```dart
void main() {
  runApp(const MyApp());
}
```

역할:

- 앱 실행이 시작되는 함수입니다.
- `runApp()`을 호출해 Flutter 앱을 시작합니다.

## runApp()

`runApp()`은 Flutter에게 어떤 위젯부터 화면에 그릴지 알려주는 함수입니다.

```dart
runApp(const MyApp());
```

역할:

- 전달받은 위젯을 앱의 루트 위젯으로 등록합니다.
- 보통 직접 만든 `MyApp`을 넘깁니다.

## MyApp

`MyApp`은 우리가 직접 만든 최상위 위젯입니다.

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: Center(child: Text('Hello, Flutter!'))),
    );
  }
}
```

역할:

- 앱의 가장 바깥 구조를 정의합니다.
- `build()`에서 실제로 보여줄 위젯 트리를 반환합니다.

## StatelessWidget

`StatelessWidget`은 상태가 없는 위젯을 만들 때 상속합니다.

T-001에서 `MyApp`은 상태를 가지지 않습니다. 앱의 기본 틀만 반환하기 때문에 `StatelessWidget`으로 충분합니다.

핵심 구조:

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ...;
  }
}
```

## build()

`build()`는 화면에 그릴 위젯 구조를 반환하는 메서드입니다.

```dart
@override
Widget build(BuildContext context) {
  return const MaterialApp(...);
}
```

역할:

- Flutter가 화면을 그릴 때 호출합니다.
- 반드시 `Widget`을 반환합니다.

## BuildContext

`BuildContext`는 현재 위젯이 위젯 트리 안에서 어디에 있는지 알려주는 정보입니다.

T-001에서는 직접 사용하지 않습니다. 하지만 `build(BuildContext context)` 형태는 거의 모든 위젯에서 반복해서 보게 됩니다.

## MaterialApp

`MaterialApp`은 Flutter SDK가 제공하는 Material Design 기반 앱의 최상위 틀입니다.

```dart
return const MaterialApp(
  home: Scaffold(...),
);
```

역할:

- 앱 전체에 Material Design 환경을 제공합니다.
- `home`에 지정한 위젯을 첫 화면으로 보여줍니다.
- 나중에 테마, 라우팅, 언어 설정도 여기에서 다룹니다.

자주 쓰는 속성:

- `home`: 앱 시작 화면
- `theme`: 앱 색상과 스타일
- `routes`: 이름 기반 화면 이동 설정
- `debugShowCheckedModeBanner`: 디버그 배너 표시 여부

T-001에서는 `home`만 이해하면 충분합니다.

## Scaffold

`Scaffold`는 Material 앱에서 한 화면의 기본 뼈대를 만드는 위젯입니다.

```dart
Scaffold(
  body: Center(child: Text('Hello, Flutter!')),
)
```

역할:

- 화면의 표준 영역을 제공합니다.
- `body`, `appBar`, `floatingActionButton` 같은 영역을 넣을 수 있습니다.

T-001에서는 `body`만 사용합니다.

## Center

`Center`는 child 위젯 하나를 화면 중앙에 배치합니다.

```dart
Center(
  child: Text('Hello, Flutter!'),
)
```

역할:

- 하나의 자식 위젯을 가능한 공간의 중앙에 둡니다.
- `child`는 하나만 받을 수 있습니다.

## Text

`Text`는 문자열을 화면에 표시하는 위젯입니다.

```dart
Text('Hello, Flutter!')
```

역할:

- 고정된 문구를 화면에 보여줍니다.

## child

`child`는 자식 위젯을 하나만 받을 때 쓰는 속성입니다.

예:

```dart
Center(child: Text('Hello'))
```

`Center`는 중앙에 둘 대상이 하나이기 때문에 `child`를 사용합니다.

## const

`const`는 컴파일 시점에 고정할 수 있는 객체에 붙입니다.

```dart
const MyApp()
const MaterialApp(...)
const Text('Hello, Flutter!')
```

효과:

- 값이 바뀌지 않는 위젯이라는 의도를 드러냅니다.
- Flutter가 불필요한 객체 생성을 줄일 수 있습니다.

## T-001에서 기억할 것

- `main()`은 앱 시작점입니다.
- `runApp()`은 Flutter 앱을 시작합니다.
- `MyApp`은 우리가 만든 루트 위젯입니다.
- `MaterialApp`은 앱 전체의 Material 기반 틀입니다.
- `Scaffold`는 한 화면의 기본 뼈대입니다.
- `home`은 앱의 첫 화면입니다.
- `body`는 화면의 주요 내용 영역입니다.
