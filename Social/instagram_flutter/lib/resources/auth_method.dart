// ignore_for_file: unnecessary_null_comparison

import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_flutter/models/user.dart' as model;
import 'package:instagram_flutter/resources/storage_method.dart';

class AuthMethod {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<model.User> getUserDetails() async {
    User user = _auth.currentUser!;
    DocumentSnapshot snap =
        await _firestore.collection('users').doc(user.uid).get();
    return model.User.fromSnap(snap);
  }

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
        res = 'success';

        // resgiter user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        print('UserCredential: ${cred.user!.uid}');

        // add image
        String photoUrl = await StorageMethod()
            .uploadImageToStorage('profilePics', file, false);
        //
        model.User user = model.User(
                email: email,
                uid: cred.user!.uid,
                photoUrl: photoUrl,
                username: username,
                bio: bio,
                followers: [],
                following: [])
            // add user to our database
            ;
        await _firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toMap());
      } else {
        res = 'Please enter all fields';
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
