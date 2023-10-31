import 'package:get/get.dart';

import '../controllers/detail_products_controller.dart';

class DetailProductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailProductsController>(
      () => DetailProductsController(),
    );
  }
}
