part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

///sự kiện kiểm tra login
final class AuthLoginRequested extends AuthEvent {
  final String email;
  final String password;

  AuthLoginRequested({required this.email, required this.password});
}

class AuthLogoutRequested extends AuthEvent {}
