import 'package:coursor_tiktok/auth/auth_screen.dart';
import 'package:coursor_tiktok/auth/cubit/auth_cubit.dart';
import 'package:coursor_tiktok/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthorizationController extends StatefulWidget {
  const AuthorizationController({super.key});

  @override
  State<AuthorizationController> createState() => _AuthorizationControllerState();
}

class _AuthorizationControllerState extends State<AuthorizationController> {
  AuthCubit authCubit = AuthCubit()..isAuthorized();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => authCubit,
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthorizedState) {
            return const CoursorTikTok();
          } else {
            return const AuthScreen();
          }
        },
      ),
    );
  }
}