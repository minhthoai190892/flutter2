import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_form_validation_beginner_files/bloc/auth_bloc.dart';
import 'package:login_form_validation_beginner_files/login_screen.dart';
import 'package:login_form_validation_beginner_files/widgets/gradient_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: ( context, state) {
          if (state is AuthInitial) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
                (route) => false);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text((state as AuthSuccess).uId),
              ),
              GradientButton(
                onPress: () {
                  context.read<AuthBloc>().add(AuthLogoutRequested());
                },
              )
            ],
          );
        },
      ),
    );
  }
}
