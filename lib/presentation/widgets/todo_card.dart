import 'package:flutter/material.dart';

import '../../models/todos_model.dart';

class TodoCard extends StatelessWidget {
  final Todo todo;
  const TodoCard({
    super.key,
    required this.todo,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${todo.id}:${todo.task}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.add_task),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.cancel),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
