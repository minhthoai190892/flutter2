import 'package:e_commerce_firebase/app/common/layouts/grid_layout.dart';
import 'package:e_commerce_firebase/app/common/widgets/appbar/app_bar_widget.dart';
import 'package:e_commerce_firebase/app/common/widgets/icons/t_circular_icon.dart';
import 'package:e_commerce_firebase/app/common/widgets/product_cart/product_cart_vertical.dart';
import 'package:e_commerce_firebase/app/modules/homescreen/views/homescreen_view.dart';
import 'package:e_commerce_firebase/app/utils/constants/sizes.dart';
import 'package:e_commerce_firebase/app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../controllers/wishlist_controller.dart';

class WishlistView extends GetView<WishlistController> {
  const WishlistView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final dark = THelperFuntions.isDarkMode(context: context);
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Wishlist',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        action: [
          TCircularIcon(
            dark: dark,
            icon: Iconsax.add,
            onPressed: () => Get.to(() => const HomescreenView()),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TGridLayout(
                itemCount: 4,
                itemBuilder: (p0, p1) => const TProductCartVertical(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
