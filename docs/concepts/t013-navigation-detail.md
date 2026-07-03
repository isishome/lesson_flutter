# T-013 Navigator로 목록에서 상세 화면 이동하기

## 목표

이번 레슨은 목록 화면에서 항목을 탭해 상세 화면으로 이동하는 흐름을 다룹니다. 하나의 화면 안에서 상태만 바꾸는 것이 아니라, 새 화면을 route로 쌓고 뒤로가기로 이전 화면에 돌아옵니다.

## 새로 등장한 클래스

### Navigator

`Navigator`는 Flutter SDK가 제공하는 화면 이동 관리자입니다. 화면을 stack처럼 쌓고, 새 화면을 열거나 현재 화면을 닫을 수 있습니다.

자주 쓰는 메서드:

- `Navigator.of(context).push(...)`: 새 화면을 현재 화면 위에 올림
- `Navigator.of(context).pop()`: 현재 화면을 닫고 이전 화면으로 돌아감

현재 코드에서는 목록 항목을 탭했을 때 `Navigator.of(context).push(...)`를 호출해 상세 화면을 엽니다.

### MaterialPageRoute

`MaterialPageRoute`는 Material 앱에서 새 화면을 route로 만드는 클래스입니다.

자주 쓰는 속성:

- `builder`: 새 화면 위젯을 반환하는 함수

현재 코드에서는 `builder`에서 `_ArticleDetailScreen(article: article)`을 반환합니다.

### ListTile.onTap

`ListTile`은 제목, 부제목, trailing 아이콘을 가진 Material 리스트 항목입니다. `onTap`에 함수를 넣으면 항목 전체가 탭 가능한 영역이 됩니다.

현재 코드에서는 각 글 목록 항목의 `onTap`에서 상세 화면으로 이동합니다.

## 코드 흐름

```dart
ListTile(
  title: Text(article.title),
  subtitle: Text(article.summary),
  trailing: const Icon(Icons.chevron_right),
  onTap: () {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => _ArticleDetailScreen(article: article),
      ),
    );
  },
)
```

사용자가 목록 항목을 탭하면 선택된 `article`을 상세 화면 생성자에 넘깁니다.

```dart
class _ArticleDetailScreen extends StatelessWidget {
  const _ArticleDetailScreen({required this.article});

  final _Article article;
}
```

상세 화면은 생성자로 받은 데이터를 자기 화면에 표시합니다. 이렇게 하면 상세 화면이 전역 상태에 의존하지 않고, 필요한 데이터만 명확하게 받습니다.

## 헷갈리기 쉬운 점

- `push`는 새 화면을 올리는 동작이고, `pop`은 현재 화면을 닫는 동작입니다.
- `AppBar`가 있는 상세 화면은 기본적으로 뒤로가기 버튼을 보여줍니다.
- 상세 화면에 필요한 데이터는 생성자 인자로 넘기면 가장 단순합니다.
- `MaterialPageRoute<void>`에서 `void`는 이 route가 닫힐 때 특별한 결과값을 돌려주지 않는다는 뜻입니다.
