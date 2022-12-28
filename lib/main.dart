import 'package:flutter/material.dart';
import 'package:todo_app/presentation/screens/todos/todos_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO App',
      theme: ThemeData(
          primaryColor: const Color(0xff000a1f),
          primarySwatch: Colors.blue,
          appBarTheme: const AppBarTheme(
            color: Color(0xff000a1f),
          )),
      home: const TodosScreen(title: 'TODO App'),
    );
  }
}
