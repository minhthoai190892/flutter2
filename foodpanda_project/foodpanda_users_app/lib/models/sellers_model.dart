// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SellersModel {
  final String? sellerUID;
  final String? sellerName;
  final String? sellerAvataUrl;
  final String? sellerEmail;
  SellersModel({
    required this.sellerUID,
    required this.sellerName,
    required this.sellerAvataUrl,
    required this.sellerEmail,
  });

  SellersModel copyWith({
    String? sellerUid,
    String? sellerName,
    String? sellerAvataUrl,
    String? sellerEmail,
  }) {
    return SellersModel(
      sellerUID: sellerUid ?? this.sellerUID,
      sellerName: sellerName ?? this.sellerName,
      sellerAvataUrl: sellerAvataUrl ?? this.sellerAvataUrl,
      sellerEmail: sellerEmail ?? this.sellerEmail,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sellerUID': sellerUID,
      'sellerName': sellerName,
      'sellerAvataUrl': sellerAvataUrl,
      'sellerEmail': sellerEmail,
    };
  }

  factory SellersModel.fromMap(Map<String, dynamic> map) {
    return SellersModel(
      sellerUID: map['sellerUID'],
      sellerName: map['sellerName'],
      sellerAvataUrl: map['sellerAvatarUrl'],
      sellerEmail: map['sellerEmail'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SellersModel.fromJson(String source) =>
      SellersModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Sellers(sellerUID: $sellerUID, sellerName: $sellerName, sellerAvataUrl: $sellerAvataUrl, sellerEmail: $sellerEmail)';
  }

  @override
  bool operator ==(covariant SellersModel other) {
    if (identical(this, other)) return true;

    return other.sellerUID == sellerUID &&
        other.sellerName == sellerName &&
        other.sellerAvataUrl == sellerAvataUrl &&
        other.sellerEmail == sellerEmail;
  }

  @override
  int get hashCode {
    return sellerUID.hashCode ^
        sellerName.hashCode ^
        sellerAvataUrl.hashCode ^
        sellerEmail.hashCode;
  }
}
