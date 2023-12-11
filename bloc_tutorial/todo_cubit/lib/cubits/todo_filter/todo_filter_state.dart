// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'todo_filter_cubit.dart';

class TodoFilterState extends Equatable {
  final Filter filter;
  const TodoFilterState({
    required this.filter,
  });
  factory TodoFilterState.initial() {
    return const TodoFilterState(filter: Filter.all);
  }
  TodoFilterState copyWith({
    Filter? filter,
  }) {
    return TodoFilterState(
      filter: filter ?? this.filter,
    );
  }

  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'filter': filter.toMap(),
  //   };
  // }

  // factory TodoFilterState.fromMap(Map<String, dynamic> map) {
  //   return TodoFilterState(
  //     filter: Filter.fromMap(map['filter'] as Map<String, dynamic>),
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory TodoFilterState.fromJson(String source) =>
  //     TodoFilterState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [filter];
}
