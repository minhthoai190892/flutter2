import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool isHidden = true.obs;

  RxBool isLoading = false.obs;
  //TODO: Implement LoginController

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
}
