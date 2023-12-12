import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit/cubits/todo_list/todo_list_cubit.dart';

class CreateTodoWidget extends StatefulWidget {
  const CreateTodoWidget({super.key});

  @override
  State<CreateTodoWidget> createState() => _CreateTodoWidgetState();
}

class _CreateTodoWidgetState extends State<CreateTodoWidget> {
  final TextEditingController newTodoController = TextEditingController();
  @override
  void dispose() {
    newTodoController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: newTodoController,
      decoration: const InputDecoration(labelText: 'What to do?'),
      onSubmitted: (String? todoDes) {
        if (todoDes != null && todoDes.trim().isNotEmpty) {
          // gọi hàm add
          context.read<TodoListCubit>().addTodo(todoDes);
          newTodoController.clear();
        }
      },
    );
  }
}
