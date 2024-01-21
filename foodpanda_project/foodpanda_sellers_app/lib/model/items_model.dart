// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class ItemsModel {
  final String itemId;
  final String menuId;
  final String sellerUID;
  final String sellerName;
  final String shortInfo;
  final String longDescription;
  final int price;
  final DateTime publishedDate;
  final String status;
  final String thumbnailUrl;
  final String title;
  ItemsModel({
    required this.itemId,
    required this.menuId,
    required this.sellerUID,
    required this.sellerName,
    required this.shortInfo,
    required this.longDescription,
    required this.price,
    required this.publishedDate,
    required this.status,
    required this.thumbnailUrl,
    required this.title,
  });
 

  ItemsModel copyWith({
    String? itemId,
    String? menuId,
    String? sellerUID,
    String? sellerName,
    String? shortInfo,
    String? longDescription,
    int? price,
    DateTime? publishedDate,
    String? status,
    String? thumbnailUrl,
    String? title,
  }) {
    return ItemsModel(
      itemId: itemId ?? this.itemId,
      menuId: menuId ?? this.menuId,
      sellerUID: sellerUID ?? this.sellerUID,
      sellerName: sellerName ?? this.sellerName,
      shortInfo: shortInfo ?? this.shortInfo,
      longDescription: longDescription ?? this.longDescription,
      price: price ?? this.price,
      publishedDate: publishedDate ?? this.publishedDate,
      status: status ?? this.status,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'itemId': itemId,
      'menuId': menuId,
      'sellerUID': sellerUID,
      'sellerName': sellerName,
      'shortInfo': shortInfo,
      'longDescription': longDescription,
      'price': price,
      'publishedDate': publishedDate.millisecondsSinceEpoch,
      'status': status,
      'thumbnailUrl': thumbnailUrl,
      'title': title,
    };
  }

  factory ItemsModel.fromMap(Map<String, dynamic> map) {
    return ItemsModel(
      itemId: map['itemId'] as String,
      menuId: map['menuId'] as String,
      sellerUID: map['sellerUID'] as String,
      sellerName: map['sellerName'] as String,
      shortInfo: map['shortInfo'] as String,
      longDescription: map['longDescription'] as String,
      price: map['price'] as int,
      publishedDate: DateTime.fromMillisecondsSinceEpoch(map['publishedDate'] as int),
      status: map['status'] as String,
      thumbnailUrl: map['thumbnailUrl'] as String,
      title: map['title'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemsModel.fromJson(String source) => ItemsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ItemsModel(itemId: $itemId, menuId: $menuId, sellerUID: $sellerUID, sellerName: $sellerName, shortInfo: $shortInfo, longDescription: $longDescription, price: $price, publishedDate: $publishedDate, status: $status, thumbnailUrl: $thumbnailUrl, title: $title)';
  }

  @override
  bool operator ==(covariant ItemsModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.itemId == itemId &&
      other.menuId == menuId &&
      other.sellerUID == sellerUID &&
      other.sellerName == sellerName &&
      other.shortInfo == shortInfo &&
      other.longDescription == longDescription &&
      other.price == price &&
      other.publishedDate == publishedDate &&
      other.status == status &&
      other.thumbnailUrl == thumbnailUrl &&
      other.title == title;
  }

  @override
  int get hashCode {
    return itemId.hashCode ^
      menuId.hashCode ^
      sellerUID.hashCode ^
      sellerName.hashCode ^
      shortInfo.hashCode ^
      longDescription.hashCode ^
      price.hashCode ^
      publishedDate.hashCode ^
      status.hashCode ^
      thumbnailUrl.hashCode ^
      title.hashCode;
  }
}
