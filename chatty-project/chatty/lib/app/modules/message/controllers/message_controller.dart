import 'package:chatty/app/modules/message/index/index.dart';
import 'package:chatty/app/routes/app_pages.dart';
import 'package:get/get.dart';

class MessageController extends GetxController {
  //TODO: Implement MessageController
  final stata = MessgaeState();
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
  Future<void> goProfile() async {
  await  Get.toNamed(Routes.PROFILE);
  }
}
