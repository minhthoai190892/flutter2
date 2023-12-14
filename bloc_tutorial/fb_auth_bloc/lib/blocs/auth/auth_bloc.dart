import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fb_auth_bloc/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  late final StreamSubscription authSubscription;
  final AuthRepository authRepository;
  AuthBloc({required this.authRepository}) : super(AuthState.unknown()) {
    authSubscription = authRepository.user.listen((user) {
      add(AuthStateChangeEvent(user: user));
    });

    on<AuthStateChangeEvent>((event, emit) {
      if (event.user != null) {
        emit(state.copyWith(
            authStatus: AuthStatus.authenticated, user: event.user));
      } else {
        emit(
            state.copyWith(authStatus: AuthStatus.unauthenticated, user: null));
      }
    });
    on<SignoutRequestedEvent>((event, emit) async {
      await authRepository.signOut();
    });
  }
}
