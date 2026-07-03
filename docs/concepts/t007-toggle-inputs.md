# T-007 Checkbox and Switch Inputs

T-007은 참/거짓 값을 다루는 입력 위젯을 배웁니다. 핵심은 `bool` 상태를 만들고, `CheckboxListTile`과 `SwitchListTile`의 변경 이벤트에서 `setState()`로 상태를 갱신하는 것입니다.

## 코드 구조

```text
lessons.dart
  T-007 -> LabT007ToggleInputs

lab_t007_toggle_inputs.dart
  LabT007ToggleInputs extends StatefulWidget
    _LabT007ToggleInputsState extends State
      _acceptedTerms
      _notificationsEnabled
      _setAcceptedTerms()
      _setNotificationsEnabled()
      build()
        Scaffold
          appBar: AppBar
          body: Padding
            child: Column
              children:
                Text
                CheckboxListTile
                SwitchListTile
                Text(termsStatus)
                Text(notificationStatus)
```

## bool 상태

`bool`은 참/거짓 값을 표현하는 타입입니다.

```dart
bool _acceptedTerms = false;
bool _notificationsEnabled = false;
```

역할:

- `_acceptedTerms`: 약관 동의 여부입니다.
- `_notificationsEnabled`: 알림 활성화 여부입니다.

## CheckboxListTile

`CheckboxListTile`은 체크박스와 텍스트 라벨이 함께 있는 Material 위젯입니다.

```dart
CheckboxListTile(
  title: const Text('Accept terms'),
  value: _acceptedTerms,
  onChanged: _setAcceptedTerms,
)
```

역할:

- 사용자가 항목을 선택했는지 표현합니다.
- `value`에 현재 선택 상태를 넣습니다.
- `onChanged`에 상태를 바꿀 함수를 넣습니다.

## Checkbox의 onChanged는 bool?

체크박스의 변경값은 `bool?`입니다.

```dart
void _setAcceptedTerms(bool? value) {
  setState(() {
    _acceptedTerms = value ?? false;
  });
}
```

이유:

- Flutter의 체크박스는 필요하면 `true`, `false`, `null` 세 상태를 표현할 수 있습니다.
- T-007에서는 null 상태를 쓰지 않으므로 `value ?? false`로 처리합니다.

## SwitchListTile

`SwitchListTile`은 스위치와 텍스트 라벨이 함께 있는 Material 위젯입니다.

```dart
SwitchListTile(
  title: const Text('Enable notifications'),
  value: _notificationsEnabled,
  onChanged: _setNotificationsEnabled,
)
```

역할:

- 설정을 켜거나 끄는 UI에 적합합니다.
- 예: 알림 켜기, 다크 모드, 자동 저장

## Switch의 onChanged는 bool

스위치의 변경값은 `bool`입니다.

```dart
void _setNotificationsEnabled(bool value) {
  setState(() {
    _notificationsEnabled = value;
  });
}
```

`Switch`는 켜짐/꺼짐 두 상태만 다루므로 nullable이 아닙니다.

## 상태 문구

현재 상태를 사용자가 읽을 수 있는 문구로 바꿉니다.

```dart
final termsStatus = _acceptedTerms ? 'Terms accepted' : 'Terms not accepted';
final notificationStatus = _notificationsEnabled
    ? 'Notifications on'
    : 'Notifications off';
```

Dart 조건 연산자:

```dart
조건 ? 참일 때 값 : 거짓일 때 값
```

## setState() 흐름

체크박스 흐름:

```text
사용자가 Accept terms 탭
  -> CheckboxListTile.onChanged 호출
  -> _setAcceptedTerms(value) 실행
  -> setState() 안에서 _acceptedTerms 갱신
  -> build() 다시 실행
  -> Terms accepted 표시
```

스위치 흐름:

```text
사용자가 Enable notifications 탭
  -> SwitchListTile.onChanged 호출
  -> _setNotificationsEnabled(value) 실행
  -> setState() 안에서 _notificationsEnabled 갱신
  -> build() 다시 실행
  -> Notifications on 표시
```

## Checkbox와 Switch의 차이

`Checkbox`:

- 항목 선택, 동의, 다중 선택에 적합합니다.
- 체크 표시로 선택 여부를 보여줍니다.

`Switch`:

- 설정을 켜고 끄는 데 적합합니다.
- 상태가 즉시 적용되는 옵션에 자주 씁니다.

## ListTile 버전을 쓴 이유

T-007에서는 `Checkbox` 대신 `CheckboxListTile`, `Switch` 대신 `SwitchListTile`을 사용했습니다.

장점:

- 라벨과 입력 위젯을 한 줄에 같이 배치합니다.
- 사용자가 텍스트 영역을 눌러도 토글할 수 있습니다.
- 기초 앱에서 더 읽기 쉬운 UI를 빠르게 만들 수 있습니다.

## T-007에서 기억할 것

- 체크박스와 스위치는 `bool` 상태와 잘 맞습니다.
- `value`는 현재 상태입니다.
- `onChanged`는 새 상태를 전달합니다.
- 상태를 바꾼 뒤 화면을 갱신하려면 `setState()`를 호출합니다.
- `CheckboxListTile`의 값은 `bool?`, `SwitchListTile`의 값은 `bool`입니다.


