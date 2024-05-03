import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:coursor_tiktok/data/services/auth/api.dart';
import 'package:coursor_tiktok/domain/enums/user_type.dart';
import 'package:coursor_tiktok/domain/models/user_model.dart';
import 'package:meta/meta.dart';

import '../../domain/models/auth_user.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final RegisterUser user = RegisterUser(
    email: '',
    password: '',
    userName: '',
    phoneNumber: '',
    userType: UserType.students,
  );

  AuthCubit() : super(LoginState());

  void isAuthorized() async {
    return emit(LoginState());
  }

  void login() async {
    try {
      final bool authorizedSuccessful = await API().login(AuthUser(
        email: user.email,
        password: user.password,
        userType: user.userType,
      ));
      if (authorizedSuccessful) {
        emit(AuthorizedState());
      } else {
        throw Exception('Wrong password or email'); // TODO: заглушка, переделать на LoginErrorState
      }
    } catch (e) {
      // TODO: Вывести окошко с ошибкой
      log(e.toString());
    }
  }

  void register() async {
    try {
      await API().register(user);
      emit(AuthorizedState());
    } catch (e) {
      // TODO: Вывести окошко с ошибкой
      log(e.toString());
    }
  }

  void enterLoginScreen() {
    _resetUserFields();
    emit(LoginState());
  }

  void enterRegisterScreen() {
    _resetUserFields();
    emit(RegisterState());
  }

  void _resetUserFields() {
    user.email = '';
    user.password = '';
    user.userName = '';
    user.phoneNumber = '';
    user.userType = UserType.students;
  }

  void logUserFields() {
    log(user.toJson().toString());
  }
}
