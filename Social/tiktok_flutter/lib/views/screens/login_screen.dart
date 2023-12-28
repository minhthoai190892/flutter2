import 'package:flutter/material.dart';
import 'package:tiktok_flutter/constraint.dart';
import 'package:tiktok_flutter/views/views.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'TikTok clone',
              style: TextStyle(
                fontSize: 35,
                color: buttonColor,
                fontWeight: FontWeight.w900,
              ),
            ),
            const Text(
              'Login',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: TextInputFieldWidget(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  labelText: 'Email',
                  icon: Icons.email,
                  borderColor: borderColor),
            ),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: TextInputFieldWidget(
                keyboardType: TextInputType.emailAddress,
                controller: passwordController,
                labelText: 'Password',
                icon: Icons.password,
                borderColor: borderColor,
                isObscureText: true,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            InkWell(
              onTap: () => print('user login'),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                  color: buttonColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account? ",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                InkWell(
                  onTap: () => print('Register'),
                  child: Text(
                    "Register",
                    style: TextStyle(fontSize: 20, color: buttonColor),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
