// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Sellers {
  final String sellerUid;
  final String sellerName;
  final String sellerAvataUrl;
  final String sellerEmail;
  Sellers({
    required this.sellerUid,
    required this.sellerName,
    required this.sellerAvataUrl,
    required this.sellerEmail,
  });

  Sellers copyWith({
    String? sellerUid,
    String? sellerName,
    String? sellerAvataUrl,
    String? sellerEmail,
  }) {
    return Sellers(
      sellerUid: sellerUid ?? this.sellerUid,
      sellerName: sellerName ?? this.sellerName,
      sellerAvataUrl: sellerAvataUrl ?? this.sellerAvataUrl,
      sellerEmail: sellerEmail ?? this.sellerEmail,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sellerUid': sellerUid,
      'sellerName': sellerName,
      'sellerAvataUrl': sellerAvataUrl,
      'sellerEmail': sellerEmail,
    };
  }

  factory Sellers.fromMap(Map<String, dynamic> map) {
    return Sellers(
      sellerUid: map['sellerUid'] as String,
      sellerName: map['sellerName'] as String,
      sellerAvataUrl: map['sellerAvataUrl'] as String,
      sellerEmail: map['sellerEmail'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Sellers.fromJson(String source) =>
      Sellers.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Sellers(sellerUid: $sellerUid, sellerName: $sellerName, sellerAvataUrl: $sellerAvataUrl, sellerEmail: $sellerEmail)';
  }

  @override
  bool operator ==(covariant Sellers other) {
    if (identical(this, other)) return true;

    return other.sellerUid == sellerUid &&
        other.sellerName == sellerName &&
        other.sellerAvataUrl == sellerAvataUrl &&
        other.sellerEmail == sellerEmail;
  }

  @override
  int get hashCode {
    return sellerUid.hashCode ^
        sellerName.hashCode ^
        sellerAvataUrl.hashCode ^
        sellerEmail.hashCode;
  }
}
