import 'package:e_commerce_firebase/app/utils/constants/colors.dart';
import 'package:e_commerce_firebase/app/utils/constants/image_strings.dart';
import 'package:e_commerce_firebase/app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/widgets/containers/curved_edges.dart';
import '../../../common/widgets/containers/primary_header_container.dart';
import '../../../common/widgets/containers/search_container.dart';
import '../../../common/widgets/image_text_widget/vertical_image_text.dart';
import '../../../common/widgets/texts/section_heading.dart';
import '../../../utils/constants/sizes.dart';
import '../controllers/homescreen_controller.dart';
import 'widgets/home_appbar_widget.dart';
import 'widgets/home_categories_widget.dart';

class HomescreenView extends GetView<HomescreenController> {
  const HomescreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //!TODO: header
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  //!TODO: app bart
                  const THomeAppBar(),
                  //!TODO: Search bar
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  const TSearchContainer(
                    text: 'Search in store',
                    icon: Iconsax.search_normal,
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
                        const TSectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                        ),
                        SizedBox(
                          height: TSizes.defaultSpace,
                        ),
                        //!TODO: Categories
                        const THomeCategories(),
                      ],
                    ),
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
