import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequested>(_authLoginRequested);
    on<AuthLogoutRequested>(_authLogoutRequested);
  }
  _authLoginRequested(AuthLoginRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final String email = event.email;
      final String password = event.password;
      if (password.isEmpty || password.length < 6) {
        return emit(AuthFailure(
            errorMessage: 'Password must be at least 6 characters'));
      }

      await Future.delayed(
        const Duration(seconds: 1),
        () => emit(AuthSuccess(uId: '$email-$password')),
      );
    } catch (e) {
      return emit(AuthFailure(errorMessage: e.toString()));
    }
  }

  _authLogoutRequested(
      AuthLogoutRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await Future.delayed(
        const Duration(seconds: 1),
        () => emit(AuthInitial()),
      );
    } catch (e) {
      emit(AuthFailure(errorMessage: e.toString()));
    }
  }
}
