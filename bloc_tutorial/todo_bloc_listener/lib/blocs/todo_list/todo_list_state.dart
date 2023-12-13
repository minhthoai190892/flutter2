part of 'todo_list_bloc.dart';

class TodoListState extends Equatable {
  final List<Todo> todos;
  const TodoListState(
    this.todos,
  );
  factory TodoListState.initial() {
    return TodoListState([
      Todo(
        id: '1',
        description:
            '1Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi, hic?',
            completed: true,
      ),
      Todo(
        id: '2',
        description:
            '2Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi, hic?',
      ),
      Todo(
        id: '3',
        description:
            '3Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi, hic?',
      ),
    ]);
  }
  TodoListState copyWith({
    List<Todo>? todos,
  }) {
    return TodoListState(
      todos ?? this.todos,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'todos': todos.map((x) => x.toMap()).toList(),
    };
  }

  factory TodoListState.fromMap(Map<String, dynamic> map) {
    return TodoListState(
      List<Todo>.from(
        (map['todos'] as List<int>).map<Todo>(
          (x) => Todo.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  // String toJson() => json.encode(toMap());

  // factory TodoListState.fromJson(String source) => TodoListState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [todos];
}
