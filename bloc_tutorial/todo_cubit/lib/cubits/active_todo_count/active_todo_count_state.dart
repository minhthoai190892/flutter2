// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'active_todo_count_cubit.dart';

class ActiveTodoCountState extends Equatable {
  final int count;
  const ActiveTodoCountState(
    this.count,
  );
  factory ActiveTodoCountState.initial() {
    return const ActiveTodoCountState(0);
  }
  ActiveTodoCountState copyWith({
    int? activeTodoCount,
  }) {
    return ActiveTodoCountState(
      activeTodoCount ?? count,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'count': count,
    };
  }

  factory ActiveTodoCountState.fromMap(Map<String, dynamic> map) {
    return ActiveTodoCountState(
      map['count'] as int,
    );
  }

  // String toJson() => json.encode(toMap());

  // factory ActiveTodoCountState.fromJson(String source) => ActiveTodoCountState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [count];
}
