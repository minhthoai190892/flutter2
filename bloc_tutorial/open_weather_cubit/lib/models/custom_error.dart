// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class CustomErro extends Equatable {
  final String errorMessage;
  const CustomErro({
    required this.errorMessage,
  });

  CustomErro copyWith({
    String? errorMessage,
  }) {
    return CustomErro(
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'errorMessage': errorMessage,
    };
  }

  factory CustomErro.fromMap(Map<String, dynamic> map) {
    return CustomErro(
      errorMessage: map['errorMessage'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomErro.fromJson(String source) =>
      CustomErro.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [errorMessage];
}
