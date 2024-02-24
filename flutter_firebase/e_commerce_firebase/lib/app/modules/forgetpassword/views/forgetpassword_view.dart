import 'package:e_commerce_firebase/app/modules/resetpassword/views/resetpassword_view.dart';
import 'package:e_commerce_firebase/app/routes/app_pages.dart';
import 'package:e_commerce_firebase/app/utils/constants/sizes.dart';
import 'package:e_commerce_firebase/app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../controllers/forgetpassword_controller.dart';

class ForgetpasswordView extends GetView<ForgetpasswordController> {
  const ForgetpasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //!TODO: heading
            Text(
              TTexts.forgetPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            Text(
              TTexts.forgetPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(
              height: TSizes.spaceBtwSections * 2,
            ),
            //!TODO:  text field
            TextFormField(
              decoration: const InputDecoration(
                  labelText: TTexts.email,
                  prefixIcon: Icon(Iconsax.direct_right)),
            ),
            //!TODO:  submit button
            SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => Get.offAllNamed(Routes.RESETPASSWORD),
                  child: Text(TTexts.submit)),
            )
          ],
        ),
      ),
    );
  }
}
