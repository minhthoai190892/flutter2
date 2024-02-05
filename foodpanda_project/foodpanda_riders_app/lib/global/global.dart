import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? sharedPreferences;
FirebaseAuth firebaseAuth = FirebaseAuth.instance;
FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

// location
Position? position;
String? completeAddress;
List<Placemark>? placemarks;

String perParcelDeliveryAmount = '';
String previousEarnings = ''; //it is seller old total earnig
String previousRiderEarnings = ''; //it is rider old total earnig
