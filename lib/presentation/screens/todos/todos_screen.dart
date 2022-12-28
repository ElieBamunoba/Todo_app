import 'package:flutter/material.dart';

import '../../../models/todos_model.dart';
import '../../widgets/todo_card.dart';

class TodosScreen extends StatelessWidget {
  const TodosScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Pending TO DOs:',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: Todo.todos.length,
                itemBuilder: (BuildContext context, int index) {
                  return TodoCard(
                    todo: Todo.todos[index],
                  );
                })
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
