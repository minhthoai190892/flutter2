// ignore_for_file: public_member_api_docs, sort_constructors_first
class SignInState {
  final String email;
  final String password;

  SignInState({
    this.email = '',
    this.password = '',
  });
  SignInState copyWith(
      {String? userName, String? email, String? password, String? rePassword}) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  String toString() {
    return 'RegisterState( email: $email, password: $password)';
  }
}
