import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:meditation_app/common/commons.dart';
import 'package:meditation_app/screens/home/reminder_screen.dart';
import 'package:meditation_app/screens/login/login_screen.dart';
import 'package:meditation_app/screens/login/signup_screen.dart';

import '../../common/image_extension.dart';
import '../../common_widget/common_widgets.dart';

class StartUpScreen extends StatefulWidget {
  const StartUpScreen({super.key});

  @override
  State<StartUpScreen> createState() => _StartUpScreenState();
}

class _StartUpScreenState extends State<StartUpScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Silent '),
              Image.asset('assets/images/logo-meditation.png'),
              const Text(' Moon '),
            ],
          ),
          Lottie.asset(TImage.startUp,
              width: double.maxFinite, fit: BoxFit.fitWidth),
          const Spacer(),
          TextWidget(
            text: TText.title,
            color: TColor.primaryText,
            fontSize: 30,
            fontWeight: FontWeight.w700,
          ),
          const SizedBox(
            height: 15,
          ),
          TextWidget(
            text: TText.subTitle,
            color: TColor.primaryText,
            textAlign: TextAlign.center,
            fontSize: 16,
          ),
          const Spacer(),
          RoundButton(
            title: TText.signup.toUpperCase(),
            onPressed: () {
              context.push(const SignupScreen());
              // context.push(const ReminderScreen());
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextWidget(
                text: TText.alreadyHaveAnAccount.toUpperCase(),
                color: TColor.secondaryText,
              ),
              TextButton(
                  onPressed: () {
                    context.push(const LoginScreen());
                  },
                  child: TextWidget(text: TText.login.toUpperCase()))
            ],
          )
        ],
      ),
    );
  }
}
