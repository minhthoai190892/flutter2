import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/todo_model.dart';

part 'todo_list_state.dart';

class TodoListCubit extends Cubit<TodoListState> {
  TodoListCubit() : super(TodoListState.initial());
  void addTodo(String description) {
    final newTodo = Todo(description: description);
    final newTodos = [...state.todos, newTodo];
    emit(state.copyWith(todos: newTodos));
    print(state);
  }

  void editTodo(String id, String description) {
    final newTodos = state.todos.map((todo) {
      if (todo.id == id) {
        return Todo(
            id: id, description: description, completed: todo.completed);
      }
      return todo;
    }).toList();
    emit(state.copyWith(todos: newTodos));
  }

  void toggleTodo(String id) {
    final newTodos = state.todos.map((todo) {
      if (todo.id == id) {
        return Todo(
            id: id, description: todo.description, completed: todo.completed);
      }
      return todo;
    }).toList();
    emit(state.copyWith(todos: newTodos));
  }

  void removeTodo(Todo todo) {
    final newTodos = state.todos.where((t) => t.id == todo.id).toList();
    emit(state.copyWith(todos: newTodos));
  }
}
