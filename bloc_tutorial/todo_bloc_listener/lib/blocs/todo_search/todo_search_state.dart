part of 'todo_search_bloc.dart';

 class TodoSearchState extends Equatable {
 final String searchTerm;
  const TodoSearchState({
    required this.searchTerm,
  });

  TodoSearchState copyWith({
    String? searchTerm,
  }) {
    return TodoSearchState(
      searchTerm: searchTerm ?? this.searchTerm,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'searchTerm': searchTerm,
    };
  }

  factory TodoSearchState.initial() {
    return const TodoSearchState(searchTerm: '');
  }
  factory TodoSearchState.fromMap(Map<String, dynamic> map) {
    return TodoSearchState(
      searchTerm: map['searchTerm'] as String,
    );
  }

  // String toJson() => json.encode(toMap());

  // factory TodoSeearchState.fromJson(String source) => TodoSeearchState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [searchTerm];
}
