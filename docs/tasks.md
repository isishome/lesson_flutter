# Task Board

이 파일은 Flutter 기초 학습을 태스크 단위로 운영하기 위한 장부입니다. 사용자가 새 학습 요청을 하면 이곳에 태스크를 등록하고, 계획, 구현, 검증, 완료 상태를 갱신합니다.

## 상태 값

- `Backlog`: 아직 시작하지 않은 태스크
- `Planned`: 구현 계획이 잡힌 태스크
- `In Progress`: 구현 중인 태스크
- `Implemented`: 코드 작성 완료
- `Tested`: 테스트 작성 및 통과
- `Runtime Checklist Ready`: 사용자가 직접 런타임을 확인할 체크리스트 작성 완료
- `Done`: 완료 처리
- `Blocked`: 사용자 결정이나 외부 조건이 필요해 멈춘 상태

## 완료 기준

태스크는 아래 조건을 만족해야 `Done`으로 처리합니다.

- 태스크 목표가 코드에 반영됨
- 필요한 테스트 코드가 작성됨
- `flutter analyze` 통과
- `flutter test` 통과
- UI 태스크인 경우 런타임 체크리스트 작성 또는 런타임 확인 완료
- `docs/progress.md`에 결과 기록

## Active

현재 활성 태스크 없음.

## Backlog

| ID | 제목 | 단계 | 상태 | 산출물 |
| --- | --- | --- | --- | --- |
| T-000 | 학습 하네스 운영 체계 정립 | 0 | Done | `docs/tasks.md`, `docs/runbook.md`, `docs/task-template.md` |
| T-001 | Flutter 앱 진입점과 가장 작은 MaterialApp 만들기 | 0 | Done | `lib/main.dart`, `test/widget_test.dart` |
| T-002 | StatelessWidget과 Text 위젯 기초 | 2 | Done | `lib/learning/labs/lab_t002_stateless_text.dart`, `test/widget_test.dart` |
| T-003 | 버튼 탭으로 상태 바꾸기 | 3 | Done | `lib/learning/labs/lab_t003_stateful_counter.dart`, `test/widget_test.dart` |
| T-004 | Row와 Column으로 레이아웃 만들기 | 2 | Done | `lib/learning/labs/lab_t004_basic_layout.dart`, `test/widget_test.dart`, `docs/concepts/t004-basic-layout.md` |
| T-005 | TextField로 사용자 입력 받기 | 4 | Done | `lib/learning/labs/lab_t005_text_field_input.dart`, `test/widget_test.dart`, `docs/concepts/t005-text-field-input.md` |
| T-UI-001 | 레슨 선택 그리드 홈 만들기 | UI | Done | `lib/learning/lesson_home_screen.dart`, `lib/learning/lessons.dart`, `docs/concepts/lesson-grid-home.md` |
| T-UI-002 | Practice 화면 그리드 접근 추가 | UI | Done | `lib/learning/practices.dart`, `lib/learning/lesson_home_screen.dart`, `docs/concepts/practice-screens.md` |
| T-006 | Form과 validation 기초 | 4 | Done | `lib/learning/labs/lab_t006_form_validation.dart`, `test/widget_test.dart`, `docs/concepts/t006-form-validation.md` |
| T-007 | Checkbox와 Switch 입력 다루기 | 4 | Done | `lib/learning/labs/lab_t007_toggle_inputs.dart`, `test/widget_test.dart`, `docs/concepts/t007-toggle-inputs.md` |
| T-008 | DropdownButton으로 선택 입력 다루기 | 4 | Done | `lib/learning/labs/lab_t008_dropdown_selection.dart`, `test/widget_test.dart`, `docs/concepts/t008-dropdown-selection.md` |
| T-009 | Radio 단일 선택 다루기 | 4 | Done | `lib/learning/labs/lab_t009_radio_selection.dart`, `test/widget_test.dart`, `docs/concepts/t009-radio-selection.md` |
| T-010 | Slider 숫자 입력 다루기 | 4 | Done | `lib/learning/labs/lab_t010_slider_input.dart`, `test/widget_test.dart`, `docs/concepts/t010-slider-input.md` |
| T-011 | GestureDetector와 InkWell로 탭 제스처 다루기 | 4 | Done | `lib/learning/labs/lab_t011_gesture_input.dart`, `test/widget_test.dart`, `docs/concepts/t011-gesture-input.md` |
| T-012 | Dismissible로 스와이프 삭제 리스트 만들기 | 4 | Done | `lib/learning/labs/lab_t012_dismissible_list.dart`, `test/widget_test.dart`, `docs/concepts/t012-dismissible-list.md` |
| T-013 | Navigator로 목록에서 상세 화면 이동하기 | 5 | Done | `lib/learning/labs/lab_t013_navigation_detail.dart`, `test/widget_test.dart`, `docs/concepts/t013-navigation-detail.md` |

## Done

### T-013 Navigator로 목록에서 상세 화면 이동하기

목표:

- 목록 항목을 탭해 상세 화면으로 이동한다.
- `Navigator.push`와 `MaterialPageRoute`의 역할을 익힌다.
- 선택한 항목 데이터를 상세 화면 생성자 인자로 전달한다.
- 상세 화면에서 뒤로가기로 목록 화면에 돌아온다.

구현 파일:

- `lib/learning/labs/lab_t013_navigation_detail.dart`
- `lib/learning/lessons.dart`
- `test/widget_test.dart`
- `docs/concepts/t013-navigation-detail.md`

구현 결과:

- `LabT013NavigationDetail` 위젯을 추가했다.
- T-013을 레슨 그리드에 등록했다.
- 글 목록에서 항목을 탭하면 `Article Detail` 화면으로 이동한다.
- 상세 화면은 선택한 항목의 제목, 요약, 상세 설명을 표시한다.
- 뒤로가기 버튼으로 목록 화면에 돌아올 수 있다.

검증 결과:

- `dart format lib\learning\labs\lab_t013_navigation_detail.dart lib\learning\lessons.dart test\widget_test.dart`: 통과
- `flutter analyze`: 통과, `No issues found!`
- `flutter test`: 통과, `All tests passed!`

사용자 런타임 체크리스트:

- [ ] `flutter run -d chrome` 또는 IDE 실행 버튼으로 앱을 실행한다.
- [ ] 메인 그리드에 `T-013` 버튼이 등록되어 있는지 확인한다.
- [ ] `T-013` 버튼을 눌렀을 때 `T-013 Navigation Detail` 화면으로 이동하는지 확인한다.
- [ ] `Route arguments` 항목을 탭하면 `Article Detail` 화면으로 이동하는지 확인한다.
- [ ] 상세 화면에 `Route arguments` 제목과 `Detail:` 문구가 보이는지 확인한다.
- [ ] 뒤로가기 버튼으로 목록 화면에 돌아오는지 확인한다.

개념 노트:

- `docs/concepts/t013-navigation-detail.md`

### T-012 Dismissible로 스와이프 삭제 리스트 만들기

목표:

- 리스트 항목을 옆으로 밀어 삭제하는 UI를 만든다.
- `Dismissible`의 `key`, `background`, `secondaryBackground`, `onDismissed` 역할을 익힌다.
- 삭제된 항목을 상태 리스트에서 제거하고 남은 항목 수를 갱신한다.

구현 파일:

- `lib/learning/labs/lab_t012_dismissible_list.dart`
- `lib/learning/lessons.dart`
- `test/widget_test.dart`
- `docs/concepts/t012-dismissible-list.md`

구현 결과:

- `LabT012DismissibleList` 위젯을 추가했다.
- T-012를 레슨 그리드에 등록했다.
- `Read docs`, `Write code`, `Run tests` 항목을 리스트로 표시한다.
- 항목을 옆으로 밀면 리스트에서 삭제된다.
- 삭제 후 `Remaining items: <개수>`와 `Removed: <항목>` 문구가 갱신된다.

검증 결과:

- `dart format lib\learning\labs\lab_t012_dismissible_list.dart lib\learning\lessons.dart test\widget_test.dart`: 통과
- `flutter analyze`: 통과, `No issues found!`
- `flutter test`: 통과, `All tests passed!`

사용자 런타임 체크리스트:

- [ ] `flutter run -d chrome` 또는 IDE 실행 버튼으로 앱을 실행한다.
- [ ] 메인 그리드에 `T-012` 버튼이 등록되어 있는지 확인한다.
- [ ] `T-012` 버튼을 눌렀을 때 `T-012 Dismissible List` 화면으로 이동하는지 확인한다.
- [ ] `Read docs`, `Write code`, `Run tests` 항목이 보이는지 확인한다.
- [ ] `Read docs` 항목을 옆으로 밀면 항목이 사라지는지 확인한다.
- [ ] 삭제 후 `Remaining items: 2`와 `Removed: Read docs`가 보이는지 확인한다.
- [ ] 뒤로가기 버튼으로 홈으로 돌아오는지 확인한다.

개념 노트:

- `docs/concepts/t012-dismissible-list.md`

### T-011 GestureDetector와 InkWell로 탭 제스처 다루기

목표:

- 터치 가능한 영역에 탭 제스처를 연결한다.
- `GestureDetector`의 `onTap`, `onDoubleTap`, `onLongPress` 역할을 익힌다.
- `InkWell`로 Material 탭 효과가 있는 영역을 만든다.
- 제스처 발생 시 `setState()`로 화면 문구와 횟수를 갱신한다.

구현 파일:

- `lib/learning/labs/lab_t011_gesture_input.dart`
- `lib/learning/lessons.dart`
- `test/widget_test.dart`
- `docs/concepts/t011-gesture-input.md`

구현 결과:

- `LabT011GestureInput` 위젯을 추가했다.
- T-011을 레슨 그리드에 등록했다.
- 파란 박스에서 탭, 더블탭, 길게 누르기를 감지한다.
- 초록색 `InkWell` 영역에서 Material 탭 효과와 탭 이벤트를 처리한다.
- 제스처가 발생하면 `Last gesture: <제스처>`와 `Gesture count: <횟수>` 문구가 갱신된다.

검증 결과:

- `dart format lib\learning\labs\lab_t011_gesture_input.dart lib\learning\lessons.dart test\widget_test.dart`: 통과
- `flutter analyze`: 통과, `No issues found!`
- `flutter test`: 통과, `All tests passed!`

사용자 런타임 체크리스트:

- [ ] `flutter run -d chrome` 또는 IDE 실행 버튼으로 앱을 실행한다.
- [ ] 메인 그리드에 `T-011` 버튼이 등록되어 있는지 확인한다.
- [ ] `T-011` 버튼을 눌렀을 때 `T-011 Gesture Input` 화면으로 이동하는지 확인한다.
- [ ] 파란 박스를 한 번 탭하면 `Last gesture: GestureDetector tap`이 보이는지 확인한다.
- [ ] 파란 박스를 길게 누르면 `Last gesture: GestureDetector long press`가 보이는지 확인한다.
- [ ] 초록색 영역을 탭하면 `Last gesture: InkWell tap`이 보이고 탭 효과가 나타나는지 확인한다.
- [ ] 제스처를 실행할 때마다 `Gesture count` 숫자가 증가하는지 확인한다.
- [ ] 뒤로가기 버튼으로 홈으로 돌아오는지 확인한다.

개념 노트:

- `docs/concepts/t011-gesture-input.md`

### T-010 Slider 숫자 입력 다루기

목표:

- 정해진 범위 안에서 숫자를 선택하는 입력을 만든다.
- `Slider`의 `value`, `min`, `max`, `divisions`, `onChanged` 역할을 익힌다.
- `double` 상태를 화면에 표시할 때 정수처럼 변환하는 방법을 익힌다.

구현 파일:

- `lib/learning/labs/lab_t010_slider_input.dart`
- `lib/learning/lessons.dart`
- `test/widget_test.dart`
- `docs/concepts/t010-slider-input.md`

구현 결과:

- `LabT010SliderInput` 위젯을 추가했다.
- T-010을 레슨 그리드에 등록했다.
- 0부터 100까지 볼륨 값을 선택할 수 있다.
- Slider를 움직이면 `Selected volume: <값>` 문구가 갱신된다.

검증 결과:

- `dart format lib\learning\labs\lab_t010_slider_input.dart lib\learning\lessons.dart test\widget_test.dart`: 통과
- `flutter analyze`: 통과, `No issues found!`
- `flutter test`: 통과, `All tests passed!`

사용자 런타임 체크리스트:

- [ ] `flutter run -d chrome` 또는 IDE 실행 버튼으로 앱을 실행한다.
- [ ] 메인 그리드에 `T-010` 버튼이 보이는지 확인한다.
- [ ] `T-010` 버튼을 눌렀을 때 `T-010 Slider Input` 화면으로 이동하는지 확인한다.
- [ ] 초기값이 `Selected volume: 40`으로 보이는지 확인한다.
- [ ] Slider를 움직이면 `Selected volume` 숫자가 바뀌는지 확인한다.
- [ ] 뒤로가기 버튼으로 홈으로 돌아오는지 확인한다.

개념 노트:

- `docs/concepts/t010-slider-input.md`

### T-009 Radio 단일 선택 다루기

목표:

- 여러 항목 중 하나만 선택하는 입력을 만든다.
- `RadioGroup`과 `RadioListTile`의 역할을 익힌다.
- 선택값을 상태로 저장하고 화면 문구를 갱신한다.

구현 파일:

- `lib/learning/labs/lab_t009_radio_selection.dart`
- `lib/learning/lessons.dart`
- `test/widget_test.dart`
- `docs/concepts/t009-radio-selection.md`

구현 결과:

- `LabT009RadioSelection` 위젯을 추가했다.
- T-009를 레슨 그리드에 등록했다.
- `Basic`, `Standard`, `Premium` 중 하나를 선택할 수 있다.
- 선택을 바꾸면 `Selected plan: <선택값>` 문구가 갱신된다.

검증 결과:

- `dart format lib\learning\labs\lab_t009_radio_selection.dart lib\learning\lessons.dart test\widget_test.dart`: 통과
- `flutter analyze`: 통과, `No issues found!`
- `flutter test`: 통과, `All tests passed!`

사용자 런타임 체크리스트:

- [ ] `flutter run -d chrome` 또는 IDE 실행 버튼으로 앱을 실행한다.
- [ ] 메인 그리드에 `T-009` 버튼이 보이는지 확인한다.
- [ ] `T-009` 버튼을 눌렀을 때 `T-009 Radio Selection` 화면으로 이동하는지 확인한다.
- [ ] 초기 선택이 `Basic`이고 `Selected plan: Basic`이 보이는지 확인한다.
- [ ] `Premium`을 선택하면 `Selected plan: Premium`이 보이는지 확인한다.
- [ ] 다시 `Standard`를 선택하면 하나만 선택된 상태로 바뀌는지 확인한다.
- [ ] 뒤로가기 버튼으로 홈으로 돌아오는지 확인한다.

개념 노트:

- `docs/concepts/t009-radio-selection.md`

### T-008 DropdownButton으로 선택 입력 다루기

목표:

- 미리 정한 선택지 중 하나를 선택하는 입력을 만든다.
- `DropdownButtonFormField`와 `DropdownMenuItem`의 역할을 익힌다.
- 선택값을 상태로 저장하고 화면 문구를 갱신한다.

구현 파일:

- `lib/learning/labs/lab_t008_dropdown_selection.dart`
- `lib/learning/lessons.dart`
- `test/widget_test.dart`
- `docs/concepts/t008-dropdown-selection.md`

구현 결과:

- `LabT008DropdownSelection` 위젯을 추가했다.
- T-008을 레슨 그리드에 등록했다.
- `Beginner`, `Intermediate`, `Advanced` 중 하나를 선택할 수 있다.
- 선택을 바꾸면 `Selected level: <선택값>` 문구가 갱신된다.

검증 결과:

- `dart format lib\learning\labs\lab_t008_dropdown_selection.dart lib\learning\lessons.dart test\widget_test.dart`: 통과
- `flutter analyze`: 통과, `No issues found!`
- `flutter test`: 통과, `All tests passed!`

사용자 런타임 체크리스트:

- [ ] `flutter run -d chrome` 또는 IDE 실행 버튼으로 앱을 실행한다.
- [ ] 메인 그리드에 `T-008` 버튼이 보이는지 확인한다.
- [ ] `T-008` 버튼을 눌렀을 때 `T-008 Dropdown Selection` 화면으로 이동하는지 확인한다.
- [ ] 드롭다운의 초기값이 `Beginner`인지 확인한다.
- [ ] `Advanced`를 선택하면 `Selected level: Advanced`가 보이는지 확인한다.
- [ ] 뒤로가기 버튼으로 홈으로 돌아오는지 확인한다.

개념 노트:

- `docs/concepts/t008-dropdown-selection.md`

### T-UI-002 Practice 화면 그리드 접근 추가

목표:

- `lib/learning/practice/` 아래 사용자가 작성한 practice 화면을 메인 UI에서 접근할 수 있게 한다.
- 레슨과 유사하게 grid 버튼으로 practice 화면을 열 수 있게 한다.
- 새 practice 파일은 registry에 등록해 확장할 수 있게 한다.

구현 파일:

- `lib/learning/lesson_home_screen.dart`
- `lib/learning/practice/practice_p001.dart`
- `lib/learning/practices.dart`
- `test/widget_test.dart`
- `docs/concepts/practice-screens.md`

구현 결과:

- 홈 화면을 `Lessons`와 `Practice` 섹션으로 분리했다.
- `practices.dart`를 추가해 practice 목록을 관리한다.
- 기존 `practice_p001.dart`의 `throw Scaffold(...)`를 `return Scaffold(...)`로 수정했다.
- `P-001` practice 버튼을 누르면 `PracticeP001Screen`으로 이동한다.

검증 결과:

- `dart format lib\learning\lesson_home_screen.dart lib\learning\practice\practice_p001.dart lib\learning\practices.dart test\widget_test.dart`: 통과
- `flutter analyze`: 통과, `No issues found!`
- `flutter test`: 통과, `All tests passed!`

사용자 런타임 체크리스트:

- [ ] `flutter run -d chrome` 또는 IDE 실행 버튼으로 앱을 실행한다.
- [ ] 메인 화면에 `Lessons` 섹션과 `Practice` 섹션이 보이는지 확인한다.
- [ ] `P-001` 버튼이 보이는지 확인한다.
- [ ] `P-001` 버튼을 누르면 `연습 001` 화면으로 이동하는지 확인한다.
- [ ] 뒤로가기 버튼으로 홈으로 돌아오는지 확인한다.

개념 노트:

- `docs/concepts/practice-screens.md`

### T-007 Checkbox와 Switch 입력 다루기

목표:

- `bool` 상태를 만든다.
- `CheckboxListTile`로 선택 여부를 다룬다.
- `SwitchListTile`로 켜짐/꺼짐 설정을 다룬다.
- `onChanged`에서 `setState()`로 상태를 갱신한다.

구현 파일:

- `lib/learning/labs/lab_t007_toggle_inputs.dart`
- `lib/learning/lessons.dart`
- `test/widget_test.dart`
- `docs/concepts/t007-toggle-inputs.md`

구현 결과:

- `LabT007ToggleInputs` 위젯을 추가했다.
- T-007을 레슨 그리드에 등록했다.
- `Accept terms` 체크박스를 탭하면 `Terms accepted`로 바뀐다.
- `Enable notifications` 스위치를 탭하면 `Notifications on`으로 바뀐다.

검증 결과:

- `dart format lib\learning\labs\lab_t007_toggle_inputs.dart lib\learning\lessons.dart test\widget_test.dart`: 통과
- `flutter analyze`: 통과, `No issues found!`
- `flutter test`: 통과, `All tests passed!`

사용자 런타임 체크리스트:

- [ ] `flutter run -d chrome` 또는 IDE 실행 버튼으로 앱을 실행한다.
- [ ] 메인 그리드에 `T-007` 버튼이 보이는지 확인한다.
- [ ] `T-007` 버튼을 눌렀을 때 `T-007 Toggle Inputs` 화면으로 이동하는지 확인한다.
- [ ] `Accept terms`를 탭하면 `Terms accepted`가 보이는지 확인한다.
- [ ] `Enable notifications`를 탭하면 `Notifications on`이 보이는지 확인한다.

개념 노트:

- `docs/concepts/t007-toggle-inputs.md`

### T-006 Form과 validation 기초

목표:

- `Form`으로 입력 필드를 묶는다.
- `TextFormField`와 `validator`로 입력값을 검사한다.
- `GlobalKey<FormState>`로 폼 상태에 접근한다.
- 제출 버튼에서 `validate()`를 실행한다.

구현 파일:

- `lib/learning/labs/lab_t006_form_validation.dart`
- `lib/learning/lessons.dart`
- `test/widget_test.dart`
- `docs/concepts/t006-form-validation.md`

구현 결과:

- `LabT006FormValidation` 위젯을 추가했다.
- T-006을 레슨 그리드에 등록했다.
- 빈 값 제출 시 `Name is required.` 오류를 표시한다.
- 1글자 입력 시 `Name must be at least 2 characters.` 오류를 표시한다.
- 유효한 이름 제출 시 `Submitted: <이름>`을 표시한다.

검증 결과:

- `dart format lib\learning\labs\lab_t006_form_validation.dart lib\learning\lessons.dart test\widget_test.dart`: 통과
- `flutter analyze`: 통과, `No issues found!`
- `flutter test`: 통과, `All tests passed!`

사용자 런타임 체크리스트:

- [ ] `flutter run -d chrome` 또는 IDE 실행 버튼으로 앱을 실행한다.
- [ ] 메인 그리드에 `T-006` 버튼이 보이는지 확인한다.
- [ ] `T-006` 버튼을 눌렀을 때 `T-006 Form Validation` 화면으로 이동하는지 확인한다.
- [ ] 빈 값으로 `Submit`을 눌렀을 때 `Name is required.`가 보이는지 확인한다.
- [ ] 한 글자만 입력하고 제출했을 때 `Name must be at least 2 characters.`가 보이는지 확인한다.
- [ ] `Ada`를 입력하고 제출했을 때 `Submitted: Ada`가 보이는지 확인한다.

개념 노트:

- `docs/concepts/t006-form-validation.md`

### T-UI-001 레슨 선택 그리드 홈 만들기

목표:

- 앱 메인 페이지에서 현재까지 진행한 레슨에 grid 버튼으로 접근한다.
- 새 레슨이 추가되면 목록에 항목을 추가해 grid 버튼을 늘릴 수 있게 한다.
- 각 버튼을 누르면 해당 레슨 화면으로 이동한다.

구현 파일:

- `lib/main.dart`
- `lib/learning/lesson_home_screen.dart`
- `lib/learning/lessons.dart`
- `lib/learning/labs/lab_t001_app_entry.dart`
- `test/widget_test.dart`
- `docs/concepts/lesson-grid-home.md`

구현 결과:

- `LessonHomeScreen`을 앱 첫 화면으로 연결했다.
- `GridView.builder`로 레슨 버튼을 렌더링한다.
- `LessonDefinition`과 `lessons` 목록을 추가했다.
- T-001부터 T-005까지 grid 버튼으로 접근할 수 있다.
- T-001의 `Hello, Flutter!` 화면을 `LabT001AppEntry`로 보존했다.
- T-001 레슨 화면에 `AppBar`를 추가해 그리드 홈으로 돌아갈 수 있게 했다.
- 각 버튼은 `Navigator.push`와 `MaterialPageRoute`로 레슨 화면을 연다.

검증 결과:

- `dart format lib\main.dart lib\learning\lesson_home_screen.dart lib\learning\lessons.dart lib\learning\labs\lab_t001_app_entry.dart test\widget_test.dart`: 통과
- `flutter analyze`: 통과, `No issues found!`
- `flutter test`: 통과, `All tests passed!`

사용자 런타임 체크리스트:

- [ ] `flutter run -d chrome` 또는 IDE 실행 버튼으로 앱을 실행한다.
- [ ] 메인 화면 앱바에 `Flutter Learning`이 보이는지 확인한다.
- [ ] T-001부터 T-005까지 grid 버튼이 보이는지 확인한다.
- [ ] `T-005` 버튼을 눌렀을 때 `T-005 TextField Input` 화면으로 이동하는지 확인한다.
- [ ] 뒤로가기 버튼으로 grid 홈으로 돌아오는지 확인한다.

개념 노트:

- `docs/concepts/lesson-grid-home.md`

### T-005 TextField로 사용자 입력 받기

목표:

- `TextField`로 사용자 입력을 받는다.
- `onChanged`에서 입력값을 상태로 저장한다.
- 입력값에 따라 화면 문구를 갱신한다.
- `TextEditingController`를 만들고 `dispose()`에서 정리한다.

구현 파일:

- `lib/main.dart`
- `lib/learning/labs/lab_t005_text_field_input.dart`
- `test/widget_test.dart`
- `docs/concepts/t005-text-field-input.md`

구현 결과:

- `LabT005TextFieldInput` 위젯을 추가했다.
- `TextField`에 `TextEditingController`를 연결했다.
- 입력 전에는 `Type your name above.`를 표시한다.
- 이름을 입력하면 `Hello, <입력값>`을 표시한다.
- `MyApp`은 `MaterialApp(home: LabT005TextFieldInput())`를 렌더링한다.

검증 결과:

- `dart format lib\main.dart lib\learning\labs\lab_t005_text_field_input.dart test\widget_test.dart`: 통과
- `flutter analyze`: 통과, `No issues found!`
- `flutter test`: 통과, `All tests passed!`

사용자 런타임 체크리스트:

- [ ] `flutter run -d chrome` 또는 IDE 실행 버튼으로 앱을 실행한다.
- [ ] 상단 앱바에 `T-005 TextField Input`이 보이는지 확인한다.
- [ ] 입력 전 `Type your name above.` 문구가 보이는지 확인한다.
- [ ] 이름 입력 칸에 텍스트를 입력한다.
- [ ] `Ada`를 입력하면 `Hello, Ada`처럼 문구가 바뀌는지 확인한다.
- [ ] 입력값을 지우면 안내 문구로 돌아오는지 확인한다.

개념 노트:

- `docs/concepts/t005-text-field-input.md`

참고:

- 런타임 확인은 사용자가 직접 수행하는 방식으로 체크리스트를 남겼다.
### T-004 Row와 Column으로 레이아웃 만들기

목표:

- `Column`으로 위젯을 세로로 배치한다.
- `Row`로 위젯을 가로로 배치한다.
- `Expanded`로 가로 공간을 나눠 쓰는 기본을 익힌다.
- `Padding`, `SizedBox`, `Container`로 여백과 박스 모양을 만든다.

구현 파일:

- `lib/main.dart`
- `lib/learning/labs/lab_t004_basic_layout.dart`
- `test/widget_test.dart`
- `docs/concepts/t004-basic-layout.md`

구현 결과:

- `LabT004BasicLayout` 위젯을 추가했다.
- `Column`으로 설명 문구와 `Row` 영역을 세로 배치했다.
- `Row` 안에 세 개의 `Expanded` 타일을 배치했다.
- `_LayoutTile` 보조 위젯으로 색상 타일 중복을 줄였다.
- `MyApp`은 `MaterialApp(home: LabT004BasicLayout())`를 렌더링한다.

검증 결과:

- `dart format lib\main.dart lib\learning\labs\lab_t004_basic_layout.dart test\widget_test.dart`: 통과
- `flutter analyze`: 통과, `No issues found!`
- `flutter test`: 통과, `All tests passed!`

사용자 런타임 체크리스트:

- [ ] `flutter run -d chrome` 또는 IDE 실행 버튼으로 앱을 실행한다.
- [ ] 상단 앱바에 `T-004 Basic Layout`이 보이는지 확인한다.
- [ ] `Column places widgets vertically.` 문구가 보이는지 확인한다.
- [ ] `Row places widgets horizontally.` 문구가 보이는지 확인한다.
- [ ] `One`, `Two`, `Three` 색상 타일이 가로로 나란히 보이는지 확인한다.
- [ ] 브라우저 폭을 줄여도 심한 overflow 오류가 없는지 확인한다.

개념 노트:

- `docs/concepts/t004-basic-layout.md`

참고:

- 런타임 확인은 사용자가 직접 수행하는 방식으로 체크리스트를 남겼다.
### T-003 버튼 탭으로 상태 바꾸기

목표:

- `StatefulWidget`과 `State`의 역할을 익힌다.
- 화면 값으로 쓰는 상태 변수 `_count`를 만든다.
- 버튼 탭 이벤트에서 `setState()`를 호출해 화면을 갱신한다.

구현 파일:

- `lib/main.dart`
- `lib/learning/labs/lab_t003_stateful_counter.dart`
- `test/widget_test.dart`

구현 결과:

- `LabT003StatefulCounter` 위젯을 추가했다.
- 초기 화면은 `Count: 0`을 표시한다.
- `Add one` 버튼을 누르면 `_count`가 1씩 증가한다.
- `setState()` 호출 후 화면 텍스트가 `Count: 1`, `Count: 2`로 갱신된다.
- `MyApp`은 `MaterialApp(home: LabT003StatefulCounter())`를 렌더링한다.

검증 결과:

- `dart format lib\main.dart lib\learning\labs\lab_t003_stateful_counter.dart test\widget_test.dart`: 통과
- `flutter analyze`: 통과, `No issues found!`
- `flutter test`: 통과, `All tests passed!`

사용자 런타임 체크리스트:

- [ ] `flutter run -d chrome` 또는 IDE 실행 버튼으로 앱을 실행한다.
- [ ] 상단 앱바에 `T-003 StatefulWidget`이 보이는지 확인한다.
- [ ] 초기 값이 `Count: 0`인지 확인한다.
- [ ] `Add one` 버튼을 한 번 누르면 `Count: 1`로 바뀌는지 확인한다.
- [ ] `Add one` 버튼을 다시 누르면 `Count: 2`로 바뀌는지 확인한다.
- [ ] Hot reload 후에도 버튼 탭 동작이 정상인지 확인한다.

참고:

- 런타임 확인은 사용자가 직접 수행하는 방식으로 체크리스트를 남겼다.

### T-002 StatelessWidget과 Text 위젯 기초

목표:

- 별도 파일에 `StatelessWidget` 화면을 만든다.
- `Text` 위젯으로 고정된 문자열을 표시한다.
- `main.dart`에서 실습 화면을 `MaterialApp.home`으로 연결한다.

구현 파일:

- `lib/main.dart`
- `lib/learning/labs/lab_t002_stateless_text.dart`
- `test/widget_test.dart`

구현 결과:

- `LabT002StatelessText` 위젯을 추가했다.
- 화면 제목은 `T-002 StatelessWidget`으로 표시한다.
- 본문은 세 개의 `Text` 위젯을 `Column`으로 배치한다.
- `MyApp`은 `MaterialApp(home: LabT002StatelessText())`를 렌더링한다.

검증 결과:

- `dart format lib\main.dart lib\learning\labs\lab_t002_stateless_text.dart test\widget_test.dart`: 통과
- `flutter analyze`: 통과, `No issues found!`
- `flutter test`: 통과, `All tests passed!`

사용자 런타임 체크리스트:

- [ ] `flutter run -d chrome` 또는 IDE 실행 버튼으로 앱을 실행한다.
- [ ] 상단 앱바에 `T-002 StatelessWidget`이 보이는지 확인한다.
- [ ] 화면 중앙에 `Hello, Flutter!`가 보이는지 확인한다.
- [ ] `This screen is a StatelessWidget.` 문구가 보이는지 확인한다.
- [ ] `Text widgets show fixed content.` 문구가 보이는지 확인한다.
- [ ] Hot reload 후에도 같은 정적 문구들이 유지되는지 확인한다.

참고:

- 런타임 확인은 사용자가 직접 수행하는 방식으로 체크리스트를 남겼다.

### T-001 Flutter 앱 진입점과 가장 작은 MaterialApp 만들기

목표:

- Flutter 앱의 가장 작은 실행 구조를 만든다.
- `main()`에서 `runApp()`으로 앱을 시작한다.
- `StatelessWidget`, `MaterialApp`, `Scaffold`, `Text`만 사용해 첫 화면을 렌더링한다.

구현 파일:

- `lib/main.dart`
- `test/widget_test.dart`

구현 결과:

- 기존 제스처 실험 코드를 제거하고 `Hello, Flutter!`를 표시하는 최소 앱으로 정리했다.
- 위젯 테스트에서 `MaterialApp`, `Scaffold`, `Hello, Flutter!` 렌더링을 검증했다.

검증 결과:

- `dart format lib\main.dart test\widget_test.dart`: 통과
- `flutter analyze`: 통과, `No issues found!`
- `flutter test`: 통과, `All tests passed!`

사용자 런타임 체크리스트:

- [x] `flutter run -d chrome` 또는 IDE 실행 버튼으로 앱을 실행한다. 사용자 확인 완료.
- [x] 첫 화면 중앙에 `Hello, Flutter!`가 보이는지 확인한다. 사용자 확인 완료.
- [x] 빨간 오류 화면이나 콘솔 예외가 없는지 확인한다. 사용자 확인 완료.
- [x] Hot reload를 한 번 실행했을 때 앱이 유지되는지 확인한다. 사용자 확인 완료.

참고:

- 이 환경에서는 Chrome/Edge 디버그 연결이 실패했고, Windows 데스크톱 타깃은 프로젝트에 구성되어 있지 않았다.
- 사용자가 직접 런타임 확인을 수행하기로 했으므로 체크리스트를 산출물로 남겼다.

### T-000 학습 하네스 운영 체계 정립

목표:

- 앞으로의 Flutter 학습을 태스크 단위로 등록, 계획, 구현, 검증, 완료 처리할 수 있게 문서 하네스를 보강합니다.

완료 기록:

- 태스크 장부 추가
- 태스크 템플릿 추가
- 실행 절차 runbook 추가
- 하네스 문서에 운영 흐름 반영











































