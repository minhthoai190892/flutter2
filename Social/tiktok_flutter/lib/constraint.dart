// COLORS
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_flutter/controllers/controller.dart';
import 'package:tiktok_flutter/views/screens/add_video_screen.dart';

const backgroundColor = Colors.black;
var buttonColor = Colors.red[400];
const borderColor = Colors.grey;
// FIREBASE
var firebaseAuth = FirebaseAuth.instance;
var firebaseFirestore = FirebaseFirestore.instance;
var firebaseStorage = FirebaseStorage.instance;
// CONTROLLER
var authController = AuthController.instance;
// PAGES
const pages = [
  Center(
    child: Text('Home Screen'),
  ),
  Center(
    child: Text('Search Screen'),
  ),
  AddVideoScreen(),
  Center(
    child: Text('MEssage Screen'),
  ),
  Center(
    child: Text('Profile Screen'),
  ),
];
