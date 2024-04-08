import 'package:coursor_tiktok/auth/cubit/auth_cubit.dart';
import 'package:coursor_tiktok/auth/register_screen.dart';
import 'package:coursor_tiktok/ui/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: context.gradient.containerBackgroundGradient,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              if (state is LoginState) {
                return const LoginScreen();
              } else if (state is RegisterState) {
                return const RegistrationScreen();
              } else {
                throw Exception(
                    'Such state ${state.runtimeType} does not exist!');
              }
            },
          ),
        ),
      ),
    );
  }
}
