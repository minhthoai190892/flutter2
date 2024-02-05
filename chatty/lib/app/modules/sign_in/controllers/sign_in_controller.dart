import 'package:chatty/app/modules/sign_in/index/index.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  //TODO: Implement SignInController
  SignInController();
  final state = SignInState();
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
