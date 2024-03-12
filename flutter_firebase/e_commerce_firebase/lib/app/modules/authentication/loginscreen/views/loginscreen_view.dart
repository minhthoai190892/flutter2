import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/styles/spacing_styles.dart';
import '../../../../common/widgets.login_signup/form_widget.dart';
import '../../../../common/widgets.login_signup/social_button_widget.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../controllers/loginscreen_controller.dart';
import '../../../../common/widgets.login_signup/divider_widget.dart';
import 'widgets/login_header_widget.dart';

class LoginscreenView extends GetView<LoginscreenController> {
  const LoginscreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final dark = THelperFuntions.isDarkMode(context: context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: TSpacingStyle.paddingWithAppBarHeight,
            child: Column(
              children: [
                // logo, Title, Subtitle
                TLoginHeader(dark: dark),
                //Form
                const TLoginForm(),

                // divider
                TDividerForm(
                    dark: dark, dividerText: TTexts.orSignInWith.capitalize!),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                // Footer
                const TSocialButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
