import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:meditation_app/screens/login/signup_screen.dart';

import '../../common/commons.dart';
import '../../common_widget/common_widgets.dart';
import 'widget/login_icon_widget.dart';
import 'widget/login_with.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Lottie.asset(TImage.loginLottie,
                width: double.maxFinite, fit: BoxFit.fitWidth),
            TextWidget(
              text: TText.loginTitle,
              color: TColor.primaryText,
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),

            //!TODO: Login in with Facebook
            LoginWith(
              onPressed: () {},
              backgroundColor: TColor.primary,
              widget: LoginIconWidget(
                imageUrl: TImage.facebookLogo,
                text: TText.facebook,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //!TODO: Login in with Google
            LoginWith(
              onPressed: () {},
              backgroundColor: TColor.tertiary.withOpacity(0.3),
              widget: LoginIconWidget(
                imageUrl: TImage.googleLogo,
                text: TText.google,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 35,
            ),

            TextWidget(text: TText.orLogin),
            const SizedBox(
              height: 35,
            ),
            const RoundTextField(hintText: 'Email address'),
            const SizedBox(
              height: 20,
            ),
            const RoundTextField(hintText: 'Password'),
            const SizedBox(
              height: 20,
            ),

            RoundButton(
              title: TText.signup.toUpperCase(),
              onPressed: () {
                context.push(SignupScreen());
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                TText.forgetPassword,
                style: TextStyle(
                    color: TColor.primary,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextWidget(
                    text: TText.createNewAccount,
                    color: TColor.secondaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  TextWidget(
                    text: TText.signup,
                    color: TColor.primary,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
