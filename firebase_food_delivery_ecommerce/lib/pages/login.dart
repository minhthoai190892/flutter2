// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_food_delivery_ecommerce/constants/image_manager.dart';
import 'package:firebase_food_delivery_ecommerce/pages/bottom_nav.dart';
import 'package:firebase_food_delivery_ecommerce/pages/forgot_password.dart';
import 'package:firebase_food_delivery_ecommerce/pages/signup.dart';
import 'package:firebase_food_delivery_ecommerce/widgets/app_widget.dart';
import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  userLogin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const BottomNav(),
          ));
    } on FirebaseException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              'user-not-found',
              style: TextStyle(fontSize: 18),
            )));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              'wrong-password',
              style: TextStyle(fontSize: 18),
            )));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Stack(
          children: [
            Container(
              width: width,
              height: height / 2.5,
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0xFFff5c30),
                  Color(0xFFe74b1a),
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: height / 3),
              width: width,
              height: height / 2,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
            ),
            Container(
              margin: const EdgeInsets.only(top: 60, left: 20, right: 20),
              child: Column(
                children: [
                  Center(child: Image.asset(ImageManager.logo)),
                  const SizedBox(
                    height: 50,
                  ),
                  Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      width: width,
                      height: height / 2.5,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Text(
                              'Login',
                              textAlign: TextAlign.center,
                              style: AppWidget.semiBoldTextFeildStyle(),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              controller: emailController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter Email...  ';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  hintText: 'Email',
                                  helperStyle:
                                      AppWidget.semiBoldTextFeildStyle(),
                                  prefixIcon: const Icon(Icons.email)),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              controller: passwordController,
                              obscureText: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter Password...  ';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  hintText: 'Password',
                                  helperStyle:
                                      AppWidget.semiBoldTextFeildStyle(),
                                  prefixIcon:
                                      const Icon(Icons.password_outlined)),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              alignment: Alignment.topRight,
                              child: GestureDetector(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ForgotPassword(),
                                    )),
                                child: Text(
                                  'Forgot Password?',
                                  style: AppWidget.semiBoldTextFeildStyle(),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    email = emailController.text;
                                    password = passwordController.text;
                                  });
                                }
                                userLogin();
                              },
                              child: Material(
                                elevation: 5,
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    color: Colors.redAccent,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Text(
                                    'LOGIN',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height / 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Dont't have an account?",
                        style: AppWidget.semiBoldTextFeildStyle(),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUp(),
                            )),
                        child: Text(
                          ' Sign up',
                          style: AppWidget.semiBoldTextFeildStyle(),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
