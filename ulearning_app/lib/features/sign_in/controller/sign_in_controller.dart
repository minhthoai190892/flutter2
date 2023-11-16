// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_print

import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/global_loader/global_loader.dart';
import 'package:ulearning_app/common/widgets/popup_message.dart';
import 'package:ulearning_app/features/sign_in/notifier/sign_in_notifier.dart';
import 'package:ulearning_app/features/sign_in/repo/sign_in_repo.dart';
import 'package:ulearning_app/global.dart';
import 'package:ulearning_app/common/models/user.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/main.dart';
import 'package:ulearning_app/services/http_util.dart';

class SignInController {
  SignInController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Future<void> handleSignIn(WidgetRef ref) async {
    var state = ref.read(signInNotifierProvider);
    String email = state.email;
    String password = state.password;
    emailController.text = email;
    passwordController.text = password;
    if (state.email.isEmpty || email.isEmpty) {
      toastInfo('Your email is empty');
      return;
    }
    if (state.password.isEmpty || password.isEmpty) {
      toastInfo('Your password is empty');
      return;
    }
    ref.read(appLoaderProvider.notifier).setLoaderValue(true);
    try {
      // Login với email vầ password
      final credential = await SignInRepo.firebaseSignIn(email, password);

      if (credential.user == null) {
        toastInfo('User not found');
        return;
      }
      if (!credential.user!.emailVerified) {
        toastInfo('You must verify your email address first!');
        return;
      }

      var user = credential.user;
      if (user != null) {
        String? displayName = user.displayName;
        String? email = user.email;
        String? id = user.uid;
        String? photoUrl = user.photoURL;
        LoginRequestEntity loginRequestEntity = LoginRequestEntity();
        loginRequestEntity.avatar = photoUrl;
        loginRequestEntity.name = displayName;
        loginRequestEntity.email = email;
        loginRequestEntity.open_id = id;
        loginRequestEntity.type = 1;
        asyncPostAllData(loginRequestEntity);
        print('user logged in');
      } else {
        toastInfo('Login error');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        toastInfo('the email address is not valid.');
        print('invalid-email');
      } else if (e.code == 'user-disabled') {
        toastInfo(
            'the user corresponding to the given email has been disabled.');
      } else if (e.code == 'user-not-found') {
        toastInfo('there is no user corresponding to the given email.');
      } else if (e.code == 'wrong-password') {
        toastInfo(
            'Thrown if the password is invalid for the given email, or the account corresponding to the email does not have a password set.');
        print('wrong-password');
      }
      print('e.code ${e.code}');
    }
    ref.read(appLoaderProvider.notifier).setLoaderValue(false);
  }

  Future<void> asyncPostAllData(LoginRequestEntity loginRequestEntity) async {
    // we need to take to server
    var result = await SignInRepo.login(param: loginRequestEntity);
    if (result.code == 200) {
      // have local storage
      try {
        // try to remember user info
        Global.storageService.setString(
            AppConstants.STORAGE_USER_PROFILE_KEY, jsonEncode(result.data));
        Global.storageService.setString(
            AppConstants.STORAGE_USER_TOKEN_KEY, result.data!.access_token!);
        // di chuyển đến route đã cho và xóa toàn bộ các route trước đó
        navKey.currentState
            ?.pushNamedAndRemoveUntil('/application', (route) => false);
      } catch (e) {
        print(e.toString());
      }
      // redirect to new page
    }else{
      toastInfo('Login Error');
    }
  }
}
