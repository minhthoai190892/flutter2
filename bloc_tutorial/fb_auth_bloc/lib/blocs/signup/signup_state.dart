// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'signup_cubit.dart';

enum SignupStatus {
  initial,
  submitting,
  success,
  error,
}

class SignupState extends Equatable {
  final SignupStatus signupStatus;
  final CustomError error;
  const SignupState({
    required this.signupStatus,
    required this.error,
  });

  SignupState copyWith({
    SignupStatus? signupStatus,
    CustomError? error,
  }) {
    return SignupState(
      signupStatus: signupStatus ?? this.signupStatus,
      error: error ?? this.error,
    );
  }

  factory SignupState.initial() {
    return const SignupState(
        signupStatus: SignupStatus.initial, error: CustomError());
  }
  @override
  bool get stringify => true;

  @override
  List<Object> get props => [signupStatus, error];
}
