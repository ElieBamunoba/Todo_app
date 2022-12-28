import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/blocs/todo/todos_bloc.dart';
import '../../presentation/routes/routes.dart' as route;

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
          create: (context) => TodosBloc()..add(LoadTodos()),
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
