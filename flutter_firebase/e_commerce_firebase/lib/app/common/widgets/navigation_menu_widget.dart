import 'package:e_commerce_firebase/app/utils/constants/colors.dart';
import 'package:e_commerce_firebase/app/utils/constants/text_strings.dart';
import 'package:e_commerce_firebase/app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenuWidget extends StatelessWidget {
  const NavigationMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final dark = THelperFuntions.isDarkMode(context: context);
    return Scaffold(
        bottomNavigationBar: Obx(
          () => NavigationBar(
            elevation: 0,
            height: 80,
            selectedIndex: controller.selectedIndex.value,
            backgroundColor: dark ? TColors.black : TColors.white,
            indicatorColor: dark
                ? TColors.white.withOpacity(0.1)
                : TColors.black.withOpacity(0.1),
            onDestinationSelected: (value) {
              controller.selectedIndex.value = value;
            },
            
            destinations: [
              NavigationDestination(
                  icon: const Icon(Iconsax.home), label: TTexts.home),
              NavigationDestination(
                  icon: const Icon(Iconsax.shop), label: TTexts.store),
              NavigationDestination(
                  icon: const Icon(Iconsax.heart), label: TTexts.wishList),
              NavigationDestination(
                  icon: const Icon(Iconsax.user), label: TTexts.profile),
            ],
          ),
        ),
        body: Obx(
          () => controller.screen[controller.selectedIndex.value],
        ));
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screen = [
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.purple,
    ),
    Container(
      color: Colors.orange,
    ),
  ];
}
