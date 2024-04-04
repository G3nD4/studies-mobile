import 'dart:developer';

import 'package:flutter/material.dart';

import '../ui/themes/theme.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  // login could be either email or phone number
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      width: MediaQuery.of(context).size.width * 0.85,
      padding: paddingSmall,
      decoration: BoxDecoration(
        boxShadow: const <BoxShadow>[
          AppShadows.containerInnerLightShadow,
        ],
        color: AppColors.white.withOpacity(0.4),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Регистрация',
            style: context.text.appTitle.copyWith(color: AppColors.white),
          ),
          const SizedBox(height: 64.0),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextFormField(
                  controller: _loginController,
                  decoration: AppInputDecorations.defaultInputDecoration(
                    fillColor: AppColors.white.withOpacity(0.2),
                    hintStyle: context.text.labelStyle
                        .copyWith(color: AppColors.white),
                    hintText: 'Номер телефона или e-mail',
                  ),
                ),
              ),
              paddingVerticalMedium,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextFormField(
                  obscureText: true,
                  controller: _passwordController,
                  decoration: AppInputDecorations.defaultInputDecoration(
                    fillColor: AppColors.white.withOpacity(0.2),
                    hintStyle: context.text.labelStyle
                        .copyWith(color: AppColors.white),
                    hintText: 'Пароль',
                  ),
                ),
              ),
              paddingVerticalMedium,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextFormField(
                  obscureText: true,
                  controller: _repeatPasswordController,
                  decoration: AppInputDecorations.defaultInputDecoration(
                    fillColor: AppColors.white.withOpacity(0.2),
                    hintStyle: context.text.labelStyle
                        .copyWith(color: AppColors.white),
                    hintText: 'Повторите пароль',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 64.0),
          AppButtonDecorations.defaultButtonDecoration(
            color: AppColors.white.withOpacity(0.2),
            onPressed: () {
              log('Button "Войти" pressed.', name: 'LoginScreen');
            },
            child: Text(
              '   Создать аккаунт   ',
              style: context.text.labelStyle.copyWith(color: AppColors.white),
            ),
          ),
        ],
      ),
    );
  }
}
