import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/blocs/todos_filter/todos_filter_bloc.dart';
import 'package:todo_app/models/todos_filter_model.dart';

import '../widgets/todos_list.dart';
import '/presentation/routes/routes.dart' as route;

class TodosScreen extends StatelessWidget {
  const TodosScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: [
            IconButton(
              onPressed: () =>
                  Navigator.pushNamed(context, route.addTodoScreen),
              icon: const Icon(Icons.add),
            )
          ],
          bottom: TabBar(
            onTap: (tabIndex) {
              switch (tabIndex) {
                case 0:
                  BlocProvider.of<TodosFilterBloc>(context)
                      .add(const UpdateTodos(
                    todosFilter: TodosFilter.pending,
                  ));
                  break;
                case 1:
                  BlocProvider.of<TodosFilterBloc>(context)
                      .add(const UpdateTodos(
                    todosFilter: TodosFilter.completed,
                  ));
                  break;
              }
            },
            tabs: const [
              Tab(
                icon: Icon(Icons.pending),
              ),
              Tab(
                icon: Icon(Icons.add_task),
              ),
            ],
          ),
        ),
        body: const TabBarView(children: [
          Todos(
            title: 'Pending To Dos',
          ),
          Todos(
            title: 'Completed To Dos',
          ),
        ]),
      ),
    );
  }
}
