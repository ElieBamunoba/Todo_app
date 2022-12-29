import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/presentation/widgets/todo_card.dart';

import '../../blocs/todos_filter/todos_filter_bloc.dart';

class Todos extends StatelessWidget {
  final String title;

  const Todos({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodosFilterBloc, TodosFilterState>(
      listener: (context, state) {
        if (state is TodosFilterLoaded) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text('${state.filteredTodos.length} todos in here'),
                duration: const Duration(seconds: 1)),
          );
        }
      },
      builder: (context, state) {
        if (state is TodosFilterLoading) {
          return const Center(
            child: SizedBox(
              height: 30,
              width: 30,
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is TodosFilterLoaded) {
          return Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.filteredTodos.length,
                    itemBuilder: (BuildContext context, int index) {
                      return TodoCard(
                        context: context,
                        todo: state.filteredTodos[index],
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
    );
  }
}
