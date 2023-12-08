import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_list_app_cubit/model/todo_model.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<List<Todo>> {
  TodoCubit() : super([]);
  void addTodo(String title) {
    if (title.isEmpty) {
      addError('title must not be empty');
      return;
    }
    final todo = Todo(name: title, created: DateTime.now());
    // state.add(todo);
    emit([...state, todo]);
  }

  @override
  void onChange(Change<List<Todo>> change) {
    // TODO: implement onChange
    super.onChange(change);
    print(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    // TODO: implement onError
    super.onError(error, stackTrace);
    print(error);
  }
}
