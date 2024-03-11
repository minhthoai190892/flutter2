import 'package:e_commerce_firebase/app/common/widgets/appbar/app_bar_widget.dart';
import 'package:e_commerce_firebase/app/common/widgets/containers/circular_container.dart';
import 'package:e_commerce_firebase/app/common/widgets/containers/primary_header_container.dart';
import 'package:e_commerce_firebase/app/common/widgets/images/t_circular_image.dart';
import 'package:e_commerce_firebase/app/common/widgets/list_title/settings_menu_title.dart';
import 'package:e_commerce_firebase/app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_firebase/app/utils/constants/colors.dart';
import 'package:e_commerce_firebase/app/utils/constants/image_strings.dart';
import 'package:e_commerce_firebase/app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/list_title/user_profile_title.dart';
import '../../../../utils/constants/sizes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFuntions.isDarkMode(context: context);
    return SingleChildScrollView(
      child: Column(
        children: [
          // !TODO: Header
          TPrimaryHeaderContainer(
            child: Column(
              children: [
                TAppBar(
                  title: Text(
                    'Account',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .apply(color: TColors.white),
                  ),
                ),

                // !TODO: User profile card
                TUserProfile(dark: dark),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
              ],
            ),
          ),
          // !TODO: Body
          Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                // !TODO: Account Settings
                const TSectionHeading(
                  title: 'Account Settings',
                  showActionButton: true,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),

                TSettingsMenuTitle(
                  icon: Iconsax.safe_home,
                  title: 'My Address',
                  subTitle: 'Set shopping delivery address',
                  onTap: () {},
                ),
                TSettingsMenuTitle(
                  icon: Iconsax.shopping_cart,
                  title: 'My Cart',
                  subTitle: 'Add, remove products and move to chekcout',
                  onTap: () {},
                ),
                TSettingsMenuTitle(
                  icon: Iconsax.bag_tick,
                  title: 'My Orders',
                  subTitle: 'In-progress and Completed Orders',
                  onTap: () {},
                ),
                TSettingsMenuTitle(
                  icon: Iconsax.bank,
                  title: 'Bank Account',
                  subTitle: 'Withdraw bank to registered bank account',
                  onTap: () {},
                ),
                TSettingsMenuTitle(
                  icon: Iconsax.discount_shape,
                  title: 'My Coupons',
                  subTitle: 'List of all the discounted coupons',
                  onTap: () {},
                ),
                TSettingsMenuTitle(
                  icon: Iconsax.notification,
                  title: 'My Address',
                  subTitle: 'Set shopping delivery address',
                  onTap: () {},
                ),
                TSettingsMenuTitle(
                  icon: Iconsax.security_card,
                  title: 'Account Security',
                  subTitle: 'Mange data usage and connected accounts',
                  onTap: () {},
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                // !TODO: Account Settings
                const TSectionHeading(
                  title: 'App Settings',
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),

                TSettingsMenuTitle(
                  icon: Iconsax.document_upload,
                  title: 'Load data',
                  subTitle: 'Upload data to your cloud Firebase',
                  onTap: () {},
                ),

                TSettingsMenuTitle(
                  icon: Iconsax.location,
                  title: 'Geolocation',
                  subTitle: 'Set recommendations based on location',
                  trailing: Switch(
                    value: true,
                    onChanged: (value) {},
                  ),
                ),
                TSettingsMenuTitle(
                  icon: Iconsax.security_user,
                  title: 'Safe Mode',
                  subTitle: 'Search result is safe for all ages',
                  trailing: Switch(
                    value: false,
                    onChanged: (value) {},
                  ),
                ),
                TSettingsMenuTitle(
                  icon: Iconsax.image,
                  title: 'HD Image Quality',
                  subTitle: 'Set image quality to be seen',
                  trailing: Switch(
                    value: false,
                    onChanged: (value) {},
                  ),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                      onPressed: () {}, child: const Text('Logou')),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections * 2.5,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
