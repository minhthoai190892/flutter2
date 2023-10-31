// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/global_loader/global_loader.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/button_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/features/sign_in/notifier/sign_in_notifier.dart';
import 'package:ulearning_app/features/sign_in/controller/sign_in_controller.dart';

import '../../../common/utils/app_colors.dart';
import '../../../common/widgets/app_bar.dart';
import '../../../common/widgets/app_textfield.dart';
import 'widgets/sign_in_widgets.dart';

class SignIn extends ConsumerStatefulWidget {
  const SignIn({super.key});

  @override
  ConsumerState<SignIn> createState() => _SignInState();
}

class _SignInState extends ConsumerState<SignIn> {
  late SignInController _signInController;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _signInController = SignInController();
  }

  @override
  Widget build(BuildContext context) {
    final signInProvider = ref.watch(signInNotifierProvider);
    // print(signInProvider);
    final loader = ref.watch(appLoaderProvider);
    return Container(
      color: Colors.white,
      child: SafeArea(
          child: Scaffold(
        appBar: buildAppBar(text: 'Login'),
        backgroundColor: Colors.white,
        body: loader == false
            ? SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // top login button
                    thirdPartyLogin(),
                    // more login options message
                    Center(
                        child: text14Normal(
                            text: 'Or use your email account login')),
                    const SizedBox(
                      height: 50,
                    ),
                    // email text box
                    appTextFiield(
                      controller: _signInController.emailController,
                      text: 'Email',
                      iconName: ImageRes.user,
                      obscureText: false,
                      hintText: 'Enter your email address',
                      func: (value) => ref
                          .read(signInNotifierProvider.notifier)
                          .onUserEmailChange(value),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // password text box
                    appTextFiield(
                      controller: _signInController.passwordController,
                      text: 'Password',
                      iconName: ImageRes.lock,
                      obscureText: true,
                      hintText: 'Enter your password',
                      func: (value) => ref
                          .read(signInNotifierProvider.notifier)
                          .onUserPasswordChange(value),
                    ),
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
                    Center(
                      child: appButton(
                        buttonName: 'Login',
                        isLogin: true,
                        func: () => _signInController.handleSignIn(ref),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // register
                    Center(
                      child: appButton(
                        buttonName: 'Register',
                        isLogin: false,
                        context: context,
                        func: () => Navigator.pushNamed(context, '/register'),
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => const SignUp(),
                        //     )),
                      ),
                    ),
                  ],
                ),
              )
            : const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryElement,
                  backgroundColor: Colors.blue,
                ),
              ),
      )),
    );
  }
}
