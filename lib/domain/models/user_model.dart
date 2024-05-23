import 'package:coursor_tiktok/domain/enums/user_type.dart';

class User {
  String email;
  String password;
  String userName;
  String phoneNumber;
  UserType userType;

  User({
    required this.email,
    required this.password,
    required this.userName,
    required this.phoneNumber,
    required this.userType,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password_hash': password,
      'username': userName,
      'phone_number': phoneNumber,
      'user_type': userType.name,
    };
  }
}