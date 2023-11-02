import 'package:get/get.dart';

class AddProductController extends GetxController {
  //TODO: Implement AddProductController

  final count = 0.obs;

  void increment() => count.value++;

  RxBool isLoading = false.obs;
}
