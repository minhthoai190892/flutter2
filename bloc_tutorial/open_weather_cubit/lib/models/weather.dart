// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final String description;
  final String icon;
  final double temp;
  final double tempMax;

  final double tempMin;
  final String name;
  final String country;
  final DateTime lastupdated;
  const Weather({
    required this.description,
    required this.icon,
    required this.temp,
    required this.tempMax,
    required this.tempMin,
    required this.name,
    required this.country,
    required this.lastupdated,
  });

  Weather copyWith({
    String? description,
    String? icon,
    double? temp,
    double? tempMax,
    double? tempMin,
    String? name,
    String? country,
    DateTime? lastupdated,
  }) {
    return Weather(
      description: description ?? this.description,
      icon: icon ?? this.icon,
      temp: temp ?? this.temp,
      tempMax: tempMax ?? this.tempMax,
      tempMin: tempMin ?? this.tempMin,
      name: name ?? this.name,
      country: country ?? this.country,
      lastupdated: lastupdated ?? this.lastupdated,
    );
  }

  factory Weather.initial() {
    return Weather(
        description: '',
        icon: '',
        temp: 100.0,
        tempMax: 100.0,
        tempMin: 100.0,
        name: '',
        country: '',
        lastupdated: DateTime(1970));
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'description': description,
      'icon': icon,
      'temp': temp,
      'tempMax': tempMax,
      'tempMin': tempMin,
      'name': name,
      'country': country,
      'lastupdated': lastupdated.millisecondsSinceEpoch,
    };
  }

  factory Weather.fromMap(Map<String, dynamic> map) {
    final weather = map['weather'][0];
    final main = map['main'];
    return Weather(
      description: weather['description'] as String,
      icon: weather['icon'] as String,
      temp: main['temp'] as double,
      tempMax: main['tempMax'] as double,
      tempMin: main['tempMin'] as double,
      name: '',
      country: '',
      lastupdated: DateTime.now(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Weather.fromJson(String source) =>
      Weather.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      description,
      icon,
      temp,
      tempMax,
      tempMin,
      name,
      country,
      lastupdated,
    ];
  }
}
