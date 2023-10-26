// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_print
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/global_loader/global_loader.dart';
import 'package:ulearning_app/common/widgets/popup_message.dart';
import 'package:ulearning_app/pages/sign_up/notifier/register_notifier.dart';

class SignUpController {
  late WidgetRef ref;
  SignUpController({
    required this.ref,
  });
  void handlerSignUp() async {
    var state = ref.read(registerNotifierProvider);
    String name = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;
    if (name.isEmpty || state.userName.isEmpty) {
      toastInfo('Your name is empty');
      return;
    }
    if (name.length < 6 || name.length < 6) {
      toastInfo('Your name is too short');
      return;
    }
    if (state.email.isEmpty || email.isEmpty) {
      toastInfo('Your email is empty');
      return;
    }
    print('name: $name');
    print('email: $email');
    print('password: $password');
    print('rePassword: $rePassword');
    if ((state.password != state.rePassword) || password != rePassword) {
      toastInfo('Your password did not match');
      return;
    }
    if ((state.password.isEmpty || state.rePassword.isEmpty) ||
        password.isEmpty ||
        rePassword.isEmpty) {
      toastInfo('Your password  is empty');
      return;
    }
    // if ((state.password.length < 6 || state.rePassword.length < 6) ||
    //     password.isEmpty ||
    //     rePassword.isEmpty) {
    //   toastInfo('Password should be at least 6 characters');
    //   return;
    // }
    var context = Navigator.of(ref.context);
    // show the loading icon
    ref.read(appLoaderProvider.notifier).setLoaderValue(true);
    //  chờ thực hiện sau 2s

    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      print(credential);
      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(name);
        // get server photo url
        // set user photo url
        toastInfo(
            'Asn email has been sent to verify your account. Please open that email and confirm your identity.');
        context.pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastInfo('This password is too weak.');
      } else if (e.code == 'email-already-in-use') {
        toastInfo('This email address has already been registered.');
      } else if (e.code == 'invalid-email') {
        toastInfo('Thrown if the email address is not valid.');
      }else if(e.code == 'user-not-found'){
        toastInfo('User not found.');

      }
    } catch (e) {
      print(e.toString());
    }
    //show the register page
    ref.watch(appLoaderProvider.notifier).setLoaderValue(false);
  }
}
