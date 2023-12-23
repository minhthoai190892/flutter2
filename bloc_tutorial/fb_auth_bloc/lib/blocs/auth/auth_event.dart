// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class AuthStateChangeEvent extends AuthEvent {
  final User? user;
  const AuthStateChangeEvent({
    this.user,
  });
  @override
  List<Object?> get props => [user];
}
class SignoutRequestedEvent extends AuthEvent {
  
}