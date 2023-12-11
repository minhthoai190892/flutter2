// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:todo_cubit/cubits/todo_filter/todo_filter_cubit.dart';
import 'package:todo_cubit/cubits/todo_list/todo_list_cubit.dart';
import 'package:todo_cubit/cubits/todo_search/todo_search_cubit.dart';
import 'package:todo_cubit/models/todo_model.dart';

part 'filtered_todo_state.dart';

class FilteredTodoCubit extends Cubit<FilteredTodoState> {
  final TodoFilterCubit todoFilterCubit;
  final TodoSearchCubit todoSearchCubit;
  final TodoListCubit todoListCubit;
  late final StreamSubscription todoFilterSubscription;
  late final StreamSubscription todoSearchSubscription;
  late final StreamSubscription todoListSubscription;
  FilteredTodoCubit({
    required this.todoFilterCubit,
    required this.todoSearchCubit,
    required this.todoListCubit,
  }) : super(FilteredTodoState.initial()) {
    todoFilterSubscription = todoFilterCubit.stream.listen((todoFilterState) {
      setFilteredTodos();
    });
    todoSearchSubscription = todoSearchCubit.stream.listen((todoSearchState) {
      setFilteredTodos();
    });
    todoListSubscription = todoListCubit.stream.listen((todoListState) {
      setFilteredTodos();
    });
  }
  void setFilteredTodos() {
    List<Todo> filteredTodos;
    switch (todoFilterCubit.state.filter) {
      case Filter.active:
        filteredTodos =
            todoListCubit.state.todos.where((todo) => !todo.completed).toList();
        break;
      case Filter.completed:
        filteredTodos =
            todoListCubit.state.todos.where((todo) => todo.completed).toList();
        break;
      case Filter.all:
      default:
        filteredTodos = todoListCubit.state.todos;
        break;
    }
    if (todoSearchCubit.state.searchTerm.isNotEmpty) {
      filteredTodos = filteredTodos
          .where((todo) => todo.description
              .toLowerCase()
              .contains(todoSearchCubit.state.searchTerm))
          .toList();
    }
    emit(state.copyWith(filteredTodos: filteredTodos));
  }

  @override
  Future<void> close() {
    todoFilterSubscription.cancel();
    todoSearchSubscription.cancel();
    todoListSubscription.cancel();
    // TODO: implement close
    return super.close();
  }
}
