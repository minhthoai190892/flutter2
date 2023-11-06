// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
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

class UserProfile {
  String? access_token;
  String? token;
  String? name;
  String? description;
  String? avatar;
  int? online;
  int? type;
  UserProfile({
    this.access_token,
    this.token,
    this.name,
    this.description,
    this.avatar,
    this.online,
    this.type,
  });

  UserProfile copyWith({
    String? access_token,
    String? token,
    String? name,
    String? description,
    String? avatar,
    int? online,
    int? type,
  }) {
    return UserProfile(
      access_token: access_token ?? this.access_token,
      token: token ?? this.token,
      name: name ?? this.name,
      description: description ?? this.description,
      avatar: avatar ?? this.avatar,
      online: online ?? this.online,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'access_token': access_token,
      'token': token,
      'name': name,
      'description': description,
      'avatar': avatar,
      'online': online,
      'type': type,
    };
  }

  factory UserProfile.fromMap(Map<String, dynamic> map) {
    // if ((map['access_token'] == null)) {
    //   return UserProfile();
    // }
    return UserProfile(
      access_token:
          map['access_token'] != null ? map['access_token'] as String : null,
      token: map['token'] != null ? map['token'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      avatar: map['avatar'] != null ? map['avatar'] as String : null,
      online: map['online'] != null ? map['online'] as int : null,
      type: map['type'] != null ? map['type'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserProfile.fromJson(String source) =>
      UserProfile.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserItem(access_token: $access_token, token: $token, name: $name, description: $description, avatar: $avatar, online: $online, type: $type)';
  }

  @override
  bool operator ==(covariant UserProfile other) {
    if (identical(this, other)) return true;

    return other.access_token == access_token &&
        other.token == token &&
        other.name == name &&
        other.description == description &&
        other.avatar == avatar &&
        other.online == online &&
        other.type == type;
  }

  @override
  int get hashCode {
    return access_token.hashCode ^
        token.hashCode ^
        name.hashCode ^
        description.hashCode ^
        avatar.hashCode ^
        online.hashCode ^
        type.hashCode;
  }
}

class UserLoginResponseEntity {
  int? code;
  String? msg;
  UserProfile? data;
  UserLoginResponseEntity({
    this.code,
    this.msg,
    this.data,
  });

  UserLoginResponseEntity copyWith({
    int? code,
    String? msg,
    UserProfile? data,
  }) {
    return UserLoginResponseEntity(
      code: code ?? this.code,
      msg: msg ?? this.msg,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'msg': msg,
      'data': data?.toMap(),
    };
  }

  factory UserLoginResponseEntity.fromMap(Map<String, dynamic> map) {
    return UserLoginResponseEntity(
      code: map['code'] != null ? map['code'] as int : null,
      msg: map['msg'] != null ? map['msg'] as String : null,
      data: map['data'] != null
          ? UserProfile.fromMap(map['data'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserLoginResponseEntity.fromJson(String source) =>
      UserLoginResponseEntity.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'UserLoginResponseEntity(code: $code, msg: $msg, data: $data)';

  @override
  bool operator ==(covariant UserLoginResponseEntity other) {
    if (identical(this, other)) return true;

    return other.code == code && other.msg == msg && other.data == data;
  }

  @override
  int get hashCode => code.hashCode ^ msg.hashCode ^ data.hashCode;
}
