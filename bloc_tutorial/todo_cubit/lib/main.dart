import 'package:flutter/material.dart';
import 'package:todo_cubit/cubits/active_todo_count/active_todo_count_cubit.dart';
import 'package:todo_cubit/cubits/filtered_todo/filtered_todo_cubit.dart';
import 'package:todo_cubit/cubits/todo_filter/todo_filter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit/cubits/todo_list/todo_list_cubit.dart';
import 'package:todo_cubit/cubits/todo_search/todo_search_cubit.dart';
import 'pages/todos_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TodoFilterCubit()),
        BlocProvider(create: (context) => TodoSearchCubit()),
        BlocProvider(create: (context) => TodoListCubit()),
        BlocProvider<ActiveTodoCountCubit>(
            create: (context) => ActiveTodoCountCubit(
              initialActiveTodoCount: context.read<TodoListCubit>().state.todos.length
                ,todoListCubit: BlocProvider.of<TodoListCubit>(context))),
        BlocProvider(
            create: (context) => FilteredTodoCubit(
                todoFilterCubit: BlocProvider.of<TodoFilterCubit>(context),
                todoSearchCubit: BlocProvider.of<TodoSearchCubit>(context),
                todoListCubit: BlocProvider.of<TodoListCubit>(context))),
      ],
      child: MaterialApp(
        title: 'TODO',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const TodosPage(),
      ),
    );
  }
}
