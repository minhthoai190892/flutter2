import 'package:get/get.dart';

import '../controllers/all_brands_controller.dart';

class AllBrandsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllBrandsController>(
      () => AllBrandsController(),
    );
  }
}
