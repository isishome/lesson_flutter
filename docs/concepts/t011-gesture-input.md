# T-011 GestureDetector와 InkWell로 탭 제스처 다루기

## 목표

이번 레슨은 사용자의 터치 동작을 처리하는 기본 방법을 다룹니다. 버튼이나 입력 위젯이 아닌 영역에도 탭, 더블탭, 길게 누르기 같은 제스처를 붙일 수 있습니다.

## 새로 등장한 클래스

### GestureDetector

`GestureDetector`는 Flutter SDK가 제공하는 제스처 감지 위젯입니다. 자식 위젯을 감싸고, 사용자가 그 영역에 어떤 동작을 했는지 콜백으로 알려줍니다.

자주 쓰는 속성:

- `onTap`: 한 번 탭했을 때 실행
- `onDoubleTap`: 빠르게 두 번 탭했을 때 실행
- `onLongPress`: 길게 눌렀을 때 실행
- `child`: 제스처를 감지할 화면 영역

현재 코드에서는 파란 박스를 `GestureDetector`로 감싸고, 제스처가 발생할 때 `_recordGesture()`를 호출합니다.

### InkWell

`InkWell`은 Material 스타일의 탭 효과를 제공하는 위젯입니다. 사용자가 누르면 물결처럼 퍼지는 ink 효과가 보입니다.

자주 쓰는 속성:

- `onTap`: 탭했을 때 실행
- `borderRadius`: ink 효과와 터치 영역의 둥근 모서리
- `child`: 탭 가능한 화면 영역

`InkWell`은 Material 효과를 그리기 위해 보통 `Material` 위젯 안에서 사용합니다.

## 코드 흐름

```dart
String _lastGesture = 'No gesture yet.';
int _gestureCount = 0;
```

마지막으로 발생한 제스처 이름과 총 제스처 횟수를 상태로 둡니다.

```dart
void _recordGesture(String gesture) {
  setState(() {
    _lastGesture = gesture;
    _gestureCount += 1;
  });
}
```

제스처 콜백에서 이 함수를 호출하면 화면의 `Last gesture`와 `Gesture count` 문구가 갱신됩니다.

```dart
GestureDetector(
  onTap: () => _recordGesture('GestureDetector tap'),
  onDoubleTap: () => _recordGesture('GestureDetector double tap'),
  onLongPress: () => _recordGesture('GestureDetector long press'),
  child: Container(...),
)
```

`GestureDetector`는 자식 위젯 자체의 모양을 바꾸지 않습니다. 터치 동작을 감지하는 역할만 합니다.

```dart
Material(
  child: InkWell(
    onTap: () => _recordGesture('InkWell tap'),
    child: Container(...),
  ),
)
```

`InkWell`은 탭 동작 처리와 Material 터치 효과를 함께 제공합니다.

## 헷갈리기 쉬운 점

- 단순히 제스처만 감지하려면 `GestureDetector`가 적합합니다.
- Material 디자인의 탭 효과가 필요하면 `InkWell`이 적합합니다.
- `InkWell`의 물결 효과가 보이려면 가까운 상위에 `Material`이 있어야 합니다.
- `GestureDetector`의 자식이 너무 작으면 사용자가 누르기 어렵습니다. 터치 영역은 충분한 크기로 만듭니다.
