// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/commons/utils/utils.dart';
import 'package:whatsapp/features/auths/screens/otp_screen.dart';

class AuthRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  AuthRepository({
    required this.auth,
    required this.firestore,
  });
  void signInWithPhone(
      {required String phoneNumber, required BuildContext context}) async {
    try {
      await auth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: (phoneAuthCredential) async {
            await auth.signInWithCredential(phoneAuthCredential);
          },
          verificationFailed: (error) {
            throw Exception(error.message);
          },
          codeSent: (verificationId, forceResendingToken) {
            Navigator.pushNamed(context, OTPScreen.routeName,arguments: verificationId);
          },
          codeAutoRetrievalTimeout: (verificationId) {
            
          },);
    } on FirebaseAuthException catch (e) {
      showSnackBar(context: context, content: e.message.toString());
    } catch (e) {
      print(e);
    }
  }
}
