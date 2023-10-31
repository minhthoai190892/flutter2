import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/features/sign_in/notifier/sign_in_state.dart';


// StateNotifier saves state
class SignInNotifier extends StateNotifier<SignInState> {
  SignInNotifier() : super(SignInState());
  onUserEmailChange(String email) {
    state = state.copyWith(email: email);
  }

  onUserPasswordChange(String password) {
    state = state.copyWith(password: password);
  }
}

final signInNotifierProvider =
    StateNotifierProvider<SignInNotifier, SignInState>(
        (ref) => SignInNotifier());
