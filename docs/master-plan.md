# Flutter Learning Master Plan

이 문서는 `first_flutter_app`에서 Flutter를 처음 학습할 때 사용할 큰 흐름입니다. 목표는 "예제를 따라 치는 것"이 아니라, 작은 실습을 반복하면서 위젯, 상태, 레이아웃, 네비게이션, 비동기 처리, 테스트를 직접 설명할 수 있는 수준까지 가는 것입니다.

## 학습 원칙

- 한 번에 하나의 개념만 바꿉니다.
- 실습은 항상 실행 가능한 앱 상태로 끝냅니다.
- `lib/main.dart`는 현재 실습을 보여주는 진입점으로 사용합니다.
- 학습용 코드는 `lib/learning/` 아래에 모으고, 검증 코드는 `test/learning/` 아래에 둡니다.
- `build/`, `.dart_tool/` 같은 생성물은 학습 기록이나 코드 리뷰 대상에서 제외합니다.
- 매 실습은 `docs/tasks.md`에 태스크로 등록하고, 구현/테스트/런타임 확인 후 `docs/progress.md`에 결과를 기록합니다.

## 단계별 로드맵

### 0. 환경과 프로젝트 감 잡기

목표:

- Flutter 프로젝트의 기본 폴더 역할을 설명합니다.
- `flutter run`, `flutter test`, `flutter analyze`의 차이를 이해합니다.
- Hot reload와 hot restart가 언제 다른지 확인합니다.

완료 기준:

- `lib/main.dart`의 `runApp`, `MaterialApp`, `Scaffold` 역할을 말로 설명할 수 있습니다.
- 기본 위젯 테스트가 현재 앱과 맞게 통과합니다.

### 1. Dart 기초

목표:

- 변수, 함수, 클래스, nullable 타입, collection 문법을 익힙니다.
- `final`, `const`, `var`의 차이를 코드로 확인합니다.

실습 예시:

- 간단한 Todo 모델 만들기
- 리스트 필터링과 정렬 함수 작성
- null-safe 함수 작성

완료 기준:

- 작은 순수 Dart 함수에 대해 단위 테스트를 작성할 수 있습니다.

### 2. 위젯과 레이아웃

목표:

- StatelessWidget과 StatefulWidget의 차이를 이해합니다.
- Row, Column, Stack, Expanded, Padding, Align, ListView를 사용합니다.
- constraints 기반 레이아웃 사고를 익힙니다.

실습 예시:

- 프로필 카드 화면
- 반응형 카운터 패널
- 스크롤 가능한 리스트

완료 기준:

- 화면이 작아져도 overflow가 나지 않는 레이아웃을 만들 수 있습니다.

### 3. 상태 관리 기초

목표:

- `setState`의 역할과 한계를 이해합니다.
- 상태를 위젯 내부 상태와 모델 상태로 나누어 생각합니다.

실습 예시:

- 카운터 변형
- Todo 추가, 삭제, 완료 토글
- 입력 폼 상태 관리

완료 기준:

- 상태 변경 원인과 UI 갱신 흐름을 설명할 수 있습니다.

### 4. 입력, 제스처, 폼

목표:

- GestureDetector, InkWell, TextField, Form, Validator를 사용합니다.
- 사용자 입력을 검증하고 피드백을 표시합니다.

실습 예시:

- 스와이프 삭제 리스트
- 로그인 폼 UI
- 검색 필터 입력

완료 기준:

- 잘못된 입력에 대한 UI 피드백을 구현할 수 있습니다.

### 5. 네비게이션과 화면 분리

목표:

- Navigator, route, argument 전달 방식을 익힙니다.
- 화면 단위로 파일을 나누고 책임을 분리합니다.

실습 예시:

- 목록 화면에서 상세 화면 이동
- 설정 화면 추가
- BottomNavigationBar 또는 NavigationRail 실습

완료 기준:

- 2개 이상의 화면을 자연스럽게 연결할 수 있습니다.

### 6. 비동기와 외부 데이터

목표:

- Future, async/await, FutureBuilder를 이해합니다.
- 로딩, 성공, 실패 상태를 UI로 표현합니다.

실습 예시:

- fake repository로 지연 응답 만들기
- 공개 API 호출 화면
- 에러 재시도 버튼

완료 기준:

- 비동기 상태 3종류를 빠뜨리지 않고 처리합니다.

### 7. 테스트 습관

목표:

- 순수 Dart 테스트와 widget test를 구분합니다.
- 사용자 관점의 테스트를 작성합니다.

실습 예시:

- Todo 필터 함수 단위 테스트
- 버튼 탭 후 텍스트 변경 테스트
- 폼 validation 테스트

완료 기준:

- 새 기능 하나에 최소 1개의 의미 있는 테스트를 붙일 수 있습니다.

### 8. 작은 앱 완성

목표:

- 지금까지 배운 내용을 하나의 작은 앱으로 묶습니다.

후보:

- Todo 앱
- 습관 체크 앱
- 간단한 가계부
- 학습 노트 앱

완료 기준:

- 앱의 주요 흐름이 실행됩니다.
- README에 실행 방법과 핵심 구조가 정리되어 있습니다.
- `flutter analyze`와 `flutter test`가 통과합니다.

## 권장 반복 루틴

1. 사용자가 오늘의 학습 목표를 지시합니다.
2. 학습 에이전트가 `docs/tasks.md`에 태스크를 등록합니다.
3. 학습 에이전트가 계획을 세우고 `lib/learning/` 또는 `lib/main.dart`에 기초 코드를 구현합니다.
4. 학습 에이전트가 `test/learning/` 또는 `test/widget_test.dart`에 테스트를 작성합니다.
5. 학습 에이전트가 `flutter analyze`와 `flutter test`를 실행합니다.
6. UI 태스크는 런타임에서 동작을 확인합니다.
7. 학습 에이전트가 `docs/tasks.md`와 `docs/progress.md`에 결과를 기록하고 완료 처리합니다.


