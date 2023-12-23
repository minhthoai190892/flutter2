// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'filtered_todo_cubit.dart';

class FilteredTodoState extends Equatable {
  final List<Todo> filteredTodos;
  const FilteredTodoState(
    this.filteredTodos,
  );
  factory FilteredTodoState.initial() {
    return const FilteredTodoState([]);
  }
  FilteredTodoState copyWith({
    List<Todo>? filteredTodos,
  }) {
    return FilteredTodoState(
      filteredTodos ?? this.filteredTodos,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'filteredTodos': filteredTodos.map((x) => x.toMap()).toList(),
    };
  }

  factory FilteredTodoState.fromMap(Map<String, dynamic> map) {
    return FilteredTodoState(
      List<Todo>.from(
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
