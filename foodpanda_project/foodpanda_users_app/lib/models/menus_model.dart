// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class MenusModel {
  final String menuId;
  final String sellersUid;
  final String menuTitle;
  final String menuInfo;
  final Timestamp publishedDate;
  final String thumbnail;
  final String status;
  MenusModel({
    required this.menuId,
    required this.sellersUid,
    required this.menuTitle,
    required this.menuInfo,
    required this.publishedDate,
    required this.thumbnail,
    required this.status,
  });

  MenusModel copyWith({
    String? menuId,
    String? sellersUid,
    String? menuTitle,
    String? menuInfo,
    Timestamp? publishedDate,
    String? thumbnail,
    String? status,
  }) {
    return MenusModel(
      menuId: menuId ?? this.menuId,
      sellersUid: sellersUid ?? this.sellersUid,
      menuTitle: menuTitle ?? this.menuTitle,
      menuInfo: menuInfo ?? this.menuInfo,
      publishedDate: publishedDate ?? this.publishedDate,
      thumbnail: thumbnail ?? this.thumbnail,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'menuId': menuId,
      'sellersUid': sellersUid,
      'menuTitle': menuTitle,
      'menuInfo': menuInfo,
      'publishedDate': publishedDate,
      'thumbnail': thumbnail,
      'status': status,
    };
  }

  factory MenusModel.fromMap(Map<String, dynamic> map) {
    return MenusModel(
      menuId: map['menuId'] as String,
      sellersUid: map['sellersUid'] as String,
      menuTitle: map['menuTitle'] as String,
      menuInfo: map['menuInfo'] as String,
      publishedDate: map['publishedDate'],
      thumbnail: map['thumbnail'] as String,
      status: map['status'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MenusModel.fromJson(String source) =>
      MenusModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Menus(menuId: $menuId, sellersUid: $sellersUid, menuTitle: $menuTitle, menuInfo: $menuInfo, publishedDate: $publishedDate, thumbnail: $thumbnail, status: $status)';
  }

  @override
  bool operator ==(covariant MenusModel other) {
    if (identical(this, other)) return true;

    return other.menuId == menuId &&
        other.sellersUid == sellersUid &&
        other.menuTitle == menuTitle &&
        other.menuInfo == menuInfo &&
        other.publishedDate == publishedDate &&
        other.thumbnail == thumbnail &&
        other.status == status;
  }

  @override
  int get hashCode {
    return menuId.hashCode ^
        sellersUid.hashCode ^
        menuTitle.hashCode ^
        menuInfo.hashCode ^
        publishedDate.hashCode ^
        thumbnail.hashCode ^
        status.hashCode;
  }
}
