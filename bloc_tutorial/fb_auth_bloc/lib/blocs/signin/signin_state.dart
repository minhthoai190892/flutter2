// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'signin_cubit.dart';

enum SigninStatus {
  initial,
  submitting,
  success,
  error,
}

class SigninState extends Equatable {
  final SigninStatus signinStatus;
  final CustomError error;
  const SigninState(
    this.signinStatus,
    this.error,
  );

  SigninState copyWith({
    SigninStatus? signinStatus,
    CustomError? error,
  }) {
    return SigninState(
      signinStatus ?? this.signinStatus,
      error ?? this.error,
    );
  }

  factory SigninState.initial() {
    return SigninState(SigninStatus.initial, CustomError());
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [signinStatus, error];
}
