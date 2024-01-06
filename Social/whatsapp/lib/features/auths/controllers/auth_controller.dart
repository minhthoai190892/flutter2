// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'package:whatsapp/features/auths/repository/auth_repository.dart';

final authControllerProvider = Provider((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthController(authRepository: authRepository);
});

class AuthController {
  final AuthRepository authRepository;
  AuthController({
    required this.authRepository,
  });
  void signInWithPhone(
      {required BuildContext context, required String phoneNumber}) {
    authRepository.signInWithPhone(phoneNumber: phoneNumber, context: context);
  }
}
