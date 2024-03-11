import 'package:e_commerce_firebase/app/common/widgets/appbar/app_bar_widget.dart';
import 'package:e_commerce_firebase/app/common/widgets/images/t_circular_image.dart';
import 'package:e_commerce_firebase/app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_firebase/app/utils/constants/colors.dart';
import 'package:e_commerce_firebase/app/utils/constants/image_strings.dart';
import 'package:e_commerce_firebase/app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/helpers/helper_functions.dart';
import 'widgets/t_profile_menu_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFuntions.isDarkMode(context: context);

    return Scaffold(
      appBar: const TAppBar(
        title: Text('Profile'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //!TODO: Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    TCircularImage(
                      dark: dark,
                      image: TImages.user1,
                      width: 80,
                      height: 80,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Change Profile Picture'),
                    )
                  ],
                ),
              ),
              // Details
              const SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),
              Divider(
                color: dark ? TColors.white : TColors.black,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              const TSectionHeading(
                title: 'Profile Information',
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              TProfileMenu(onPressed: () {}, title: 'Name', value: 'Name 2'),
              TProfileMenu(
                  onPressed: () {}, title: 'Username', value: 'Name 2'),
              Divider(
                color: dark ? TColors.white : TColors.black,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              // Heading personal information
              const TSectionHeading(
                title: 'Personal Information',
              ),
              TProfileMenu(onPressed: () {}, title: 'User Id', value: '456789'),
              TProfileMenu(
                  onPressed: () {},
                  title: 'Email',
                  value: 'usernames@example.com'),
              TProfileMenu(
                  onPressed: () {},
                  title: 'Phone number',
                  value: '+08123456789'),
              TProfileMenu(onPressed: () {}, title: 'Gender', value: 'Male'),
              TProfileMenu(
                  onPressed: () {},
                  title: 'Date of Birth',
                  value: '10 Oct,1994'),
              Divider(
                color: dark ? TColors.white : TColors.black,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Close Account',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
