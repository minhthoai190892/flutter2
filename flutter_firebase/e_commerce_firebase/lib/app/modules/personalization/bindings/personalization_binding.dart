import 'package:get/get.dart';

import '../controllers/personalization_controller.dart';

class PersonalizationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PersonalizationController>(
      () => PersonalizationController(),
    );
  }
}
