// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthSuccess extends AuthState {
  final String uId; // Model
  AuthSuccess({
    required this.uId,
  });
}

class AuthFailure extends AuthState {
  final String errorMessage;
  AuthFailure({
    required this.errorMessage,
  });
}

final class AuthLoading extends AuthState {}
