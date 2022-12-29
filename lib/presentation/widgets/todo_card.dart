import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/blocs/todo/todos_bloc.dart';

import '../../models/todos_model.dart';

class TodoCard extends StatelessWidget {
  final Todo todo;
  final BuildContext context;
  const TodoCard({
    super.key,
    required this.context,
    required this.todo,
  });

  @override
  Widget build(context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '#${todo.id}: ${todo.task}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            BlocBuilder<TodosBloc, TodosState>(
              builder: (context, state) {
                return Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        context.read<TodosBloc>().add(
                              UpdateTodo(
                                todo: todo.copyWith(isCompleted: true),
                              ),
                            );
                      },
                      icon: const Icon(Icons.add_task),
                    ),
                    IconButton(
                      onPressed: () {
                        context.read<TodosBloc>().add(
                              DeleteTodo(
                                todo: todo.copyWith(isCancelled: true),
                              ),
                            );
                      },
                      icon: const Icon(Icons.cancel),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
