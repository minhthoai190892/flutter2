// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class DirectGeocoding extends Equatable {
  final String name;
  final String lat;
  final String lon;
  final String country;
  const DirectGeocoding({
    required this.name,
    required this.lat,
    required this.lon,
    required this.country,
  });

  DirectGeocoding copyWith({
    String? name,
    String? lat,
    String? lon,
    String? country,
  }) {
    return DirectGeocoding(
      name: name ?? this.name,
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      country: country ?? this.country,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'lat': lat,
      'lon': lon,
      'country': country,
    };
  }

  factory DirectGeocoding.fromMap(Map<String, dynamic> map) {
    return DirectGeocoding(
      name: map['name'] as String,
      lat: map['lat'] as String,
      lon: map['lon'] as String,
      country: map['country'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DirectGeocoding.fromJson(String source) =>
      DirectGeocoding.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [name, lat, lon, country];
}
