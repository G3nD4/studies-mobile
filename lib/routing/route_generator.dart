import 'package:flutter/material.dart';

import '../auth/auth_screen.dart';
import '../main.dart';

const mainRoute = '/';
const authRoute = '/auth';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case mainRoute:
        return MaterialPageRoute(
          builder: (_) => const CoursorTikTok(),
          settings: settings,
        );

      case authRoute:
        return MaterialPageRoute(
          builder: (_) => const AuthScreen(),
          settings: settings,
        );
      default:
        {
          throw Exception('Route not found!');
        }
    }
  }
}
