// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

Uuid uuid = Uuid();

enum Filter {
  all,
  active,
  completed;
}

class Todo extends Equatable {
  final String id;
  final String description;
  final bool completed;
  Todo({
    String? id,
    required this.description,
    this.completed = false,
  }) : id = id ?? uuid.v4();

  Todo copyWith({
    String? id,
    String? description,
    bool? completed,
  }) {
    return Todo(
      id: id ?? this.id,
      description: description ?? this.description,
      completed: completed ?? this.completed,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'description': description,
      'completed': completed,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'] as String,
      description: map['description'] as String,
      completed: map['completed'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Todo.fromJson(String source) =>
      Todo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Todo(id: $id, description: $description, completed: $completed)';

  @override
  bool operator ==(covariant Todo other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.description == description &&
        other.completed == completed;
  }

  @override
  int get hashCode => id.hashCode ^ description.hashCode ^ completed.hashCode;

  @override
  // TODO: implement props
  List<Object> get props => [id, description, completed];
}
