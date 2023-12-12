// ignore_for_file: avoid_print

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/todo_model.dart';

part 'todo_list_event.dart';
part 'todo_list_state.dart';

class TodoListBloc extends Bloc<TodoListEvent, TodoListState> {
  TodoListBloc() : super(TodoListState.initial()) {
    on<AddTodoEvent>(_addTodoEvent);
    on<EditTodoEvent>(_editTodoEvent);
    on<ToggleTodoEvent>(_toggleTodoEvent);
    on<RemoveTodoEvent>(_removeTodoEvent);
  }

  FutureOr<void> _addTodoEvent(
      AddTodoEvent event, Emitter<TodoListState> emit) {
    final newTodo = Todo(description: event.todoDesc);
    final newTodos = [...state.todos, newTodo];
    emit(state.copyWith(todos: newTodos));
    print(state);
  }

  FutureOr<void> _editTodoEvent(
      EditTodoEvent event, Emitter<TodoListState> emit) {
    final newTodos = state.todos.map((todo) {
      if (todo.id == event.id) {
        return Todo(
            id: event.id,
            description: todo.description,
            completed: todo.completed);
      }
      return todo;
    }).toList();
    emit(state.copyWith(todos: newTodos));
    print(state);
  }

  FutureOr<void> _toggleTodoEvent(
      ToggleTodoEvent event, Emitter<TodoListState> emit) {
    final newTodos = state.todos.map((todo) {
      if (todo.id == event.id) {
        return Todo(
            id: event.id,
            description: todo.description,
            completed: todo.completed);
      }
      return todo;
    }).toList();
    emit(state.copyWith(todos: newTodos));
    print(state);
  }

  FutureOr<void> _removeTodoEvent(
      RemoveTodoEvent event, Emitter<TodoListState> emit) {
    final newTodos =
        state.todos.where((todo) => todo.id != event.todo.id).toList();
    emit(state.copyWith(todos: newTodos));
    print(state);
  }
}
