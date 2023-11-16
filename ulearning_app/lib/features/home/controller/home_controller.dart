import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ulearning_app/common/models/entities.dart';
import 'package:ulearning_app/global.dart';
part 'home_controller.g.dart';

//dùng để giữ nguyên trạng thái khi thay đổi qua các tab
@Riverpod(keepAlive: true)
class HomeScreenBannerDots extends _$HomeScreenBannerDots {
  @override
  int build() => 0;

  setIndex(int value) => state = value;
}

@riverpod
class HomeUserProfile extends _$HomeUserProfile {
  @override
  FutureOr<UserProfile> build() {
    return Global.storageService.getUserProfile();
  }
}

// terminal
// flutter pub run build_runner watch --delete-conflicting-outputs