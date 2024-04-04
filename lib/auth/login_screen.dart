import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../ui/themes/theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // login could be either email or phone number
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      width: MediaQuery.of(context).size.width * 0.85,
      decoration: BoxDecoration(
        boxShadow: const <BoxShadow>[
          AppShadows.containerInnerLightShadow,
        ],
        color: AppColors.white.withOpacity(0.4),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Авторизация',
            style: context.text.appTitle.copyWith(color: AppColors.white),
          ),
          const SizedBox(height: 64.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextFormField(
              controller: _loginController,
              decoration: AppInputDecorations.defaultInputDecoration(
                  fillColor: AppColors.white.withOpacity(0.2),
                  hintStyle:
                      context.text.labelStyle.copyWith(color: AppColors.white),
                  hintText: 'Номер телефона или e-mail'),
            ),
          ),
          paddingVerticalLarge,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextFormField(
              obscureText: true,
              controller: _passwordController,
              decoration: AppInputDecorations.defaultInputDecoration(
                fillColor: AppColors.white.withOpacity(0.2),
                hintStyle:
                    context.text.labelStyle.copyWith(color: AppColors.white),
                hintText: 'Пароль',
              ),
            ),
          ),
          paddingVerticalMedium,
          GestureDetector(
            onTap: () {
              log('Button "Забыли пароль?" pressed.', name: 'LoginScreen');
            },
            child: Text(
              'Забыли пароль?',
              style: context.text.labelStyle.copyWith(color: AppColors.white),
            ),
          ),
          paddingVerticalMedium,
          AppButtonDecorations.defaultButtonDecoration(
            color: AppColors.white.withOpacity(0.2),
            onPressed: () {
              log('Button "Войти" pressed.', name: 'LoginScreen');
            },
            child: Text(
              'Войти',
              style: context.text.labelStyle.copyWith(color: AppColors.white),
            ),
          ),
          const SizedBox(height: 64.0),
          Text(
            'Еще нет аккаунта?',
            style: context.text.appDescription.copyWith(
              color: AppColors.white,
              fontSize: 18.0,
            ),
          ),
          TextButton(
            onPressed: () {
              log('Button "Зарегистрироваться" pressed.', name: 'LoginScreen');
            },
            child: Text(
              'Зарегистрируйтесь!',
              style: context.text.appTitle.copyWith(
                color: AppColors.white,
                fontSize: 22.0,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
