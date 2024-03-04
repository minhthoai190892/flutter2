import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/layouts/grid_layout.dart';
import '../../../common/widgets/containers/curved_edges.dart';
import '../../../common/widgets/containers/primary_header_container.dart';
import '../../../common/widgets/containers/search_container.dart';
import '../../../common/widgets/product_cart/product_cart_vertical.dart';
import '../../../common/widgets/texts/section_heading.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/device/device_utility.dart';
import '../controllers/homescreen_controller.dart';
import 'widgets/home_appbar_widget.dart';
import 'widgets/home_categories_widget.dart';
import 'widgets/promo_slider_widget.dart';

class HomescreenView extends GetView<HomescreenController> {
  const HomescreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final height = TDeviceUtils.getScreenHeight();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //!TODO: header
            const TPrimaryHeaderContainer(
              child: Column(
                children: [
                  //!TODO: app bart
                  THomeAppBar(),
                  //!TODO: Search bar
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  TSearchContainer(
                    text: 'Search in store',
                    icon: Iconsax.search_normal,
                    padding:
                        EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
                  ),
                  //!TODO: Caregories
                  SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  Padding(
                    padding: EdgeInsets.all(TSizes.defaultSpace),
                    child: Column(
                      children: [
                        //!TODO: heading
                        TSectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                        ),
                        SizedBox(
                          height: TSizes.defaultSpace,
                        ),
                        //!TODO: Categories
                        THomeCategories(),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            //!TODO: Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  //Promo slider (carousel)
                  TPromoSlider(height: height, banners: TImages.banners),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  TSectionHeading(
                      title: 'Popular Categories',
                      showActionButton: true,
                      onPressed: () {}),
                  const SizedBox(
                    height: TSizes.defaultSpace,
                  ),
                  // Popular products
                  TGridLayout(
                    itemCount: 6,
                    // !TODO: Thumbnail, wishlist button,discount tag,detail
                    itemBuilder: (p0, p1) => const TProductCartVertical(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TCurveEdgeWidget extends StatelessWidget {
  const TCurveEdgeWidget({
    super.key,
    this.child,
  });
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      //!TODO: vẻ border
      clipper: TCustomeCurvedEdges(),
      child: child,
    );
  }
}
