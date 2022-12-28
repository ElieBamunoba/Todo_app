import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/blocs/todo/todos_bloc.dart';
import '../../presentation/routes/routes.dart' as route;
import 'blocs/todos_filter/todos_filter_bloc.dart';
import 'models/todos_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TodosBloc()
            ..add(LoadTodos(todos: [
              Todo(
                  id: '1',
                  task: 'Sample Todo 1',
                  description: 'This is a test Todo'),
              Todo(
                  id: '2',
                  task: 'Sample Todo 2',
                  description: 'This is a test Todo'),
            ])),
        ),
        BlocProvider(
          create: (context) =>
              TodosFilterBloc(todosBloc: BlocProvider.of<TodosBloc>(context)),
        ),
      ],
      child: MaterialApp(
        title: 'TODO App',
        theme: ThemeData(
            primaryColor: const Color(0xff000a1f),
            primarySwatch: Colors.blue,
            appBarTheme: const AppBarTheme(
              color: Color(0xff000a1f),
            )),
        onGenerateRoute: route.onGenerateRoute,
        initialRoute: route.todosScreen,
      ),
    );
  }
}
