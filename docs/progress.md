# Learning Progress

## 2026-06-30

상태:

- Flutter 기본 스캐폴딩 프로젝트 확인
- 학습용 문서 하네스 추가
- `lib/learning/`, `test/learning/` 구조 추가

관찰:

- `lib/main.dart`에는 제스처와 스와이프 삭제를 실험한 코드가 있습니다.
- 한글 문자열이 깨져 있어 코드 읽기와 테스트 작성 전에 정리가 필요합니다.
- `test/widget_test.dart`는 기본 카운터 예제를 기준으로 되어 있어 현재 화면과 맞지 않습니다.
- Git 저장소는 아직 초기화되어 있지 않습니다.

다음 액션:

1. T-001 `Flutter 앱 진입점과 가장 작은 MaterialApp 만들기`를 활성화합니다.
2. 현재 구현 코드를 기준으로 삼지 않고 가장 작은 Flutter 앱부터 다시 작성합니다.
3. 구현, 테스트, 분석, 런타임 확인 후 완료 처리합니다.

## 운영 원칙 갱신

2026-06-30 기준 운영 방식:

- 현재 구현된 코드는 학습 기준으로 삼지 않습니다.
- 모든 학습 요청은 `docs/tasks.md`에 태스크로 등록합니다.
- 학습 에이전트가 계획, 구현, 테스트 작성, 정적 분석, 테스트 실행, 런타임 확인, 완료 처리를 담당합니다.
- 완료 기준은 `docs/runbook.md`의 태스크 완료 판정을 따릅니다.
## T-001 완료 기록

날짜: 2026-06-30

태스크: Flutter 앱 진입점과 가장 작은 MaterialApp 만들기

구현:

- `lib/main.dart`를 가장 작은 Flutter 앱 구조로 재작성했습니다.
- `main()`에서 `runApp(const MyApp())`을 호출합니다.
- `MyApp`은 `StatelessWidget`이며 `MaterialApp`, `Scaffold`, `Text('Hello, Flutter!')`만 렌더링합니다.
- `test/widget_test.dart`에서 첫 화면 렌더링을 검증합니다.

검증:

- `dart format lib\main.dart test\widget_test.dart`: 통과
- `flutter analyze`: 통과
- `flutter test`: 통과

런타임:

- 사용자가 직접 확인하기로 했습니다.
- 체크리스트는 `docs/tasks.md`의 T-001 완료 기록에 남겼습니다.

## T-002 완료 기록

날짜: 2026-06-30

태스크: StatelessWidget과 Text 위젯 기초

구현:

- `lib/learning/labs/lab_t002_stateless_text.dart`에 `LabT002StatelessText`를 추가했습니다.
- `main.dart`에서 `MaterialApp.home`을 `LabT002StatelessText`로 연결했습니다.
- 세 개의 `Text` 위젯으로 정적 문자열을 화면 중앙에 표시했습니다.
- `test/widget_test.dart`에서 앱 연결과 실습 화면의 텍스트 렌더링을 검증했습니다.

검증:

- `dart format lib\main.dart lib\learning\labs\lab_t002_stateless_text.dart test\widget_test.dart`: 통과
- `flutter analyze`: 통과
- `flutter test`: 통과

런타임:

- 사용자가 직접 확인합니다.
- 체크리스트는 `docs/tasks.md`의 T-002 완료 기록에 남겼습니다.

## T-003 완료 기록

날짜: 2026-07-01

태스크: 버튼 탭으로 상태 바꾸기

다음 레슨 설명:

- T-003은 `StatefulWidget`을 처음 사용하는 단계입니다.
- `StatelessWidget`은 고정 화면에 적합하지만, 사용자의 행동으로 화면 값이 바뀌려면 상태가 필요합니다.
- 이번 실습에서는 버튼을 누를 때 `_count` 값을 바꾸고 `setState()`로 화면을 다시 그립니다.

구현:

- `lib/learning/labs/lab_t003_stateful_counter.dart`에 `LabT003StatefulCounter`를 추가했습니다.
- `main.dart`에서 `MaterialApp.home`을 `LabT003StatefulCounter`로 연결했습니다.
- `Add one` 버튼을 누르면 `Count: 0`에서 `Count: 1`, `Count: 2`로 증가합니다.
- `test/widget_test.dart`에서 앱 연결과 버튼 탭 후 상태 변경을 검증했습니다.

검증:

- `dart format lib\main.dart lib\learning\labs\lab_t003_stateful_counter.dart test\widget_test.dart`: 통과
- `flutter analyze`: 통과
- `flutter test`: 통과

런타임:

- 사용자가 직접 확인합니다.
- 체크리스트는 `docs/tasks.md`의 T-003 완료 기록에 남겼습니다.
## 개념 설명 보강

날짜: 2026-07-01

요청:

- `Scaffold`, `AppBar` 같은 클래스와 내부 구조 설명도 학습 자료에 포함해야 한다.

반영:

- `docs/concepts/widgets-t001-t003.md`를 추가했습니다.
- T-001부터 T-003까지 등장한 주요 클래스와 위젯 구조를 설명했습니다.
- 이후 레슨에서도 새 위젯이나 클래스가 나오면 개념 노트를 함께 갱신하는 기준을 `docs/harness.md`에 추가했습니다.
## 개념 노트 파일 분리

날짜: 2026-07-01

요청:

- `widgets-t001-t003.md`처럼 묶지 말고 태스크별 파일을 별개로 만든다.

반영:

- `docs/concepts/t001-app-entry.md`를 추가했습니다.
- `docs/concepts/t002-stateless-text.md`를 추가했습니다.
- `docs/concepts/t003-stateful-counter.md`를 추가했습니다.
- 기존 `docs/concepts/widgets-t001-t003.md`는 개념 노트 인덱스로 변경했습니다.
- `docs/harness.md`의 운영 기준을 태스크별 개별 개념 파일 방식으로 수정했습니다.
## T-004 완료 기록

날짜: 2026-07-01

태스크: Row와 Column으로 레이아웃 만들기

다음 레슨 설명:

- T-004는 위젯을 가로와 세로로 배치하는 기본 레이아웃 단계입니다.
- `Column`은 세로 배치, `Row`는 가로 배치입니다.
- `Expanded`는 `Row` 안에서 남는 가로 공간을 나눠 갖게 합니다.

구현:

- `lib/learning/labs/lab_t004_basic_layout.dart`에 `LabT004BasicLayout`을 추가했습니다.
- `main.dart`에서 `MaterialApp.home`을 `LabT004BasicLayout`으로 연결했습니다.
- `Column`, `Row`, `Expanded`, `Padding`, `SizedBox`, `Container`를 사용했습니다.
- `test/widget_test.dart`에서 앱 연결과 주요 레이아웃 위젯 렌더링을 검증했습니다.
- `docs/concepts/t004-basic-layout.md`에 개념 설명을 추가했습니다.

검증:

- `dart format lib\main.dart lib\learning\labs\lab_t004_basic_layout.dart test\widget_test.dart`: 통과
- `flutter analyze`: 통과
- `flutter test`: 통과

런타임:

- 사용자가 직접 확인합니다.
- 체크리스트는 `docs/tasks.md`의 T-004 완료 기록에 남겼습니다.
## T-005 완료 기록

날짜: 2026-07-01

태스크: TextField로 사용자 입력 받기

다음 레슨 설명:

- T-005는 사용자 입력을 받는 첫 단계입니다.
- `TextField`는 키보드 입력을 받는 위젯입니다.
- `onChanged`에서 입력값을 상태로 저장하고, `setState()`로 화면을 갱신합니다.

구현:

- `lib/learning/labs/lab_t005_text_field_input.dart`에 `LabT005TextFieldInput`을 추가했습니다.
- `main.dart`에서 `MaterialApp.home`을 `LabT005TextFieldInput`으로 연결했습니다.
- `TextField`, `TextEditingController`, `InputDecoration`, `OutlineInputBorder`, `onChanged`, `dispose()`를 사용했습니다.
- `test/widget_test.dart`에서 앱 연결과 입력 후 문구 변경을 검증했습니다.
- `docs/concepts/t005-text-field-input.md`에 개념 설명을 추가했습니다.

검증:

- `dart format lib\main.dart lib\learning\labs\lab_t005_text_field_input.dart test\widget_test.dart`: 통과
- `flutter analyze`: 통과
- `flutter test`: 통과

런타임:

- 사용자가 직접 확인합니다.
- 체크리스트는 `docs/tasks.md`의 T-005 완료 기록에 남겼습니다.
## T-UI-001 완료 기록

날짜: 2026-07-01

태스크: 레슨 선택 그리드 홈 만들기

구현:

- 앱 첫 화면을 `LessonHomeScreen`으로 변경했습니다.
- `lib/learning/lessons.dart`에 레슨 목록 데이터 구조를 추가했습니다.
- `GridView.builder`로 T-001부터 T-005까지 버튼을 렌더링합니다.
- 버튼을 누르면 `Navigator.push`로 해당 레슨 화면을 엽니다.
- T-001 화면을 다시 접근할 수 있도록 `LabT001AppEntry`를 추가했습니다.
- `docs/concepts/lesson-grid-home.md`에 구조 설명을 추가했습니다.

검증:

- `dart format lib\main.dart lib\learning\lesson_home_screen.dart lib\learning\lessons.dart lib\learning\labs\lab_t001_app_entry.dart test\widget_test.dart`: 통과
- `flutter analyze`: 통과
- `flutter test`: 통과

런타임:

- 사용자가 직접 확인합니다.
- 체크리스트는 `docs/tasks.md`의 T-UI-001 완료 기록에 남겼습니다.

## T-UI-001 보강 기록

날짜: 2026-07-01

문제:

- T-001 레슨에 진입하면 `AppBar`가 없어 뒤로가기 버튼이 보이지 않았습니다.

수정:

- `lib/learning/labs/lab_t001_app_entry.dart`에 `AppBar(title: Text('T-001 App Entry'))`를 추가했습니다.
- `test/widget_test.dart`에 T-001 진입 후 back 버튼으로 그리드 홈에 복귀하는 테스트를 추가했습니다.

검증:

- `dart format lib\learning\labs\lab_t001_app_entry.dart test\widget_test.dart`: 통과
- `flutter analyze`: 통과
- `flutter test`: 통과

## T-006 완료 기록

날짜: 2026-07-01

태스크: Form과 validation 기초

구현:

- `lib/learning/labs/lab_t006_form_validation.dart`에 `LabT006FormValidation`을 추가했습니다.
- `lib/learning/lessons.dart`에 T-006 레슨을 등록했습니다.
- `Form`, `TextFormField`, `GlobalKey<FormState>`, `validator`, `validate()`를 사용했습니다.
- `test/widget_test.dart`에서 빈 값 오류와 유효한 제출 결과를 검증했습니다.
- `docs/concepts/t006-form-validation.md`에 개념 설명을 추가했습니다.

검증:

- `dart format lib\learning\labs\lab_t006_form_validation.dart lib\learning\lessons.dart test\widget_test.dart`: 통과
- `flutter analyze`: 통과
- `flutter test`: 통과

런타임:

- 사용자가 직접 확인합니다.
- 체크리스트는 `docs/tasks.md`의 T-006 완료 기록에 남겼습니다.
## T-007 완료 기록

날짜: 2026-07-02

태스크: Checkbox와 Switch 입력 다루기

구현:

- `lib/learning/labs/lab_t007_toggle_inputs.dart`에 `LabT007ToggleInputs`를 추가했습니다.
- `lib/learning/lessons.dart`에 T-007 레슨을 등록했습니다.
- `CheckboxListTile`, `SwitchListTile`, `bool` 상태, `onChanged`, `setState()`를 사용했습니다.
- `test/widget_test.dart`에서 체크박스와 스위치 토글 후 상태 문구 변경을 검증했습니다.
- `docs/concepts/t007-toggle-inputs.md`에 개념 설명을 추가했습니다.

검증:

- `dart format lib\learning\labs\lab_t007_toggle_inputs.dart lib\learning\lessons.dart test\widget_test.dart`: 통과
- `flutter analyze`: 통과
- `flutter test`: 통과

런타임:

- 사용자가 직접 확인합니다.
- 체크리스트는 `docs/tasks.md`의 T-007 완료 기록에 남겼습니다.
## T-UI-002 완료 기록

날짜: 2026-07-02

태스크: Practice 화면 그리드 접근 추가

구현:

- `lib/learning/practices.dart`를 추가했습니다.
- 홈 화면을 `Lessons`와 `Practice` 섹션으로 분리했습니다.
- 기존 `practice_p001.dart`의 `throw Scaffold(...)`를 `return Scaffold(...)`로 수정했습니다.
- `P-001` 버튼으로 `PracticeP001Screen`에 접근할 수 있게 했습니다.
- `docs/concepts/practice-screens.md`에 practice 등록 절차를 추가했습니다.

검증:

- `dart format lib\learning\lesson_home_screen.dart lib\learning\practice\practice_p001.dart lib\learning\practices.dart test\widget_test.dart`: 통과
- `flutter analyze`: 통과
- `flutter test`: 통과

런타임:

- 사용자가 직접 확인합니다.
- 체크리스트는 `docs/tasks.md`의 T-UI-002 완료 기록에 남겼습니다.
## T-008 완료 기록

날짜: 2026-07-02

태스크: DropdownButton으로 선택 입력 다루기

구현:

- `lib/learning/labs/lab_t008_dropdown_selection.dart`에 `LabT008DropdownSelection`을 추가했습니다.
- `lib/learning/lessons.dart`에 T-008 레슨을 등록했습니다.
- `DropdownButtonFormField`, `DropdownMenuItem`, 선택 상태, `onChanged`, `setState()`를 사용했습니다.
- `test/widget_test.dart`에서 드롭다운 선택 후 상태 문구 변경을 검증했습니다.
- `docs/concepts/t008-dropdown-selection.md`에 개념 설명을 추가했습니다.

검증:

- `dart format lib\learning\labs\lab_t008_dropdown_selection.dart lib\learning\lessons.dart test\widget_test.dart`: 통과
- `flutter analyze`: 통과
- `flutter test`: 통과

런타임:

- 사용자가 직접 확인합니다.
- 체크리스트는 `docs/tasks.md`의 T-008 완료 기록에 남겼습니다.
## T-009 완료 기록

날짜: 2026-07-02

태스크: Radio 단일 선택 다루기

구현:

- `lib/learning/labs/lab_t009_radio_selection.dart`에 `LabT009RadioSelection`을 추가했습니다.
- `lib/learning/lessons.dart`에 T-009 레슨을 등록했습니다.
- `RadioGroup`, `RadioListTile`, 선택 상태, `onChanged`, `setState()`를 사용했습니다.
- `test/widget_test.dart`에서 radio 선택 후 상태 문구 변경을 검증했습니다.
- `docs/concepts/t009-radio-selection.md`에 개념 설명을 추가했습니다.

검증:

- `dart format lib\learning\labs\lab_t009_radio_selection.dart lib\learning\lessons.dart test\widget_test.dart`: 통과
- `flutter analyze`: 통과
- `flutter test`: 통과

런타임:

- 사용자가 직접 확인합니다.
- 체크리스트는 `docs/tasks.md`의 T-009 완료 기록에 남겼습니다.
## T-010 완료 기록

날짜: 2026-07-02

태스크: Slider 숫자 입력 다루기

구현:

- `lib/learning/labs/lab_t010_slider_input.dart`에 `LabT010SliderInput`을 추가했습니다.
- `lib/learning/lessons.dart`에 T-010 레슨을 등록했습니다.
- `Slider`, `double` 상태, `min`, `max`, `divisions`, `onChanged`, `setState()`를 사용했습니다.
- `test/widget_test.dart`에서 Slider 드래그 후 상태 문구 변경을 검증했습니다.
- `docs/concepts/t010-slider-input.md`에 개념 설명을 추가했습니다.

검증:

- `dart format lib\learning\labs\lab_t010_slider_input.dart lib\learning\lessons.dart test\widget_test.dart`: 통과
- `flutter analyze`: 통과
- `flutter test`: 통과

런타임:

- 사용자가 직접 확인합니다.
- 체크리스트는 `docs/tasks.md`의 T-010 완료 기록에 남겼습니다.



## T-011 완료 기록

날짜: 2026-07-03

태스크: GestureDetector와 InkWell로 탭 제스처 다루기

구현:

- `lib/learning/labs/lab_t011_gesture_input.dart`에 `LabT011GestureInput`을 추가했습니다.
- `lib/learning/lessons.dart`에 T-011 레슨을 등록했습니다.
- `GestureDetector`, `InkWell`, `Material`, 탭/길게 누르기 콜백, `setState()`를 사용했습니다.
- `test/widget_test.dart`에서 GestureDetector 탭, 더블탭, 길게 누르기, InkWell 탭 후 상태 문구 변경을 검증했습니다.
- `docs/concepts/t011-gesture-input.md`에 개념 설명을 추가했습니다.

검증:

- `dart format lib\learning\labs\lab_t011_gesture_input.dart lib\learning\lessons.dart test\widget_test.dart`: 통과
- `flutter analyze`: 통과, `No issues found!`
- `flutter test`: 통과, `All tests passed!`

런타임:

- 사용자가 직접 확인합니다.
- 체크리스트는 `docs/tasks.md`의 T-011 완료 기록에 남겼습니다.



## T-012 완료 기록

날짜: 2026-07-03

태스크: Dismissible로 스와이프 삭제 리스트 만들기

구현:

- `lib/learning/labs/lab_t012_dismissible_list.dart`에 `LabT012DismissibleList`를 추가했습니다.
- `lib/learning/lessons.dart`에 T-012 레슨을 등록했습니다.
- `Dismissible`, `ListView.builder`, `ListTile`, `ValueKey`, `onDismissed`, `setState()`를 사용했습니다.
- `test/widget_test.dart`에서 스와이프 후 항목 삭제, 남은 개수, 삭제 결과 문구 변경을 검증했습니다.
- `docs/concepts/t012-dismissible-list.md`에 개념 설명을 추가했습니다.

검증:

- `dart format lib\learning\labs\lab_t012_dismissible_list.dart lib\learning\lessons.dart test\widget_test.dart`: 통과
- `flutter analyze`: 통과, `No issues found!`
- `flutter test`: 통과, `All tests passed!`

런타임:

- 사용자가 직접 확인합니다.
- 체크리스트는 `docs/tasks.md`의 T-012 완료 기록에 남겼습니다.

## T-013 완료 기록

날짜: 2026-07-03

태스크: Navigator로 목록에서 상세 화면 이동하기

구현:

- `lib/learning/labs/lab_t013_navigation_detail.dart`에 `LabT013NavigationDetail`을 추가했습니다.
- `lib/learning/lessons.dart`에 T-013 레슨을 등록했습니다.
- `Navigator.push`, `MaterialPageRoute`, `ListView.separated`, `ListTile.onTap`, 생성자 인자 전달을 사용했습니다.
- `test/widget_test.dart`에서 목록 항목 탭 후 상세 화면 이동, 데이터 표시, 뒤로가기 복귀를 검증했습니다.
- `docs/concepts/t013-navigation-detail.md`에 개념 설명을 추가했습니다.

검증:

- `dart format lib\learning\labs\lab_t013_navigation_detail.dart lib\learning\lessons.dart test\widget_test.dart`: 통과
- `flutter analyze`: 통과, `No issues found!`
- `flutter test`: 통과, `All tests passed!`

런타임:

- 사용자가 직접 확인합니다.
- 체크리스트는 `docs/tasks.md`의 T-013 완료 기록에 남겼습니다.
