import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_food_delivery_ecommerce/pages/signup.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();
  String email = '';
  final _formKey = GlobalKey<FormState>();
  resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.orangeAccent,
          content: Text(
            'Password reset  email sent successfully!',
            style: TextStyle(fontSize: 18),
          )));
    } on FirebaseException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              'user-not-found',
              style: TextStyle(fontSize: 18),
            )));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.topCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Forgot Password',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Enter your email',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: ListView(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.white70, width: 2.0),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: TextFormField(
                            controller: emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: 'Enter your email',
                              hintStyle: TextStyle(fontSize: 18),
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.black,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 60),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 140,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      if (_formKey.currentState!.validate()) {
                                        setState(() {
                                          email = emailController.text;
                                        });
                                      }
                                      resetPassword();
                                    },
                                    child: Text(
                                      'Send Email',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            const Text(
                              "Don't have an account?",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const SignUp(),
                                      ));
                                },
                                child: const Text(
                                  'Create',
                                  style: TextStyle(
                                      color: Colors.orangeAccent, fontSize: 20),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
