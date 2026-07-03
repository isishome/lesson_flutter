# T-006 Form and Validation

T-006은 `Form`과 `TextFormField`를 사용해서 제출 전에 입력값을 검사하는 기본 흐름을 다룹니다.

## 코드 구조

```text
main.dart
  MyApp
    MaterialApp
      home: LessonHomeScreen

lessons.dart
  T-006 -> LabT006FormValidation

lab_t006_form_validation.dart
  LabT006FormValidation extends StatefulWidget
    _LabT006FormValidationState extends State
      _formKey
      _nameController
      _submittedName
      dispose()
      _validateName()
      _submit()
      build()
        Scaffold
          appBar: AppBar
          body: Padding
            child: Form
              key: _formKey
              child: Column
                children:
                  Text
                  TextFormField
                    controller
                    decoration
                    validator
                  ElevatedButton
                    onPressed: _submit
                  Text(result)
```

## Form

`Form`은 여러 입력 필드의 검증 상태를 묶어서 관리하는 위젯입니다.

```dart
Form(
  key: _formKey,
  child: Column(...),
)
```

역할:

- 안에 있는 `TextFormField`들의 validator를 실행할 수 있게 합니다.
- 제출 버튼을 눌렀을 때 전체 입력값이 유효한지 확인합니다.

## GlobalKey<FormState>

`GlobalKey<FormState>`는 `Form`의 상태에 접근하기 위한 키입니다.

```dart
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
```

역할:

- `Form` 위젯과 연결됩니다.
- `_formKey.currentState?.validate()`로 폼 검증을 실행할 수 있습니다.

## TextFormField

`TextFormField`는 form 검증 기능이 붙은 입력 위젯입니다.

```dart
TextFormField(
  controller: _nameController,
  decoration: const InputDecoration(...),
  validator: _validateName,
)
```

`TextField`와의 차이:

- `TextField`: 단순 입력 위젯입니다.
- `TextFormField`: `Form` 안에서 validator를 사용할 수 있는 입력 위젯입니다.

## validator

`validator`는 입력값이 유효한지 검사하는 함수입니다.

```dart
String? _validateName(String? value) {
  final text = value?.trim() ?? '';

  if (text.isEmpty) {
    return 'Name is required.';
  }

  if (text.length < 2) {
    return 'Name must be at least 2 characters.';
  }

  return null;
}
```

반환 규칙:

- 문자열을 반환하면 오류 메시지로 표시됩니다.
- `null`을 반환하면 유효하다는 뜻입니다.

## validate()

`validate()`는 `Form` 안의 validator들을 실행합니다.

```dart
final isValid = _formKey.currentState?.validate() ?? false;
```

흐름:

1. `Submit` 버튼을 누릅니다.
2. `_submit()`이 실행됩니다.
3. `validate()`가 `TextFormField`의 validator를 호출합니다.
4. 오류가 있으면 화면에 오류 메시지를 표시하고 `false`를 반환합니다.
5. 모든 validator가 `null`을 반환하면 `true`를 반환합니다.

## _submit()

`_submit()`은 제출 버튼을 눌렀을 때 실행됩니다.

```dart
void _submit() {
  final isValid = _formKey.currentState?.validate() ?? false;

  if (!isValid) {
    setState(() {
      _submittedName = '';
    });
    return;
  }

  setState(() {
    _submittedName = _nameController.text.trim();
  });
}
```

역할:

- 먼저 폼 검증을 실행합니다.
- 유효하지 않으면 제출 결과를 비웁니다.
- 유효하면 입력값을 `_submittedName`에 저장합니다.

## 오류 메시지 표시

validator가 문자열을 반환하면 `TextFormField` 아래에 오류 메시지가 표시됩니다.

예:

```text
Name is required.
```

이 오류 표시는 `TextFormField`와 `Form`이 자동으로 처리합니다.

## TextEditingController

T-006에서도 controller를 사용합니다.

```dart
final TextEditingController _nameController = TextEditingController();
```

역할:

- 제출 시점에 `_nameController.text`로 현재 입력값을 읽습니다.
- 사용이 끝나면 `dispose()`에서 정리합니다.

## T-006 코드 읽는 순서

1. 사용자가 T-006 레슨을 엽니다.
2. `Form`과 `TextFormField`가 표시됩니다.
3. 사용자가 빈 상태로 `Submit`을 누릅니다.
4. `validate()`가 `_validateName()`을 호출합니다.
5. 빈 값이므로 `Name is required.`가 표시됩니다.
6. 사용자가 `Ada`를 입력합니다.
7. `Submit`을 다시 누릅니다.
8. validator가 `null`을 반환합니다.
9. `_submittedName`이 `Ada`로 갱신됩니다.
10. 화면에 `Submitted: Ada`가 표시됩니다.

## T-006에서 기억할 것

- `Form`은 여러 입력 필드의 검증을 묶어서 관리합니다.
- `TextFormField`는 validator를 사용할 수 있는 입력 위젯입니다.
- `GlobalKey<FormState>`로 `Form` 상태에 접근합니다.
- `validate()`는 모든 validator를 실행합니다.
- validator는 오류 문자열 또는 `null`을 반환합니다.
- 제출 버튼에서는 먼저 검증하고, 유효할 때만 결과를 반영합니다.


