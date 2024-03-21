import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/app_bar_widget.dart';
import '../../../../common/widgets/products/ratings/rating_indicator.dart';
import '../../../../utils/constants/sizes.dart';
import '../controllers/product_reviews_controller.dart';
import '../widgets/rating_progress_indicator.dart';
import '../widgets/user_review_card.dart';

class ProductReviewsView extends GetView<ProductReviewsController> {
  const ProductReviewsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Reviews & Ratings'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  'Rating and review Lorem ipsum dolo t assumenda voluptates tempora tempore voluptate!'),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              // ! Overall Product ratings
              const TOverallProductRating(),
              // ! ratings bar
              const TRatingBarIndicator(rating: 4.5),
              Text(
                '12,611',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
