import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/layouts/grid_layout.dart';
import '../../../../common/widgets/appbar/app_bar_widget.dart';
import '../../../../common/widgets/appbar/t_tabbar_widget.dart';
import '../../../../common/widgets/brands/t_brand_cart.dart';
import '../../../../common/widgets/containers/search_container.dart';
import '../../../../common/widgets/products/product_cart/cart_menu_icon.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../controllers/store_controller.dart';
import 'widget/t_category_tab.dart';

class StoreView extends GetView<StoreController> {
  const StoreView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final dark = THelperFuntions.isDarkMode(context: context);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: dark ? TColors.black : TColors.white,
        appBar: TAppBar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          action: [
            TCartCounterItem(
              color: dark ? TColors.white : TColors.black,
              onPressed: () {},
            ),
          ],
        ),
        //!TODO: Cuộn lòng nhau
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                //!TODO: ghim không cho di chuyển
                pinned: true,
                floating: true,
                backgroundColor: dark ? TColors.black : TColors.white,
                //!TODO: chiều cao
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      //!TODO: Search bar
                      const Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: TSearchContainer(
                          text: 'Search in Store',
                          showBorder: true,
                          showBackground: false,
                          icon: Iconsax.search_normal,
                          padding: EdgeInsets.zero,
                        ),
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwSections,
                      ),
                      //!TODO: Featured Brands
                      TSectionHeading(
                        title: 'Featured Brands',
                        onPressed: () {},
                        showActionButton: true,
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems / 1.5,
                      ),
                      TGridLayout(
                        mainAxisExtent: 80,
                        itemCount: 4,
                        itemBuilder: (p0, p1) => TBrandCart(dark: dark),
                      )
                    ],
                  ),
                ),
                bottom: TTabBar(dark: dark, tabs: const [
                  Tab(child: Text('Sports')),
                  Tab(child: Text('Furniture')),
                  Tab(child: Text('Electronics')),
                  Tab(child: Text('Clothes')),
                  Tab(child: Text('Cosmetics')),
                ]),
              ),
            ];
          },
          body: TabBarView(
            children: [
              TCategoryTab(dark: dark),
              TCategoryTab(dark: dark),
              TCategoryTab(dark: dark),
              TCategoryTab(dark: dark),
              TCategoryTab(dark: dark),
            ],
          ),
        ),
      ),
    );
  }
}
