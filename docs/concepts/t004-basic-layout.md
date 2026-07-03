# T-004 Row and Column Layout

T-004는 Flutter에서 위젯을 세로와 가로로 배치하는 기본 레이아웃을 다룹니다.

## 코드 구조

```text
main.dart
  MyApp
    MaterialApp
      home: LabT004BasicLayout

lab_t004_basic_layout.dart
  LabT004BasicLayout extends StatelessWidget
    Scaffold
      appBar: AppBar
      body: Padding
        child: Column
          children:
            Text
            SizedBox
            Text
            SizedBox
            Row
              children:
                Expanded
                  child: _LayoutTile
                SizedBox
                Expanded
                  child: _LayoutTile
                SizedBox
                Expanded
                  child: _LayoutTile
            SizedBox
            Text

  _LayoutTile extends StatelessWidget
    Container
      child: Text
```

## 직접 만든 클래스: LabT004BasicLayout

`LabT004BasicLayout`은 T-004 실습 화면입니다.

```dart
class LabT004BasicLayout extends StatelessWidget {
  const LabT004BasicLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(...);
  }
}
```

역할:

- 세로 배치인 `Column`과 가로 배치인 `Row`를 한 화면에서 보여줍니다.
- 상태가 바뀌지 않으므로 `StatelessWidget`으로 만듭니다.

## Column

`Column`은 여러 위젯을 세로로 배치합니다.

```dart
Column(
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: [
    Text('Column places widgets vertically.'),
    SizedBox(height: 12),
    Text('Row places widgets horizontally.'),
    SizedBox(height: 24),
    Row(...),
    SizedBox(height: 24),
    Text('Expanded shares the available width.'),
  ],
)
```

역할:

- `children` 목록의 위젯을 위에서 아래로 배치합니다.
- 화면 전체 흐름을 세로 방향으로 만듭니다.

## Row

`Row`는 여러 위젯을 가로로 배치합니다.

```dart
Row(
  children: const [
    Expanded(child: _LayoutTile(label: 'One', color: Colors.teal)),
    SizedBox(width: 12),
    Expanded(child: _LayoutTile(label: 'Two', color: Colors.indigo)),
    SizedBox(width: 12),
    Expanded(child: _LayoutTile(label: 'Three', color: Colors.deepOrange)),
  ],
)
```

역할:

- `children` 목록의 위젯을 왼쪽에서 오른쪽으로 배치합니다.
- T-004에서는 세 개의 타일을 가로로 나란히 보여줍니다.

## mainAxis와 crossAxis

`Column`과 `Row`를 이해할 때 가장 중요한 개념입니다.

`Column`:

- main axis: 세로 방향
- cross axis: 가로 방향

`Row`:

- main axis: 가로 방향
- cross axis: 세로 방향

즉, 같은 `mainAxisAlignment`라도 `Column`에서는 세로 정렬이고, `Row`에서는 가로 정렬입니다.

## crossAxisAlignment

`crossAxisAlignment`는 main axis와 반대 방향 정렬입니다.

T-004 코드:

```dart
crossAxisAlignment: CrossAxisAlignment.stretch,
```

의미:

- `Column`의 cross axis는 가로 방향입니다.
- `stretch`는 자식 위젯을 가능한 가로 폭까지 늘립니다.

## Expanded

`Expanded`는 `Row`나 `Column` 안에서 남는 공간을 나눠 갖게 하는 위젯입니다.

```dart
Expanded(
  child: _LayoutTile(label: 'One', color: Colors.teal),
)
```

T-004에서의 의미:

- 세 개의 타일이 같은 비율로 가로 공간을 나눠 갖습니다.
- `Expanded`가 없으면 각 타일은 자기 내용 크기만큼만 차지합니다.

주의:

- `Expanded`는 보통 `Row`, `Column`, `Flex` 안에서 사용합니다.
- 아무 곳에나 넣으면 레이아웃 오류가 날 수 있습니다.

## Padding

`Padding`은 child 주변에 안쪽 여백을 줍니다.

```dart
Padding(
  padding: const EdgeInsets.all(16),
  child: Column(...),
)
```

역할:

- 화면 가장자리와 내용 사이에 16만큼 여백을 만듭니다.
- UI가 화면 끝에 붙지 않게 합니다.

## EdgeInsets

`EdgeInsets`는 여백 값을 표현하는 클래스입니다.

```dart
EdgeInsets.all(16)
```

의미:

- 위, 아래, 왼쪽, 오른쪽 모두 16만큼 여백을 줍니다.

자주 쓰는 형태:

```dart
EdgeInsets.all(16)
EdgeInsets.symmetric(horizontal: 16, vertical: 8)
EdgeInsets.only(left: 16, top: 8)
```

## SizedBox

`SizedBox`는 고정 크기 공간을 만듭니다.

```dart
const SizedBox(height: 12)
const SizedBox(width: 12)
```

역할:

- `height`는 세로 간격입니다.
- `width`는 가로 간격입니다.
- T-004에서는 텍스트 사이와 타일 사이의 간격을 만듭니다.

## 직접 만든 클래스: _LayoutTile

`_LayoutTile`은 같은 모양의 색상 타일을 반복해서 쓰기 위해 만든 작은 위젯입니다.

```dart
class _LayoutTile extends StatelessWidget {
  const _LayoutTile({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(...);
  }
}
```

역할:

- `One`, `Two`, `Three` 타일의 중복 코드를 줄입니다.
- `label`과 `color`만 바꿔 같은 구조를 재사용합니다.

파일 안에서만 쓰는 보조 위젯이므로 이름 앞에 `_`를 붙였습니다.

## Container

`Container`는 크기, 색상, 정렬, 여백 등을 지정할 수 있는 범용 박스 위젯입니다.

```dart
Container(
  height: 80,
  alignment: Alignment.center,
  color: color,
  child: Text(...),
)
```

T-004에서 사용하는 속성:

- `height`: 타일 높이
- `alignment`: child 위치
- `color`: 배경색
- `child`: 안에 들어갈 텍스트

## Alignment

`Alignment`는 child를 어디에 둘지 정합니다.

```dart
alignment: Alignment.center,
```

의미:

- `Container` 안의 `Text`를 중앙에 둡니다.

## Color와 Colors

`Color`는 색상 값을 표현하는 타입입니다.

```dart
final Color color;
```

`Colors`는 Flutter가 제공하는 기본 색상 모음입니다.

```dart
Colors.teal
Colors.indigo
Colors.deepOrange
Colors.white
```

T-004에서는 각 타일의 배경색과 텍스트 색상에 사용합니다.

## TextStyle

`TextStyle`은 `Text`의 글자 스타일을 지정합니다.

```dart
style: const TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
),
```

역할:

- 글자 색을 흰색으로 바꿉니다.
- 글자를 굵게 표시합니다.

## T-004 코드 읽는 순서

1. `main()`에서 앱이 시작됩니다.
2. `MyApp`이 `MaterialApp`을 반환합니다.
3. `MaterialApp.home`이 `LabT004BasicLayout`을 보여줍니다.
4. `Scaffold`가 화면 뼈대를 만듭니다.
5. `Padding`이 본문 전체에 여백을 줍니다.
6. `Column`이 텍스트, `Row`, 텍스트를 세로로 배치합니다.
7. `Row`가 세 개의 타일을 가로로 배치합니다.
8. 각 `Expanded`가 가로 공간을 나눠 갖습니다.
9. `_LayoutTile`이 색상 박스와 라벨을 표시합니다.

## T-004에서 기억할 것

- `Column`은 세로 배치입니다.
- `Row`는 가로 배치입니다.
- `children`은 여러 자식 위젯을 받을 때 씁니다.
- `Padding`은 안쪽 여백을 만듭니다.
- `SizedBox`는 고정 간격을 만듭니다.
- `Expanded`는 남는 공간을 나눠 갖게 합니다.
- `Container`는 색상, 크기, 정렬을 가진 박스를 만들 수 있습니다.


