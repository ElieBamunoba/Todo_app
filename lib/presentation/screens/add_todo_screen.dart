import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/presentation/widgets/text_field.dart';

import '../../blocs/todo/todos_bloc.dart';
import '../../models/todos_model.dart';

class AddTodoScreen extends StatelessWidget {
  const AddTodoScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    TextEditingController controllerId = TextEditingController();
    TextEditingController controllerTask = TextEditingController();
    TextEditingController controllerDescription = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: BlocListener<TodosBloc, TodosState>(
        listener: (context, state) {
          if (state is TodosLoaded) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('To Do added')),
            );
          }
        },
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TodoTextField(label: 'ID', controller: controllerId),
              TodoTextField(label: 'Task', controller: controllerTask),
              TodoTextField(
                  label: 'Description', controller: controllerDescription),
              ElevatedButton(
                onPressed: () {
                  var todo = Todo(
                    id: controllerId.value.text,
                    task: controllerTask.value.text,
                    description: controllerDescription.value.text,
                  );
                  context.read<TodosBloc>().add(AddTodo(todo: todo));
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: const Text('Add Todo'),
              )
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
