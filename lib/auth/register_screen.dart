import 'dart:developer';

import 'package:coursor_tiktok/domain/enums/user_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../ui/themes/theme.dart';
import 'cubit/auth_cubit.dart';

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
  void initState() {
    super.initState();
    _repeatPasswordController.addListener(_repeatPasswordListener);
    _loginController.addListener(_emailControllerListener);
  }

  void _repeatPasswordListener() {
    if (_repeatPasswordController.text.isEmpty) {
      log('Пароль не может быть пустым!');
    } else if (_repeatPasswordController.text == _passwordController.text) {
      BlocProvider.of<AuthCubit>(context).user.password =
          _passwordController.text;
    } else {
      log('Пароли не совпадают!');
    }
  }

  void _emailControllerListener() {
    if (_loginController.text.isEmpty) {
      log('Email не может быть пустым!');
    } else if (!_loginController.text.contains('@')) {
      log('Некорректный email!');
    } else {
      BlocProvider.of<AuthCubit>(context).user.email = _loginController.text;
    }
  }

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    _repeatPasswordController.dispose();
    _repeatPasswordController.removeListener(_repeatPasswordListener);
    _loginController.removeListener(_emailControllerListener);
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
                  style:
                      context.text.labelStyle.copyWith(color: AppColors.white),
                  controller: _loginController,
                  decoration: AppInputDecorations.defaultInputDecoration(
                    fillColor: AppColors.white.withOpacity(0.2),
                    hintStyle: context.text.labelStyle
                        .copyWith(color: AppColors.white),
                    // hintText: 'Номер телефона или e-mail',
                    hintText: 'Email',
                  ),
                ),
              ),
              paddingVerticalMedium,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextFormField(
                  obscureText: true,
                  style:
                      context.text.labelStyle.copyWith(color: AppColors.white),
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
                  style:
                      context.text.labelStyle.copyWith(color: AppColors.white),
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
              const UserTypeButton(),
            ],
          ),
          const SizedBox(height: 64.0),
          AppButtons.defaultOutlineButton(
            color: AppColors.white.withOpacity(0.2),
            onPressed: () {
              log('Button "Создать аккаунт" pressed.', name: 'RegisterScreen');
              BlocProvider.of<AuthCubit>(context).register();
            },
            child: Text(
              '   Создать аккаунт   ',
              style: context.text.labelStyle.copyWith(color: AppColors.white),
            ),
          ),
          TextButton(
            child: Text(
              'Войти в аккаунт',
              style: context.text.labelStyle.copyWith(
                color: AppColors.white,
                // fontFeatures: [FontFeature.] TODO: add underline
              ),
            ),
            onPressed: () {
              BlocProvider.of<AuthCubit>(context).enterLoginScreen();
            },
          ),
        ],
      ),
    );
  }
}

class UserTypeButton extends StatefulWidget {
  const UserTypeButton({super.key});

  @override
  State<UserTypeButton> createState() => _UserTypeButtonState();
}

class _UserTypeButtonState extends State<UserTypeButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<UserType>(
      iconDisabledColor: AppColors.white,
      iconEnabledColor: AppColors.white,
      style: context.text.labelStyle.copyWith(color: AppColors.white),
      borderRadius: BorderRadius.circular(25.0),
      underline: Container(),
      dropdownColor: AppColors.pink,
      focusColor: AppColors.pink,
      value: BlocProvider.of<AuthCubit>(context).user.userType,
      items: [
        DropdownMenuItem(
          value: UserType.students,
          child: Text(
            'Студент',
            style: context.text.labelStyle.copyWith(color: AppColors.white),
          ),
        ),
        DropdownMenuItem(
          value: UserType.teachers,
          child: Text(
            'Учитель',
            style: context.text.labelStyle.copyWith(color: AppColors.white),
          ),
        ),
        DropdownMenuItem(
          value: UserType.moderators,
          child: Text(
            'Модератор',
            style: context.text.labelStyle.copyWith(color: AppColors.white),
          ),
        ),
      ],
      onChanged: (UserType? value) {
        BlocProvider.of<AuthCubit>(context).user.userType =
            value ?? UserType.students;
        setState(() {});
      },
    );
  }
}
