import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widgets.login_signup/divider_widget.dart';
import '../../../common/widgets.login_signup/social_button_widget.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../controllers/signup_controller.dart';
import 'widgets/sign_up_form_widget.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final dark = THelperFuntions.isDarkMode(context: context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignupView'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //!TODO: Title
                Text(TTexts.signupTitle,
                    style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                //!TODO: Form
                TSignupForm(dark: dark),
                //!TODO: Divier
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                TDividerForm(dark: dark, dividerText: TTexts.orSignUpWith),
                //!TODO: Social
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                const TSocialButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
