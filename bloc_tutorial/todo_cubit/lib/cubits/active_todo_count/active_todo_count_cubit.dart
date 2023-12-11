// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:todo_cubit/cubits/todo_list/todo_list_cubit.dart';

import '../../models/todo_model.dart';

part 'active_todo_count_state.dart';

class ActiveTodoCountCubit extends Cubit<ActiveTodoCountState> {
  // cần số lượng trong todolistcubit
  final TodoListCubit todoListCubit;
  late final StreamSubscription todoListSubscription;
  ActiveTodoCountCubit({
    required this.todoListCubit,
  }) : super(ActiveTodoCountState.initial()) {
    todoListSubscription =
        todoListCubit.stream.listen((TodoListState todoListState) {
      print('todoListState: $todoListState');
      final int currentActiveTodoCount = todoListState.todos
          .where((Todo todo) => !todo.completed)
          .toList()
          .length;
      emit(state.copyWith(activeTodoCount: currentActiveTodoCount));
    });
  }
  @override
  Future<void> close() {
    todoListSubscription.cancel();
    // TODO: implement close
    return super.close();
  }
}
