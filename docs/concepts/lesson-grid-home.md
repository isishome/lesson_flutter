# Lesson Grid Home

이 문서는 앱 첫 화면에서 레슨을 grid 버튼으로 접근하게 만든 구조를 설명합니다.

## 목적

기존에는 `main.dart`가 항상 최신 실습 화면 하나만 보여줬습니다. 이제는 `LessonHomeScreen`을 첫 화면으로 사용하고, 각 레슨을 grid 버튼으로 선택할 수 있습니다.

## 코드 구조

```text
main.dart
  MyApp
    MaterialApp
      home: LessonHomeScreen

learning/lesson_home_screen.dart
  LessonHomeScreen
    Scaffold
      AppBar
      GridView.builder
        _LessonTile
          OutlinedButton
            Navigator.push(...)

learning/lessons.dart
  LessonDefinition
  lessons
    T-001 -> LabT001AppEntry
    T-002 -> LabT002StatelessText
    T-003 -> LabT003StatefulCounter
    T-004 -> LabT004BasicLayout
    T-005 -> LabT005TextFieldInput
```

## LessonDefinition

`LessonDefinition`은 레슨 버튼 하나에 필요한 정보를 담는 클래스입니다.

```dart
class LessonDefinition {
  const LessonDefinition({
    required this.id,
    required this.title,
    required this.summary,
    required this.builder,
  });

  final String id;
  final String title;
  final String summary;
  final WidgetBuilder builder;
}
```

역할:

- `id`: 태스크 번호입니다. 예: `T-005`
- `title`: grid 버튼에 표시할 제목입니다.
- `summary`: 짧은 설명입니다.
- `builder`: 버튼을 눌렀을 때 열 화면을 만듭니다.

## lessons 목록

새 레슨을 grid에 추가하려면 `lessons` 목록에 항목을 하나 추가합니다.

```dart
LessonDefinition(
  id: 'T-006',
  title: 'Form Validation',
  summary: 'Form and validator',
  builder: (_) => const LabT006FormValidation(),
),
```

이 목록이 `GridView.builder`의 데이터 원본입니다.

## LessonHomeScreen

`LessonHomeScreen`은 앱의 메인 페이지입니다.

```dart
return Scaffold(
  appBar: AppBar(title: const Text('Flutter Learning')),
  body: GridView.builder(...),
);
```

역할:

- 레슨 목록을 grid로 표시합니다.
- 각 항목을 `_LessonTile`로 렌더링합니다.

## GridView.builder

`GridView.builder`는 목록 데이터를 grid 형태로 렌더링합니다.

```dart
GridView.builder(
  itemCount: lessons.length,
  itemBuilder: (context, index) {
    final lesson = lessons[index];
    return _LessonTile(lesson: lesson);
  },
)
```

역할:

- `lessons.length`만큼 버튼을 만듭니다.
- 새 레슨이 목록에 추가되면 grid 버튼도 자동으로 늘어납니다.

## SliverGridDelegateWithMaxCrossAxisExtent

grid 셀의 크기 규칙을 정합니다.

```dart
SliverGridDelegateWithMaxCrossAxisExtent(
  maxCrossAxisExtent: 220,
  mainAxisSpacing: 12,
  crossAxisSpacing: 12,
  childAspectRatio: 1.45,
)
```

의미:

- `maxCrossAxisExtent`: 한 셀의 최대 가로 폭입니다.
- `mainAxisSpacing`: 세로 방향 간격입니다.
- `crossAxisSpacing`: 가로 방향 간격입니다.
- `childAspectRatio`: 셀의 가로/세로 비율입니다.

## OutlinedButton

각 레슨 버튼은 `OutlinedButton`입니다.

```dart
OutlinedButton(
  onPressed: () {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: lesson.builder),
    );
  },
  child: ...,
)
```

역할:

- 클릭 가능한 레슨 카드 역할을 합니다.
- 버튼을 누르면 해당 레슨 화면으로 이동합니다.

## Navigator.push

`Navigator.push`는 새 화면을 현재 화면 위에 쌓습니다.

```dart
Navigator.of(context).push(
  MaterialPageRoute<void>(builder: lesson.builder),
);
```

흐름:

1. 사용자가 레슨 버튼을 누릅니다.
2. `lesson.builder`가 해당 레슨 화면 위젯을 만듭니다.
3. `MaterialPageRoute`가 새 화면 전환을 준비합니다.
4. `Navigator`가 새 화면을 엽니다.
5. 앱바의 뒤로가기 버튼으로 홈으로 돌아올 수 있습니다.

## T-001 화면 보존

T-001은 원래 `main.dart`에 직접 있던 가장 작은 앱 구조였습니다. grid에서 다시 접근할 수 있도록 아래 파일로 보존했습니다.

```text
lib/learning/labs/lab_t001_app_entry.dart
```

이 화면은 `Hello, Flutter!`만 표시합니다.

## 새 레슨 추가 절차

1. `lib/learning/labs/`에 새 실습 위젯 파일을 만듭니다.
2. `lib/learning/lessons.dart`에 import를 추가합니다.
3. `lessons` 목록에 `LessonDefinition`을 추가합니다.
4. `test/widget_test.dart`에서 새 버튼과 이동을 필요에 따라 검증합니다.
5. `docs/concepts/`에 태스크별 개념 노트를 추가합니다.

## 기억할 것

- 메인 페이지는 `LessonHomeScreen`입니다.
- grid 버튼은 `lessons` 목록에서 자동 생성됩니다.
- 새 레슨을 추가할 때는 `lessons` 목록에 항목을 append하면 됩니다.
- 화면 이동은 `Navigator.push`와 `MaterialPageRoute`로 처리합니다.


