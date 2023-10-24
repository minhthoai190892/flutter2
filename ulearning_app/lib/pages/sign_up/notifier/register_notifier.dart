import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ulearning_app/pages/sign_up/notifier/register_state.dart';
part 'register_notifier.g.dart';

@riverpod
class RegisterNotifier extends _$RegisterNotifier {
  @override
  RegisterState build() {
    return RegisterState();
  }

  void onUserNameChange(String name) {
    state = state.copyWith(userName: name);
  }

  onUserEmailChange(String email) {
    state = state.copyWith(email: email);
  }
}
// terminal
// flutter pub run build_runner watch --delete-conflicting-outputs