import 'package:flutter/material.dart';

class LabT012DismissibleList extends StatefulWidget {
  const LabT012DismissibleList({super.key});

  @override
  State<LabT012DismissibleList> createState() => _LabT012DismissibleListState();
}

class _LabT012DismissibleListState extends State<LabT012DismissibleList> {
  final List<String> _tasks = ['Read docs', 'Write code', 'Run tests'];
  String _lastRemoved = 'No item removed yet.';

  void _removeTask(String task) {
    setState(() {
      _tasks.remove(task);
      _lastRemoved = 'Removed: $task';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('T-012 Dismissible List')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Swipe an item sideways to remove it.'),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _tasks.length,
                itemBuilder: (context, index) {
                  final task = _tasks[index];

                  return Dismissible(
                    key: ValueKey(task),
                    background: Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      color: Colors.red.shade100,
                      child: const Text('Delete'),
                    ),
                    secondaryBackground: Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      color: Colors.red.shade100,
                      child: const Text('Delete'),
                    ),
                    onDismissed: (_) => _removeTask(task),
                    child: Card(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: ListTile(
                        title: Text(task),
                        subtitle: const Text('Swipe to dismiss'),
                      ),
                    ),
                  );
                },
              ),
            ),
            Text('Remaining items: ${_tasks.length}'),
            Text(_lastRemoved),
          ],
        ),
      ),
    );
  }
}
