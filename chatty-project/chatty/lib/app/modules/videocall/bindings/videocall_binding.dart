import 'package:get/get.dart';

import '../controllers/videocall_controller.dart';

class VideocallBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VideocallController>(
      () => VideocallController(),
    );
  }
}
