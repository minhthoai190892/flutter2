import 'package:flutter/material.dart';
import 'package:todo_cubit/pages/widgets/create_todo_widget.dart';
import 'package:todo_cubit/pages/widgets/search_and_filter_todo.dart';
import 'package:todo_cubit/pages/widgets/show_todo_widget.dart';

import 'widgets/todo_header_widget.dart';

class TodosPage extends StatelessWidget {
  const TodosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              children: [
                const TodoHeader(),
                const CreateTodoWidget(),
                const SizedBox(height: 20),
                SearchAndFilterTodo(),
                // SearchAndFilterTodo(),
                const ShowTodoWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
