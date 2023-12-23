// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:fb_auth_bloc/repositories/auth_repository.dart';
import 'package:flutter/material.dart';

import '../../models/custom_error.dart';
import '../signin/signin_cubit.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthRepository authRepository;

  SignupCubit(
    this.authRepository,
  ) : super(SignupState.initial());
  Future<void> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(state.copyWith(signupStatus: SignupStatus.submitting));
    try {
      await authRepository.signUP(name: name, email: email, password: password);
      emit(state.copyWith(signupStatus: SignupStatus.success));
    } on CustomError catch (e) {
      emit(state.copyWith(error: e,signupStatus: SignupStatus.error));
    }
  }
}
