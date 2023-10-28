// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LoginRequestEntity {
  int? type;
  String? name;
  String? description;
  String? email;
  String? phone;
  String? avatar;
  String? open_id;
  int? online;
  LoginRequestEntity({
    this.type,
    this.name,
    this.description,
    this.email,
    this.phone,
    this.avatar,
    this.open_id,
    this.online,
  });

  LoginRequestEntity copyWith({
    int? type,
    String? name,
    String? description,
    String? email,
    String? phone,
    String? avatar,
    String? open_id,
    int? online,
  }) {
    return LoginRequestEntity(
      type: type ?? this.type,
      name: name ?? this.name,
      description: description ?? this.description,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      avatar: avatar ?? this.avatar,
      open_id: open_id ?? this.open_id,
      online: online ?? this.online,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'type': type,
      'name': name,
      'description': description,
      'email': email,
      'phone': phone,
      'avatar': avatar,
      'open_id': open_id,
      'online': online,
    };
  }

  factory LoginRequestEntity.fromMap(Map<String, dynamic> map) {
    return LoginRequestEntity(
      type: map['type'] != null ? map['type'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      avatar: map['avatar'] != null ? map['avatar'] as String : null,
      open_id: map['open_id'] != null ? map['open_id'] as String : null,
      online: map['online'] != null ? map['online'] as int : null,
    );
  }

  String toJsonn() => json.encode(toJson());

  factory LoginRequestEntity.fromJson(String source) =>
      LoginRequestEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'LoginRequestEntity(type: $type, name: $name, description: $description, email: $email, phone: $phone, avatar: $avatar, open_id: $open_id, online: $online)';
  }

  @override
  bool operator ==(covariant LoginRequestEntity other) {
    if (identical(this, other)) return true;

    return other.type == type &&
        other.name == name &&
        other.description == description &&
        other.email == email &&
        other.phone == phone &&
        other.avatar == avatar &&
        other.open_id == open_id &&
        other.online == online;
  }

  @override
  int get hashCode {
    return type.hashCode ^
        name.hashCode ^
        description.hashCode ^
        email.hashCode ^
        phone.hashCode ^
        avatar.hashCode ^
        open_id.hashCode ^
        online.hashCode;
  }
}
