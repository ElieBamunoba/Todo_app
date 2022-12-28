//Routes Names
import 'package:flutter/material.dart';

import '../screens/todos/todos_screen.dart';
import '../screens/add_todo/add_todo_screen.dart';

const String todosScreen = 'Todos';
const String addTodoScreen = 'AddTodo';

Route onGenerateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case todosScreen:
      return MaterialPageRoute(
          builder: (_) => const TodosScreen(title: 'TODO App'));
    case addTodoScreen:
      return MaterialPageRoute(
        builder: (_) => const AddTodoScreen(
          title: 'New Todo',
        ),
      );
    default:
      throw ('This route name does not exist');
  }
}
