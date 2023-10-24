import 'package:flutter/material.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/widgets/button_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';

import 'widgets/sign_in_widgets.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
          child: Scaffold(
        appBar: buildAppBar(),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // top login button
              thirdPartyLogin(),
              // more login options message
              Center(
                  child: text14Normal(text: 'Or use your email account login')),
              const SizedBox(
                height: 50,
              ),
              // email text box
              appTextFiield(
                  text: 'Email',
                  iconName: 'assets/icons/user.png',
                  obscureText: false,
                  hintText: 'Enter your email address'),
              const SizedBox(
                height: 20,
              ),
              // password text box
              appTextFiield(
                  text: 'Password',
                  iconName: 'assets/icons/lock.png',
                  obscureText: true,
                  hintText: 'Enter your password'),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(left: 25),
                child: textUnderLine(text: 'Forgot password?'),
              ),
              const SizedBox(
                height: 100,
              ),
              // login
              Center(child: appButton(buttonName: 'Login', isLogin: true)),
              const SizedBox(
                height: 20,
              ),
              // register
              Center(
                  child: appButton(
                      buttonName: 'Register',
                      isLogin: false,
                      context: context)),
            ],
          ),
        ),
      )),
    );
  }
}
