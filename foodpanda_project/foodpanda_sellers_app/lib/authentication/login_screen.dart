// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodpanda_sellers_app/authentication/auth_screen.dart';
import 'package:foodpanda_sellers_app/global/global.dart';
import 'package:foodpanda_sellers_app/main_screen/home_screen.dart';
import 'package:foodpanda_sellers_app/widgets/error_dialog_widget.dart';
import 'package:foodpanda_sellers_app/widgets/loading_dialog_widget.dart';

import '../widgets/custom_text_field_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  void formValidation() {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      // login
      loginNow();
    } else {
      // error
      showDialog(
        context: context,
        builder: (context) =>
            const ErrorDialogWidget(message: 'Please enter all fields'),
      );
    }
  }

  loginNow() async {
    showDialog(
      context: context,
      builder: (context) =>
          const LoadingDialogWidget(message: 'Checking Credentials'),
    );
    User? currentUser;
    await firebaseAuth
        .signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    )
        .then((auth) {
      currentUser = auth.user;
    }).catchError((error) {
      Navigator.pop(context);
      showDialog(
        context: context,
        builder: (context) =>
            ErrorDialogWidget(message: error.message.toString()),
      );
    });
    if (currentUser != null) {
      readDataAndSetDataLocally(currentUser!);
    }
  }

  Future readDataAndSetDataLocally(User currentUser) async {
    await FirebaseFirestore.instance
        .collection('sellers')
        .doc(currentUser.uid)
        .get()
        .then((snapshot) {
      if (snapshot.exists) {
        // save locally
        sharedPreferences!.setString('uid', currentUser.uid);
        sharedPreferences!.setString('email', snapshot.data()!['sellerEmail']);
        sharedPreferences!.setString('name', snapshot.data()!['sellerName']);
        sharedPreferences!
            .setString('photoUrl', snapshot.data()!['sellerAvatarurl']);
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      } else {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AuthScreen(),
          ),
        );
        showDialog(
          context: context,
          builder: (context) =>
              const ErrorDialogWidget(message: 'No records found'),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print('object: $size');
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Image.asset(
                'assets/images/seller.png',
                height: size.height * 0.45,
              ),
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextFieldWidget(
                  controller: emailController,
                  hintText: 'Enail',
                  iconData: Icons.email,
                  isObserce: false,
                ),
                CustomTextFieldWidget(
                  controller: passwordController,
                  hintText: 'Password',
                  iconData: Icons.password,
                  isObserce: true,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              print('Login ');
              formValidation();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
              padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 10),
            ),
            child: const Text(
              'Signup',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
