import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'home_controller.g.dart';

@riverpod
class HomeScreenBannerDots extends _$HomeScreenBannerDots {
  @override
  int build() => 0;

  setIndex(int value) => state = value;
}


// terminal
// flutter pub run build_runner watch --delete-conflicting-outputs