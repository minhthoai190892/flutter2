import 'package:chatty/app/common/store/user.dart';
import 'package:chatty/app/modules/profile/state/state.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../routes/app_pages.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController
  ProfileController();
  final state = ProfileState();
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
  Future<void> goLogout() async {
    /// logout google accout
    await GoogleSignIn().signOut();

    /// xóa key được lưu trữ trong shared
    // await UserStore.to.onLogout();
      Get.offAllNamed(Routes.SIGN_IN);
  }
}
