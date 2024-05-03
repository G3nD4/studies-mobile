import 'package:coursor_tiktok/domain/enums/user_type.dart';

class AuthUser {
  String email;
  String password;
  UserType userType;

  AuthUser({required this.email, required this.password, required this.userType});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}