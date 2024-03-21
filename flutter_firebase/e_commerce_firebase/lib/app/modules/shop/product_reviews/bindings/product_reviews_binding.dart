import 'package:get/get.dart';

import '../controllers/product_reviews_controller.dart';

class ProductReviewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductReviewsController>(
      () => ProductReviewsController(),
    );
  }
}
