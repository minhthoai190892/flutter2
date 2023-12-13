import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit/blocs/blocs.dart';

import '../../models/todo_model.dart';
import 'todo_item_widget.dart';

class ShowTodoWidget extends StatelessWidget {
  const ShowTodoWidget({super.key});

  List<Todo> setFilteredTodos(
      Filter filter, List<Todo> todos, String searchTerm) {
    List<Todo> filteredTodos;
    switch (filter) {
      case Filter.active:
        filteredTodos = todos.where((todo) => !todo.completed).toList();
        break;
      case Filter.completed:
        filteredTodos = todos.where((todo) => todo.completed).toList();
        break;
      case Filter.all:
      default:
        filteredTodos = todos;
        break;
    }
    if (searchTerm.isNotEmpty) {
      filteredTodos = filteredTodos
          .where((todo) => todo.description.toLowerCase().contains(searchTerm))
          .toList();
    }
    return filteredTodos;
  }

  @override
  Widget build(BuildContext context) {
    final todos = context.watch<FilteredTodoBloc>().state.filteredTodos;
    return MultiBlocListener(
      listeners: [
        BlocListener<TodoListBloc, TodoListState>(
          listener: (context, state) {
            List<Todo> filteredTodos = setFilteredTodos(
                context.read<TodoFilterBloc>().state.filter,
                state.todos,
                context.read<TodoSearchBloc>().state.searchTerm);
            context
                .read<FilteredTodoBloc>()
                .add(CalculateFilteredTodoEvent(filteredTodos));
          },
        ),
        BlocListener<TodoFilterBloc, TodoFilterState>(
          listener: (context, state) {
            List<Todo> filteredTodos = setFilteredTodos(
                state.filter,
                context.read<TodoListBloc>().state.todos,
                context.read<TodoSearchBloc>().state.searchTerm);
            context
                .read<FilteredTodoBloc>()
                .add(CalculateFilteredTodoEvent(filteredTodos));
          },
        ),
        BlocListener<TodoSearchBloc, TodoSearchState>(
          listener: (context, state) {
            List<Todo> filteredTodos = setFilteredTodos(
                context.read<TodoFilterBloc>().state.filter,
                context.read<TodoListBloc>().state.todos,
                state.searchTerm);
            context
                .read<FilteredTodoBloc>()
                .add(CalculateFilteredTodoEvent(filteredTodos));
          },
        ),
      ],
      child: ListView.separated(
          primary: false,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Dismissible(
              key: ValueKey(todos[index].id),
              background: showBackground(),
              secondaryBackground: showBackground(),
              onDismissed: (_) => context
                  .read<TodoListBloc>()
                  .add(RemoveTodoEvent(todo: todos[index])),
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
