// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Place {
  final String id;
  final String title;
  final File image;
  final PlaceLocation location;
  Place({
    required this.title,
    required this.image,
    required this.location,
  }) : id = uuid.v4();
}

class PlaceLocation {
  final double latitude;
  final double longitude;
  final String address;
  PlaceLocation({
    required this.latitude,
    required this.longitude,
    required this.address,
  });
}
