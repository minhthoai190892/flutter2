// ignore_for_file: public_member_api_docs, sort_constructors_first, unnecessary_question_mark
import 'dart:convert';

class CategoriesModel {
  final String categoryId;
  final String categoryImage;
  final String categoryName;
  final dynamic createdAt;
  final dynamic updatedAt;
  CategoriesModel({
    required this.categoryId,
    required this.categoryImage,
    required this.categoryName,
    required this.createdAt,
    required this.updatedAt,
  });

  CategoriesModel copyWith({
    String? categoryId,
    String? categoryImage,
    String? categoryName,
    dynamic? createAt,
    dynamic? upateAt,
  }) {
    return CategoriesModel(
      categoryId: categoryId ?? this.categoryId,
      categoryImage: categoryImage ?? this.categoryImage,
      categoryName: categoryName ?? this.categoryName,
      createdAt: createAt ?? createdAt,
      updatedAt: upateAt ?? updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'categoryId': categoryId,
      'categoryImage': categoryImage,
      'categoryName': categoryName,
      'createAt': createdAt,
      'upateAt': updatedAt,
    };
  }

  factory CategoriesModel.fromMap(Map<String, dynamic> map) {
    return CategoriesModel(
      categoryId: map['categoryId'] as String,
      categoryImage: map['categoryImage'] as String,
      categoryName: map['categoryName'] as String,
      createdAt: map['createAt'] as dynamic,
      updatedAt: map['upateAt'] as dynamic,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoriesModel.fromJson(String source) =>
      CategoriesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CategoriesModel(categoryId: $categoryId, categoryImage: $categoryImage, categoryName: $categoryName, createAt: $createdAt, upateAt: $updatedAt)';
  }

  @override
  bool operator ==(covariant CategoriesModel other) {
    if (identical(this, other)) return true;

    return other.categoryId == categoryId &&
        other.categoryImage == categoryImage &&
        other.categoryName == categoryName &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return categoryId.hashCode ^
        categoryImage.hashCode ^
        categoryName.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
