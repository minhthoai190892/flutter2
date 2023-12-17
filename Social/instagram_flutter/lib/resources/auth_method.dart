// ignore_for_file: unnecessary_null_comparison

import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_flutter/resources/storage_method.dart';

class AuthMethod {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // signup user
  Future<String> signUpUser(
      {required String email,
      required String password,
      required String username,
      required String bio,
      required Uint8List file}) async {
    String res = 'Some error occurred ';
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty ||
          file != null) {
        // resgiter user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        print('UserCredential: ${cred.user!.uid}');

        // add image
        String photoUrl =
            await StorageMethod().uploadImage('profilePics', file, false);
        // add user to our database
        await _firestore.collection('users').doc(cred.user!.uid).set({
          'uid': cred.user!.uid,
          'email': email,
          'password': password,
          'username': username,
          'bio': bio,
          'followers': [],
          'following': [],
          'photo': photoUrl,
        });
        res = 'success';
      }
    } catch (error) {
      res = error.toString();
    }
    return res;
  }

  // login user
  Future<String> loginUser(
      {required String email, required String password}) async {
    String res = 'Some error occurred';
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = 'success';
      } else {
        res = 'Please enter all the information';
      }
    } catch (error) {
      res = error.toString();
    }
    return res;
  }
}
