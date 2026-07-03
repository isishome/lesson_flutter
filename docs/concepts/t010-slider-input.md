# T-010 Slider 숫자 입력 다루기

## 목표

이번 레슨은 `Slider`로 숫자 값을 선택하는 입력을 다룹니다. 사용자가 직접 숫자를 입력하는 대신, 정해진 범위 안에서 손잡이를 움직여 값을 고르게 할 때 사용합니다.

## 새로 등장한 클래스

### Slider

`Slider`는 Flutter SDK가 제공하는 Material 입력 위젯입니다. 최소값과 최대값 사이에서 `double` 값을 선택합니다.

자주 쓰는 속성:

- `value`: 현재 선택된 숫자 값
- `min`: 선택 가능한 최소값
- `max`: 선택 가능한 최대값
- `divisions`: 값을 몇 단계로 나눌지 정하는 옵션
- `label`: 드래그 중 표시할 값
- `onChanged`: 값이 바뀔 때 실행할 함수

현재 코드에서는 `_volume`이 `value`입니다. 사용자가 Slider를 움직이면 `onChanged`가 새 `double` 값을 받고, `setState()` 안에서 `_volume`을 갱신합니다.

## 코드 흐름

```dart
double _volume = 40;
```

Slider는 `double` 값을 사용하므로 상태도 `double`로 둡니다.

```dart
Slider(
  value: _volume,
  min: 0,
  max: 100,
  divisions: 10,
  label: '${_volume.round()}',
  onChanged: _setVolume,
)
```

`value`는 현재 값이고, `min`과 `max`는 선택 범위입니다. `divisions: 10`은 0부터 100까지를 10단계로 나눈다는 뜻입니다.

```dart
void _setVolume(double value) {
  setState(() {
    _volume = value;
  });
}
```

`onChanged`에서 받은 값을 상태에 저장하면 화면의 텍스트도 함께 갱신됩니다.

## 헷갈리기 쉬운 점

- `Slider.value`는 `double`이어야 합니다. `int`를 직접 넣으면 타입이 맞지 않습니다.
- 화면에 정수처럼 보여주고 싶으면 `_volume.round()`처럼 표시할 때만 변환합니다.
- `divisions`를 생략하면 연속적인 값처럼 움직이고, 넣으면 단계별로 움직입니다.
- `onChanged`가 `null`이면 Slider는 비활성화됩니다.
