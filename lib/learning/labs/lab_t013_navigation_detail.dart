import 'package:flutter/material.dart';

class LabT013NavigationDetail extends StatelessWidget {
  const LabT013NavigationDetail({super.key});

  static const List<_Article> _articles = [
    _Article(
      title: 'Navigation basics',
      summary: 'Open a new screen with Navigator.push.',
      detail: 'Navigator.push adds a new route on top of the current screen.',
    ),
    _Article(
      title: 'Route arguments',
      summary: 'Pass selected data to the detail screen.',
      detail:
          'Constructor arguments keep the detail screen simple and explicit.',
    ),
    _Article(
      title: 'Back navigation',
      summary: 'Return to the list with the back button.',
      detail: 'The AppBar back button pops the current route from the stack.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('T-013 Navigation Detail')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: _articles.length,
        separatorBuilder: (_, _) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          final article = _articles[index];

          return Card(
            child: ListTile(
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
            ),
          );
        },
      ),
    );
  }
}

class _ArticleDetailScreen extends StatelessWidget {
  const _ArticleDetailScreen({required this.article});

  final _Article article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Article Detail')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(article.title, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),
            Text(article.summary),
            const SizedBox(height: 24),
            Text('Detail: ${article.detail}'),
          ],
        ),
      ),
    );
  }
}

class _Article {
  const _Article({
    required this.title,
    required this.summary,
    required this.detail,
  });

  final String title;
  final String summary;
  final String detail;
}
