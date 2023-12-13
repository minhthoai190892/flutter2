import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit/blocs/blocs.dart';
import 'package:todo_cubit/models/todo_model.dart';
import 'package:todo_cubit/utils/debonce.dart';

class SearchAndFilterTodo extends StatefulWidget {
  final debounce = Debounce(millisecond: 1000);
  SearchAndFilterTodo({super.key});

  @override
  State<SearchAndFilterTodo> createState() => _SearchAndFilterTodoState();
}

class _SearchAndFilterTodoState extends State<SearchAndFilterTodo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: const InputDecoration(
              labelText: 'Search Todos ...',
              border: InputBorder.none,
              filled: true,
              prefixIcon: Icon(Icons.search)),
          onChanged: (String? newSearchTerm) {
            if (newSearchTerm != null) {
              widget.debounce.run(() {
              context.read<TodoSearchBloc>().add(SetSearchTermEvent(newSearchTerm: newSearchTerm));

              });
            }
          },
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            filterButton(context, Filter.all),
            filterButton(context, Filter.active),
            filterButton(context, Filter.completed),
          ],
        )
      ],
    );
  }
}

filterButton(BuildContext context, Filter filter) {
  return TextButton(
    onPressed: () {
      context.read<TodoFilterBloc>().add(ChangeFilterEvent(newFilter: filter));
    },
    child: Text(
      filter == Filter.all
          ? 'All'
          : filter == Filter.active
              ? 'Active'
              : 'Complete',
      style: TextStyle(fontSize: 18, color: textColor(context, filter)),
    ),
  );
}

textColor(BuildContext context, Filter filter) {
  final currentFilter = context.watch<TodoFilterBloc>().state.filter;
  return currentFilter == filter ? Colors.blue : Colors.grey;
}
