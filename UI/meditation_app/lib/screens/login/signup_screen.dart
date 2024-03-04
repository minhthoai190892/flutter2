import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meditation_app/screens/home/choice_topic_screen.dart';

import '../../common/commons.dart';
import '../../common_widget/common_widgets.dart';
import 'widget/login_icon_widget.dart';
import 'widget/login_with.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //   SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  // }

  bool isTrue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Lottie.asset(TImage.signupLottie,
            //     width: double.maxFinite, fit: BoxFit.fitWidth),
            TextWidget(
              text: TText.signupTitle,
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
            const RoundTextField(hintText: 'user name'),
            const SizedBox(
              height: 20,
            ),
            const RoundTextField(hintText: 'Email address'),
            const SizedBox(
              height: 20,
            ),
            const RoundTextField(
              hintText: 'Password',
              right: Icon(Icons.remove_red_eye),
              obscureText: true,
            ),
            const SizedBox(
              height: 20,
            ),

            RoundButton(
              title: TText.getStarted.toUpperCase(),
              onPressed: () {
                context.push(const ChoiceTopicScreen());
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(text: TText.privacePolicy),
                  Checkbox(
                    value: isTrue,
                    onChanged: (value) {
                      setState(() {
                        isTrue = value!;
                      });
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
