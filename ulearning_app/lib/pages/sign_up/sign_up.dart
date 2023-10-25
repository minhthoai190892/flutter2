// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/widgets/button_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/pages/sign_up/sign_up_controller.dart';
import '../../common/widgets/app_bar.dart';
import '../../common/widgets/app_textfield.dart';
import 'notifier/register_notifier.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({super.key});

  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  late SignUpController _controler;
  @override
  void initState() {
    // TODO: implement initState
    _controler = SignUpController(ref: ref);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final regProvider = ref.watch(registerNotifierProvider);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: buildAppBar(text: 'Sign Up'),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: text14Normal(
                      text: 'Enter your details below & free sign up'),
                ),
                const SizedBox(
                  height: 50,
                ),
                // user name text box
                appTextFiield(
                  text: 'User name',
                  iconName: 'assets/icons/user.png',
                  obscureText: false,
                  hintText: 'Enter your user name',
                  func: (value) => ref
                      .read(registerNotifierProvider.notifier)
                      .onUserNameChange(value),
                ),
                const SizedBox(
                  height: 20,
                ),
                // email text box
                appTextFiield(
                    //nhận giá trị khi người dùng nhập vào textfield
                    func: (value) => ref
                        .read(registerNotifierProvider.notifier)
                        .onUserEmailChange(value),
                    text: 'Email',
                    iconName: 'assets/icons/user.png',
                    obscureText: false,
                    hintText: 'Enter your email address'),
                const SizedBox(
                  height: 20,
                ),
                // password text box
                appTextFiield(
                    func: (value) => ref
                        .read(registerNotifierProvider.notifier)
                        .onUserPasswordChange(value),
                    text: 'Password',
                    iconName: 'assets/icons/lock.png',
                    obscureText: true,
                    hintText: 'Enter your password'),
                const SizedBox(
                  height: 20,
                ),
                // password text box
                appTextFiield(
                    func: (value) => ref
                        .read(registerNotifierProvider.notifier)
                        .onUserRePasswordChange(value),
                    text: 'Confirm Password',
                    iconName: 'assets/icons/lock.png',
                    obscureText: true,
                    hintText: 'Enter your confirm password'),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 25),
                  child: text14Normal(
                      text:
                          'By creating an account, you have to agree with\nout them & conditions'),
                ),
                const SizedBox(
                  height: 100,
                ),
                // Sign up
                Center(
                    child: appButton(
                  buttonName: 'Login',
                  isLogin: true,
                  func: () {
                    _controler.handlerSignUp();
                  },
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
