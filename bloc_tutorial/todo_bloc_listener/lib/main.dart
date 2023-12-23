import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/blocs.dart';
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
        BlocProvider(create: (context) => TodoFilterBloc()),
        BlocProvider(create: (context) => TodoSearchBloc()),
        BlocProvider(create: (context) => TodoListBloc()),
        BlocProvider<ActiveTodoCountBloc>(
            create: (context) => ActiveTodoCountBloc(
                  initialActiveTodoCount:
                      context.read<TodoListBloc>().state.todos.length,
                )),
        BlocProvider(
            create: (context) => FilteredTodoBloc(
                  initialTodos: context.read<TodoListBloc>().state.todos,
                )),
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
