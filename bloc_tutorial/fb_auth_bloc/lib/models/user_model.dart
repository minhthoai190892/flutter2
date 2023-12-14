// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String name;
  final String email;
  final String profileImage;
  final int point;
  final String rank;
  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.profileImage,
    required this.point,
    required this.rank,
  });

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? profileImage,
    int? point,
    String? rank,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      profileImage: profileImage ?? this.profileImage,
      point: point ?? this.point,
      rank: rank ?? this.rank,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'profileImage': profileImage,
      'point': point,
      'rank': rank,
    };
  }

  factory User.fromDoc(DocumentSnapshot userDoc) {
    final userData = userDoc.data() as Map<String, dynamic>?;
    return User(
      id: userDoc['id'] as String,
      name: userDoc['name'] as String,
      email: userDoc['email'] as String,
      profileImage: userDoc['profileImage'] as String,
      point: userDoc['point'] as int,
      rank: userDoc['rank'] as String,
    );
  }
  factory User.initial() {
    return const User(
      id: '',
      name: '',
      email: '',
      profileImage: '',
      point: 1,
      rank: '',
    );
  }
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      profileImage: map['profileImage'] as String,
      point: map['point'] as int,
      rank: map['rank'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      name,
      email,
      profileImage,
      point,
      rank,
    ];
  }
}
