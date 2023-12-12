import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit/cubits/filtered_todo/filtered_todo_cubit.dart';

class ShowTodoWidget extends StatelessWidget {
  const ShowTodoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final todos = context.watch<FilteredTodoCubit>().state.filteredTodos;
    return ListView.separated(
        primary: false,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Dismissible(
            key: ValueKey(todos[index].id),
            background: showBackground(),
            secondaryBackground: showBackground(),
            child: Text(
              todos[index].description,
              style: const TextStyle(fontSize: 20),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            color: Colors.redAccent,
          );
        },
        itemCount: todos.length);
  }
}

Widget showBackground() {
  return Container(
    margin: const EdgeInsets.all(4),
    padding: const EdgeInsets.symmetric(horizontal: 4),
    color: Colors.red,
    alignment: Alignment.center,
    child: const Icon(
      Icons.delete,
      color: Colors.white,
      size: 30,
    ),
  );
}
