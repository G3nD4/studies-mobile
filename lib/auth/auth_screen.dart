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
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(child: LoginScreen()),
      ),
    );
  }
}
