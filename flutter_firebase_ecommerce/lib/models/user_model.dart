// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
   final String uId;
   final String userName;
   final String email;
   final String phone;
   final String userImg;
   final String userDeviceToken;
   final String country;
   final String userAddress;
   final String street;
   final bool isAdmin;
   final bool isActive;
   final dynamic createOn;
  UserModel({
    required this.uId,
    required this.userName,
    required this.email,
    required this.phone,
    required this.userImg,
    required this.userDeviceToken,
    required this.country,
    required this.userAddress,
    required this.street,
    required this.isAdmin,
    required this.isActive,
    required this.createOn,
  });


  UserModel copyWith({
    String? uId,
    String? userName,
    String? email,
    String? phone,
    String? userImg,
    String? userDeviceToken,
    String? country,
    String? userAddress,
    String? street,
    bool? isAdmin,
    bool? isActive,
    dynamic? createOn,
  }) {
    return UserModel(
      uId: uId ?? this.uId,
      userName: userName ?? this.userName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      userImg: userImg ?? this.userImg,
      userDeviceToken: userDeviceToken ?? this.userDeviceToken,
      country: country ?? this.country,
      userAddress: userAddress ?? this.userAddress,
      street: street ?? this.street,
      isAdmin: isAdmin ?? this.isAdmin,
      isActive: isActive ?? this.isActive,
      createOn: createOn ?? this.createOn,
    );
  }
/// Serializes the UserModel instance to a JSON map
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uId': uId,
      'userName': userName,
      'email': email,
      'phone': phone,
      'userImg': userImg,
      'userDeviceToken': userDeviceToken,
      'country': country,
      'userAddress': userAddress,
      'street': street,
      'isAdmin': isAdmin,
      'isActive': isActive,
      'createOn': createOn,
    };
  }
/// Create a UserModel instance from a JSON map
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uId: map['uId'] as String,
      userName: map['userName'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      userImg: map['userImg'] as String,
      userDeviceToken: map['userDeviceToken'] as String,
      country: map['country'] as String,
      userAddress: map['userAddress'] as String,
      street: map['street'] as String,
      isAdmin: map['isAdmin'] as bool,
      isActive: map['isActive'] as bool,
      createOn: map['createOn'] as dynamic,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(uId: $uId, userName: $userName, email: $email, phone: $phone, userImg: $userImg, userDeviceToken: $userDeviceToken, country: $country, userAddress: $userAddress, street: $street, isAdmin: $isAdmin, isActive: $isActive, createOn: $createOn)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.uId == uId &&
      other.userName == userName &&
      other.email == email &&
      other.phone == phone &&
      other.userImg == userImg &&
      other.userDeviceToken == userDeviceToken &&
      other.country == country &&
      other.userAddress == userAddress &&
      other.street == street &&
      other.isAdmin == isAdmin &&
      other.isActive == isActive &&
      other.createOn == createOn;
  }

  @override
  int get hashCode {
    return uId.hashCode ^
      userName.hashCode ^
      email.hashCode ^
      phone.hashCode ^
      userImg.hashCode ^
      userDeviceToken.hashCode ^
      country.hashCode ^
      userAddress.hashCode ^
      street.hashCode ^
      isAdmin.hashCode ^
      isActive.hashCode ^
      createOn.hashCode;
  }
}
