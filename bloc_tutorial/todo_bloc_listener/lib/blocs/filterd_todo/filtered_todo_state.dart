part of 'filtered_todo_bloc.dart';

class FilteredTodoState extends Equatable {
  final List<Todo> filteredTodos;
  const FilteredTodoState({
    required this.filteredTodos,
  });
  factory FilteredTodoState.initial() {
    return const FilteredTodoState(filteredTodos: []);
  }
  FilteredTodoState copyWith({
    List<Todo>? filteredTodos,
  }) {
    return FilteredTodoState(
      filteredTodos: filteredTodos ?? this.filteredTodos,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'filteredTodos': filteredTodos.map((x) => x.toMap()).toList(),
    };
  }

  factory FilteredTodoState.fromMap(Map<String, dynamic> map) {
    return FilteredTodoState(
      filteredTodos: List<Todo>.from(
        (map['filteredTodos'] as List<int>).map<Todo>(
          (x) => Todo.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  // String toJson() => json.encode(toMap());

  // factory FilteredTodoState.fromJson(String source) => FilteredTodoState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [filteredTodos];
}
