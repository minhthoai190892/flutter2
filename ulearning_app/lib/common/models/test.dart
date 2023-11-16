// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Test {
  String id;
  String name;
  Test({
    required this.id,
    required this.name,
  });
  

  Test copyWith({
    String? id,
    String? name,
  }) {
    return Test(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory Test.fromMap(Map<String, dynamic> map) {
    return Test(
      id: map['id'] as String,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Test.fromJson(String source) => Test.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Test(id: $id, name: $name)';

  @override
  bool operator ==(covariant Test other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
