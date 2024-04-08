part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class LoginState extends AuthState {}

final class RegisterState extends AuthState {}

final class AuthorizedState extends AuthState {}