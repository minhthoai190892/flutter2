import 'package:get/get.dart';

import '../controllers/resetpassword_controller.dart';

class ResetpasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResetpasswordController>(
      () => ResetpasswordController(),
    );
  }
}
