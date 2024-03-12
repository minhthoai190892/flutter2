import 'package:get/get.dart';

class HomescreenController extends GetxController {
  static HomescreenController get instance => Get.find();
  final carouselCurrentIndex = 0.obs;
  void updatePageIndicator(index) {
    carouselCurrentIndex.value = index;
  }

  final count = 0.obs;

  void increment() => count.value++;
}
