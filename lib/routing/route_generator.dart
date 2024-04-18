import 'package:flutter/material.dart';

import '../auth/auth_screen.dart';
import '../domain/models/course_model.dart';
import '../main.dart';
import '../ui/course/course_screen.dart';
import '../ui/course/redact_course/widgets/course_management_screen.dart';

const mainRoute = '/';
const authRoute = '/auth';
const courseScreenRoute = '/course';
const courseManagementRoute = '/course/management';

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
      case courseScreenRoute:
        return MaterialPageRoute(
          builder: (_) => CourseScreen(
            course: Course(
              id: 1,
              title: 'Курс 1',
              description: 'Описание курса 1',
            ),
          ),
        );

      case courseManagementRoute:
        return MaterialPageRoute(
          builder: (_) => const CourseManagementScreen(),
        );
      default:
        {
          throw Exception('Route not found!');
        }
    }
  }
}
