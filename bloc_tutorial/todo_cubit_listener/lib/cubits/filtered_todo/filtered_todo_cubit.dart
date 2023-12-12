// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_cubit/models/todo_model.dart';

part 'filtered_todo_state.dart';

class FilteredTodoCubit extends Cubit<FilteredTodoState> {
  final List<Todo> initialTodos;

  FilteredTodoCubit({
    required this.initialTodos,
  }) : super(FilteredTodoState(initialTodos));

  void setFilteredTodos(Filter filter, List<Todo> todos, String searchTerm) {
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
          .where((todo) => todo.description
              .toLowerCase()
              .contains(searchTerm))
          .toList();
    }
    emit(state.copyWith(filteredTodos: filteredTodos));
  }
}
