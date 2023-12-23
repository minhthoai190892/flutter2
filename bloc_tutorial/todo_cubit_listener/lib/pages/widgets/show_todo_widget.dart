import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit/cubits/cubits.dart';
import 'package:todo_cubit/cubits/filtered_todo/filtered_todo_cubit.dart';
import 'package:todo_cubit/cubits/todo_list/todo_list_cubit.dart';
import 'package:todo_cubit/models/todo_model.dart';
import 'package:todo_cubit/pages/widgets/todo_item_widget.dart';

class ShowTodoWidget extends StatelessWidget {
  const ShowTodoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final todos = context.watch<FilteredTodoCubit>().state.filteredTodos;
    return MultiBlocListener(
      listeners: [
        BlocListener<TodoListCubit, TodoListState>(
          listener: (context, state) {
            context.read<FilteredTodoCubit>().setFilteredTodos(
                context.read<TodoFilterCubit>().state.filter,
                state.todos,
                context.read<TodoSearchCubit>().state.searchTerm);
          },
        ),
        BlocListener<TodoFilterCubit, TodoFilterState>(
          listener: (context, state) {
            context.read<FilteredTodoCubit>().setFilteredTodos(
                state.filter,
                context.read<TodoListCubit>().state.todos,
                context.read<TodoSearchCubit>().state.searchTerm);
          },
        ),
        BlocListener<TodoSearchCubit, TodoSearchState>(
          listener: (context, state) {
            context.read<FilteredTodoCubit>().setFilteredTodos(
                context.read<TodoFilterCubit>().state.filter,
                context.read<TodoListCubit>().state.todos,
                state.searchTerm);
          },
        )
      ],
      child: ListView.separated(
          primary: false,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Dismissible(
              key: ValueKey(todos[index].id),
              background: showBackground(),
              secondaryBackground: showBackground(),
              onDismissed: (_) =>
                  context.read<TodoListCubit>().removeTodo(todos[index]),
              child: TodoItemWidget(todo: todos[index]),
              confirmDismiss: (direction) {
                return showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Are your sure?'),
                      content: const Text('Do you really want to delete'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, false),
                          child: const Text('No'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, true),
                          child: const Text('Yes'),
                        )
                      ],
                    );
                  },
                );
              },
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(
              color: Colors.redAccent,
            );
          },
          itemCount: todos.length),
    );
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
