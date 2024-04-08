import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(LoginState());

  void isAuthorized() async {
    return emit(LoginState());
  }

  void login() {
    emit(AuthorizedState());
  }

  void enterLoginScreen() {
    emit(LoginState());
  }

  void enterRegisterScreen() {
    emit(RegisterState());
  }
}
