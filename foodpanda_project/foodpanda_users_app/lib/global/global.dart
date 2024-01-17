import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? sharedPreferences;
FirebaseAuth firebaseAuth = FirebaseAuth.instance;
FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
