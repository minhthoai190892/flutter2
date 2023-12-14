// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'auth_bloc.dart';

enum AuthStatus { unknown, authenticated, unauthenticated }

class AuthState extends Equatable {
  final AuthStatus authStatus;
  final User? user;
  const AuthState({
    required this.authStatus,
    this.user,
  });
  factory AuthState.unknown() {
    return const AuthState(authStatus: AuthStatus.unknown);
  }
  AuthState copyWith({
    AuthStatus? authStatus,
    User? user,
  }) {
    return AuthState(
      authStatus: authStatus ?? this.authStatus,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [authStatus, user];
}
