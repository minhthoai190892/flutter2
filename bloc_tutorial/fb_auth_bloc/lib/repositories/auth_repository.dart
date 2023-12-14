// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fb_auth_bloc/constants/db_constants.dart';
import 'package:fb_auth_bloc/models/custom_error.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseFirestore firebaseFirestore;
  final FirebaseAuth firebaseAuth;
  AuthRepository({
    required this.firebaseFirestore,
    required this.firebaseAuth,
  });
  Stream<User?> get user => firebaseAuth.userChanges();
  Future<void> signUP(
      {required String name,
      required String email,
      required String password}) async {
    try {
      final UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      final signedInUser = userCredential.user!;
      await usersRef.doc(signedInUser.uid).set({
        'name': name,
        'email': email,
        'profileImage': 'https://picsum.photos/300',
        'point': 0,
        'rank': 'bronze'
      });
    } on FirebaseAuthException catch (e) {
      throw CustomError(code: e.code, message: e.message!, plugin: e.plugin);
    } catch (e) {
      throw CustomError(
          code: 'Exception',
          message: e.toString(),
          plugin: 'flutter_error/server_error');
    }
  }

  Future<void> signIn({required String email, required String password}) async {
    try {
      final UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw CustomError(code: e.code, message: e.message!, plugin: e.plugin);
    } catch (e) {
      throw CustomError(
          code: 'Exception',
          message: e.toString(),
          plugin: 'flutter_error/server_error');
    }
  }

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }
}
