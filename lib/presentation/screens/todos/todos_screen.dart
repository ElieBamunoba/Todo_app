import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/presentation/routes/routes.dart' as route;
import '../../../blocs/todo/todos_bloc.dart';
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
            onPressed: () => Navigator.pushNamed(context, route.addTodoScreen),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: BlocBuilder<TodosBloc, TodosState>(
        builder: (context, state) {
          if (state is TodosLoading) {
            return const CircularProgressIndicator();
          } else if (state is TodosLoaded) {
            return Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Pending TO D0s:',
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
                      itemCount: state.todos.length,
                      itemBuilder: (BuildContext context, int index) {
                        return TodoCard(
                          context: context,
                          todo: state.todos[index],
                        );
                      })
                ],
              ),
            );
          } else {
            return const Text(
              'Something went wrong ',
              style: TextStyle(
                fontSize: 18,
                color: Colors.red,
              ),
            );
          }
        },
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
