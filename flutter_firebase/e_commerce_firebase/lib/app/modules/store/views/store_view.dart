import 'package:e_commerce_firebase/app/common/layouts/grid_layout.dart';
import 'package:e_commerce_firebase/app/common/widgets/appbar/app_bar_widget.dart';
import 'package:e_commerce_firebase/app/common/widgets/containers/search_container.dart';
import 'package:e_commerce_firebase/app/common/widgets/product_cart/t_rounded_container.dart';
import 'package:e_commerce_firebase/app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_firebase/app/utils/constants/enums.dart';
import 'package:e_commerce_firebase/app/utils/constants/image_strings.dart';
import 'package:e_commerce_firebase/app/utils/constants/sizes.dart';
import 'package:e_commerce_firebase/app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/widgets/images/t_circular_image.dart';
import '../../../common/widgets/product_cart/cart_menu_icon.dart';
import '../../../common/widgets/texts/t_brand_title_with_verify_icon.dart';
import '../../../utils/constants/colors.dart';
import '../controllers/store_controller.dart';

class StoreView extends GetView<StoreController> {
  const StoreView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final dark = THelperFuntions.isDarkMode(context: context);
    return Scaffold(
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
                expandedHeight: 400,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      //!TODO: Search bar
                      const TSearchContainer(
                        text: 'Search in Store',
                        showBorder: true,
                        showBackground: false,
                        icon: Iconsax.search_normal,
                        padding: EdgeInsets.zero,
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
                        itemBuilder: (p0, p1) => SingleChildScrollView(
                          child: GestureDetector(
                            onTap: () {},
                            child: TRoundedContainer(
                              width: double.infinity,
                              padding: const EdgeInsets.all(TSizes.sm),
                              showBorder: true,
                              backgroundColor: Colors.transparent,
                              child: Row(
                                children: [
                                  //!TODO: icons
                                  Expanded(
                                    child: TCircularImage(
                                      dark: dark,
                                      image: TImages.shoes,
                                      backgroundColor: Colors.transparent,
                                      overlayColor:
                                          dark ? TColors.white : TColors.black,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: TSizes.spaceBtwItems / 2,
                                  ),
                                  //!TODO: Texts
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        //!TODO: Brand Title and Verify
                                        TBrandTitleWithVerifyIcon(
                                          tile: 'Shose',
                                          brandTextSize: TextSize.large,
                                          textColor: dark
                                              ? TColors.white
                                              : TColors.black,
                                        ),
                                        Text(
                                          '256 products ',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ];
          },
          body: Container()),
    );
  }
}
