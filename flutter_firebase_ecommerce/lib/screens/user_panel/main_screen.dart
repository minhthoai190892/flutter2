// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_firebase_ecommerce/screens/user_panel/all_category_screen.dart';
import 'package:flutter_firebase_ecommerce/screens/user_panel/all_flash_sale_product_screen.dart';
import 'package:flutter_firebase_ecommerce/screens/user_panel/all_products_screen.dart';
import 'package:flutter_firebase_ecommerce/screens/user_panel/cart_screen.dart';
import 'package:flutter_firebase_ecommerce/utils/app_constant.dart';
import 'package:flutter_firebase_ecommerce/widgets/all_products_widget.dart';
import 'package:flutter_firebase_ecommerce/widgets/banner_widget.dart';
import 'package:flutter_firebase_ecommerce/widgets/category_widget.dart';
import 'package:flutter_firebase_ecommerce/widgets/custom_drawer_widget.dart';
import 'package:flutter_firebase_ecommerce/widgets/heading_widget.dart';
import 'package:get/get.dart';

import '../../widgets/flast_sale_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: AppConstant.appSecondoryColor,
            statusBarIconBrightness: Brightness.light),
        backgroundColor: AppConstant.appMainColor,
        title: Text(
          AppConstant.appMainName,
          style: const TextStyle(color: AppConstant.appTextColor),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppConstant.appTextColor),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => const CartScreen());
              },
              icon: const Icon(Icons.shopping_cart))
        ],
      ),
      drawer: const DrawerWidget(),
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: Get.height / 90,
              ),
              const BannerWidget(),
              HeadingWidget(
                headingTitle: 'Category',
                headingSubTitle: 'Accroding to your budget',
                onTap: () => Get.to(() => const AllCategoryScreen()),
                buttonText: 'See more >',
              ),
              const CategoryWidget(),
              HeadingWidget(
                headingTitle: 'Fashion Sale',
                headingSubTitle: 'Accroding to your budget',
                onTap: () => Get.to(() => const AllFlashSaleProductScrren()),
                buttonText: 'See more >',
              ),
              const FlastSaleWidget(),
              HeadingWidget(
                headingTitle: 'All Products',
                headingSubTitle: 'Accroding to your budget',
                onTap: () => Get.to(() => const AllProductsScreen()),
                buttonText: 'See more >',
              ),
              const AllProductsWidget(),
            ],
          )),
    );
  }
}
