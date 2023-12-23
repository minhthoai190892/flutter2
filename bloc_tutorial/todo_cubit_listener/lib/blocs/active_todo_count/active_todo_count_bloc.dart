import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_cubit/blocs/blocs.dart';

part 'active_todo_count_event.dart';
part 'active_todo_count_state.dart';

class ActiveTodoCountBloc
    extends Bloc<ActiveTodoCountEvent, ActiveTodoCountState> {
  late final StreamSubscription todoListSubscription;
  final int initialActiveTodoCount;
  final TodoListBloc todoListBloc;
  ActiveTodoCountBloc(
      {required this.initialActiveTodoCount, required this.todoListBloc})
      : super(ActiveTodoCountState(activeTodoCount: initialActiveTodoCount)) {
    todoListSubscription = todoListBloc.stream.listen((todoListState) {
      print('TodoListState($todoListState)');
      final int currentActiveTodoCount =
          todoListState.todos.where((todo) => !todo.completed).toList().length;
      add(CalculateActiveTodoCountEvent(
          activeTodoCount: currentActiveTodoCount));
    });
    on<CalculateActiveTodoCountEvent>((event, emit) {
      emit(state.copyWith(activeTodoCount: event.activeTodoCount));
    });
  }
  @override
  Future<void> close() {
    // TODO: implement close
    todoListSubscription.cancel();
    return super.close();
  }
}
