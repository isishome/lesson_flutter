# Learning Harness

이 하네스는 Flutter 학습을 반복하기 위한 최소 구조입니다. 핵심은 실습 코드, 검증 코드, 학습 기록을 서로 섞지 않는 것입니다.

## 폴더 역할

```text
first_flutter_app/
  docs/
    master-plan.md          # 전체 학습 로드맵
    harness.md              # 학습 하네스 사용법
    progress.md             # 진행 현황과 의사결정 기록
    session-template.md     # 세션 기록 템플릿
    tasks.md              # 태스크 장부
    task-template.md       # 태스크 등록 템플릿
    runbook.md             # 학습 에이전트 학습 운영 절차
    concepts/              # 레슨별 Flutter 클래스와 위젯 구조 설명
  lib/
    main.dart               # 실행 진입점
    learning/
      README.md             # 실습 코드 배치 규칙
      labs/                 # 개념별 실습 코드
  test/
    widget_test.dart         # 현재 앱에 대한 기본 테스트
    learning/
      README.md             # 학습용 테스트 배치 규칙
```


## 태스크 기반 운영

앞으로 모든 학습은 태스크 단위로 진행합니다. 사용자가 학습 목표를 지시하면 학습 에이전트가 다음 순서로 처리합니다.

1. `docs/tasks.md`에 태스크를 등록합니다.
2. 태스크 목표, 구현 범위, 완료 기준을 계획합니다.
3. 필요한 Flutter 기초 코드를 구현합니다.
4. 구현에 맞는 테스트 코드를 작성합니다.
5. `flutter analyze`와 `flutter test`를 실행합니다.
6. UI 확인이 필요한 경우 런타임에서 동작을 확인합니다.
7. 검증 결과를 기록하고 태스크를 완료 처리합니다.
8. 레슨 완료 후 사용자에게 커밋 여부를 묻고, 요청받은 경우에만 커밋합니다.

이 흐름의 상세 기준은 `docs/runbook.md`를 따릅니다.


## 개념 설명 노트

새 레슨에서 Flutter 클래스나 위젯이 처음 등장하면 `docs/concepts/` 아래에 태스크별 개별 파일로 설명을 남깁니다.

현재 개념 노트:

- `docs/concepts/t001-app-entry.md`: 앱 진입점, `runApp()`, `MaterialApp`, `Scaffold` 기초
- `docs/concepts/t002-stateless-text.md`: `StatelessWidget`, 파일 분리, `Text`, `AppBar`, `Column` 기초
- `docs/concepts/t003-stateful-counter.md`: `StatefulWidget`, `State`, `setState()`, `ElevatedButton` 기초
- `docs/concepts/widgets-t001-t003.md`: 개념 노트 인덱스
- `docs/concepts/t004-basic-layout.md`: `Row`, `Column`, `Expanded`, `Padding`, `Container` 기초
- `docs/concepts/t005-text-field-input.md`: `TextField`, `TextEditingController`, `InputDecoration`, `onChanged`, `dispose()` 기초
- `docs/concepts/lesson-grid-home.md`: `GridView.builder`, `Navigator.push`, `MaterialPageRoute`, 레슨 목록 구조
- `docs/concepts/t006-form-validation.md`: `Form`, `TextFormField`, `validator`, `GlobalKey<FormState>` 기초
- `docs/concepts/t007-toggle-inputs.md`: `CheckboxListTile`, `SwitchListTile`, `bool`, `onChanged` 기초
- `docs/concepts/t008-dropdown-selection.md`: `DropdownButtonFormField`, `DropdownMenuItem`, 선택 상태 기초
- `docs/concepts/t009-radio-selection.md`: `RadioGroup`, `RadioListTile`, 단일 선택 상태 기초
- `docs/concepts/t010-slider-input.md`: `Slider`, `double`, 숫자 범위 입력 기초
- `docs/concepts/practice-screens.md`: practice 화면 등록과 그리드 접근 구조

개념 노트에는 다음 내용을 포함합니다.

- 태스크 번호와 주제에 맞는 개별 파일명
- 해당 클래스가 Flutter SDK 제공인지 직접 만든 클래스인지
- 어떤 역할을 하는지
- 자주 쓰는 속성 이름
- 현재 실습 코드에서 어떻게 연결되는지
- 초보자가 헷갈리기 쉬운 `child`, `children`, `const`, `setState()` 같은 구조

## 실습 단위 규칙

각 실습은 하나의 개념에 집중합니다.

권장 이름:

- `lab_t001_counter_basics.dart`
- `lab_t002_layout_constraints.dart`
- `lab_t003_todo_state.dart`
- `lab_t004_form_validation.dart`

테스트 이름은 가능하면 실습 이름과 맞춥니다.

- `lab_t001_counter_basics_test.dart`
- `lab_t003_todo_state_test.dart`

## main.dart 사용 방식

처음에는 가장 단순하게 유지합니다.

- 오늘 실습할 화면을 `home:`에 연결합니다.
- 완료된 실습은 `lib/learning/labs/`에 남겨둡니다.
- 여러 실습을 전환하고 싶어지면 나중에 "실습 선택 화면"을 추가합니다.

예시:

```dart
import 'package:flutter/material.dart';
import 'package:first_flutter_app/learning/labs/lab_t001_counter_basics.dart';

void main() => runApp(const LearningApp());

class LearningApp extends StatelessWidget {
  const LearningApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LabT001CounterBasics(),
    );
  }
}
```

## 검증 명령

자주 쓰는 명령:

```powershell
flutter analyze
flutter test
flutter run
flutter run -d chrome
flutter clean
flutter pub get
```

권장 순서:

1. 코드를 작성합니다.
2. `flutter analyze`로 정적 문제를 확인합니다.
3. `flutter test`로 테스트를 확인합니다.
4. 필요할 때만 `flutter run`으로 화면을 확인합니다.

## 학습 기록 방식

매 세션마다 너무 길게 적을 필요는 없습니다. 아래 4가지만 남기면 충분합니다.

- 오늘 다룬 개념
- 직접 작성한 코드 위치
- 헷갈렸던 점
- 다음에 확인할 것

기록은 학습 에이전트가 `docs/progress.md`와 `docs/tasks.md`에 갱신합니다. 레슨 하나가 완료되면 변경 사항을 커밋할지 사용자에게 확인합니다. 세션별 파일이 필요해지면 `docs/sessions/` 폴더를 만들어 분리합니다.

## 현재 프로젝트에서 먼저 정리할 것

- `lib/main.dart`의 한글 문자열이 깨져 있으므로, 첫 실습 전에 UTF-8 기준으로 다시 작성하는 것을 권장합니다.
- `test/widget_test.dart`는 기본 카운터 앱을 가정하고 있어 현재 앱과 맞지 않을 수 있습니다.
- `build/` 폴더는 생성물이므로 소스 학습 대상이 아닙니다.

