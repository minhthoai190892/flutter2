import 'package:chatty/app/modules/welcome/state/state.dart';
import 'package:get/get.dart';

class WelcomeController extends GetxController {
  //TODO: Implement WelcomeController
// constructor
  WelcomeController();
  final title = 'Chatty .';
  final state = WelcomeState();
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    // có thể kiểm tra đăng nhập hay chưa
    print(' WelcomeController ');
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
