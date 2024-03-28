import 'package:e_commerce_firebase/app/modules/sub_categories/views/sub_categories_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/image_text_widget/vertical_image_text.dart';
import '../../../../../utils/constants/image_strings.dart';

class THomeCategories extends StatelessWidget {
  /// category
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return TVericalImageText(
            title: 'Shose',
            image: TImages.shoes,
            onTap: () => Get.to(() => const SubCategoriesView()),
          );
        },
      ),
    );
  }
}
