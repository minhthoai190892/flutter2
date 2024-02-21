import 'package:get/get.dart';

import '../controllers/loginscreen_controller.dart';

class LoginscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginscreenController>(
      () => LoginscreenController(),
    );
  }
}
