import 'package:flutter/material.dart';

import '../auth/auth_screen.dart';
import '../domain/models/course_model.dart';
import '../main.dart';
import '../ui/course/course_content/course_content_screen.dart';
import '../ui/course/course_screen.dart';
import '../ui/course/course_test/course_test_screen.dart';
import '../ui/course/redact_course/redact_course_screen.dart';
import '../ui/course/redact_course/widgets/course_management_screen.dart';
import '../ui/main_video/video_screen.dart';

const mainRoute = '/';
const authRoute = '/auth';

// Video routes
const videoRoute = '/video';

// Course routes
const courseScreenRoute = '/course';
const courseManagementRoute = '/course/management';
const courseContentRoute = '/course/content';
const editCourseRoute = '/course/edit';
const courseTestRoute = '/course/test';

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
      case videoRoute:
        return MaterialPageRoute(
          builder: (_) => const VideoScreen(),
        );

      // Course routes
      case editCourseRoute:
        return MaterialPageRoute(
          builder: (_) => const RedactCourseScreen(),
        );
      case courseContentRoute:
        return MaterialPageRoute(
          builder: (_) => const CourseContentScreen(),
        );
      case courseManagementRoute:
        return MaterialPageRoute(
          builder: (_) => const CourseManagementScreen(),
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

      case courseTestRoute:
        return MaterialPageRoute(
          builder: (_) => const CourseTestScreen(),
        );
      default:
        {
          throw Exception('Route not found!');
        }
    }
  }
}
