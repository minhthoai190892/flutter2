// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'todo_list_bloc.dart';

abstract class TodoListEvent extends Equatable {
  const TodoListEvent();

  @override
  List<Object> get props => [];
}

class AddTodoEvent extends TodoListEvent {
  final String todoDesc;
  const AddTodoEvent({
    required this.todoDesc,
  });

  @override
  List<Object> get props => [todoDesc];
  @override
  String toString() => 'AddTodoEvent(todoDesc: $todoDesc)';
}

class EditTodoEvent extends TodoListEvent {
  final String id;
  final String todoDesc;
  const EditTodoEvent({
    required this.id,
    required this.todoDesc,
  });
  @override
  List<Object> get props => [id, todoDesc];
  @override
  String toString() => 'EditTodoEvent(id: $id, todoDesc: $todoDesc)';
}

class ToggleTodoEvent extends TodoListEvent {
  final String id;
  const ToggleTodoEvent({
    required this.id,
  });

  @override
  List<Object> get props => [id];
  @override
  String toString() => 'ToggleTodoEvent(id: $id)';
}

class RemoveTodoEvent extends TodoListEvent {
  final Todo todo;
  const RemoveTodoEvent({
    required this.todo,
  });
@override
  List<Object> get props => [todo];
  @override
  String toString() => 'RemoveTodoEvent(todo: $todo)';
}
