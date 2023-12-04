import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app_cubit/cubit/todo_cubit.dart';

class AddTodoListPage extends StatelessWidget {
  const AddTodoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController todoTitleController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Todo List'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: todoTitleController,
              decoration: const InputDecoration(hintText: 'Title'),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  BlocProvider.of<TodoCubit>(context)
                      .addTodo(todoTitleController.text);
                },
                child: const Text('Add'))
          ],
        ),
      )),
    );
  }
}
