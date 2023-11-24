// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class CartModel {
  final String productId;
  final String categoryId;
  final String productName;
  final String categoryName;
  final String salePrice;
  final String fullPrice;
  final List productImages;
  final String deliveryTime;
  final bool isSale;
  final String productDescription;
  final dynamic createdAt;
  final dynamic updatedAt;
  final int productQuantity;
  final double productTotalPrice;
  CartModel({
    required this.productId,
    required this.categoryId,
    required this.productName,
    required this.categoryName,
    required this.salePrice,
    required this.fullPrice,
    required this.productImages,
    required this.deliveryTime,
    required this.isSale,
    required this.productDescription,
    required this.createdAt,
    required this.updatedAt,
    required this.productQuantity,
    required this.productTotalPrice,
  });

  CartModel copyWith({
    String? productId,
    String? categoryId,
    String? productName,
    String? categoryName,
    String? salePrice,
    String? fullPrice,
    List? productImages,
    String? deliveryTime,
    bool? isSale,
    String? productDescription,
    dynamic? createdAt,
    dynamic? updatedAt,
    int? productQuantity,
    double? productTotalPrice,
  }) {
    return CartModel(
      productId: productId ?? this.productId,
      categoryId: categoryId ?? this.categoryId,
      productName: productName ?? this.productName,
      categoryName: categoryName ?? this.categoryName,
      salePrice: salePrice ?? this.salePrice,
      fullPrice: fullPrice ?? this.fullPrice,
      productImages: productImages ?? this.productImages,
      deliveryTime: deliveryTime ?? this.deliveryTime,
      isSale: isSale ?? this.isSale,
      productDescription: productDescription ?? this.productDescription,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      productQuantity: productQuantity ?? this.productQuantity,
      productTotalPrice: productTotalPrice ?? this.productTotalPrice,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productId': productId,
      'categoryId': categoryId,
      'productName': productName,
      'categoryName': categoryName,
      'salePrice': salePrice,
      'fullPrice': fullPrice,
      'productImages': productImages,
      'deliveryTime': deliveryTime,
      'isSale': isSale,
      'productDescription': productDescription,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'productQuantity': productQuantity,
      'productTotalPrice': productTotalPrice,
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      productId: map['productId'] as String,
      categoryId: map['categoryId'] as String,
      productName: map['productName'] as String,
      categoryName: map['categoryName'] as String,
      salePrice: map['salePrice'] as String,
      fullPrice: map['fullPrice'] as String,
      productImages: map['productImages'] as List,
      deliveryTime: map['deliveryTime'] as String,
      isSale: map['isSale'] as bool,
      productDescription: map['productDescription'] as String,
      createdAt: map['createdAt'] as dynamic,
      updatedAt: map['updatedAt'] as dynamic,
      productQuantity: map['productQuantity'] as int,
      productTotalPrice: map['productTotalPrice'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartModel.fromJson(String source) =>
      CartModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CartModel(productId: $productId, categoryId: $categoryId, productName: $productName, categoryName: $categoryName, salePrice: $salePrice, fullPrice: $fullPrice, productImages: $productImages, deliveryTime: $deliveryTime, isSale: $isSale, productDescription: $productDescription, createdAt: $createdAt, updatedAt: $updatedAt, productQuantity: $productQuantity, productTotalPrice: $productTotalPrice)';
  }

  @override
  bool operator ==(covariant CartModel other) {
    if (identical(this, other)) return true;

    return other.productId == productId &&
        other.categoryId == categoryId &&
        other.productName == productName &&
        other.categoryName == categoryName &&
        other.salePrice == salePrice &&
        other.fullPrice == fullPrice &&
        listEquals(other.productImages, productImages) &&
        other.deliveryTime == deliveryTime &&
        other.isSale == isSale &&
        other.productDescription == productDescription &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.productQuantity == productQuantity &&
        other.productTotalPrice == productTotalPrice;
  }

  @override
  int get hashCode {
    return productId.hashCode ^
        categoryId.hashCode ^
        productName.hashCode ^
        categoryName.hashCode ^
        salePrice.hashCode ^
        fullPrice.hashCode ^
        productImages.hashCode ^
        deliveryTime.hashCode ^
        isSale.hashCode ^
        productDescription.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        productQuantity.hashCode ^
        productTotalPrice.hashCode;
  }
}
