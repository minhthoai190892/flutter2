// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AddressModel {
  final String name;
  final String phoneNumber;
  final String flatNumber;
  final String city;
  final String state;
  final String fullAddress;
  final double lat;
  final double long;
  AddressModel({
    required this.name,
    required this.phoneNumber,
    required this.flatNumber,
    required this.city,
    required this.state,
    required this.fullAddress,
    required this.lat,
    required this.long,
  });
  

  AddressModel copyWith({
    String? name,
    String? phoneNumber,
    String? flatNumber,
    String? city,
    String? state,
    String? fullAddress,
    double? lat,
    double? long,
  }) {
    return AddressModel(
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      flatNumber: flatNumber ?? this.flatNumber,
      city: city ?? this.city,
      state: state ?? this.state,
      fullAddress: fullAddress ?? this.fullAddress,
      lat: lat ?? this.lat,
      long: long ?? this.long,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'phoneNumber': phoneNumber,
      'flatNumber': flatNumber,
      'city': city,
      'state': state,
      'fullAddress': fullAddress,
      'lat': lat,
      'long': long,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      name: map['name'] as String,
      phoneNumber: map['phoneNumber'] as String,
      flatNumber: map['flatNumber'] as String,
      city: map['city'] as String,
      state: map['state'] as String,
      fullAddress: map['fullAddress'] as String,
      lat: map['lat'] as double,
      long: map['long'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) => AddressModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AddressModel(name: $name, phoneNumber: $phoneNumber, flatNumber: $flatNumber, city: $city, state: $state, fullAddress: $fullAddress, lat: $lat, long: $long)';
  }

  @override
  bool operator ==(covariant AddressModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.phoneNumber == phoneNumber &&
      other.flatNumber == flatNumber &&
      other.city == city &&
      other.state == state &&
      other.fullAddress == fullAddress &&
      other.lat == lat &&
      other.long == long;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      phoneNumber.hashCode ^
      flatNumber.hashCode ^
      city.hashCode ^
      state.hashCode ^
      fullAddress.hashCode ^
      lat.hashCode ^
      long.hashCode;
  }
}
