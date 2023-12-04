part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}
///sự kiện kiểm tra login
final class AuthLoginRequested extends AuthEvent {}
