import 'package:coursor_tiktok/ui/course/course_test/widgets/test_widget.dart';
import 'package:coursor_tiktok/ui/course/widgets/course_content_header.dart';
import 'package:coursor_tiktok/ui/themes/theme.dart';
import 'package:flutter/material.dart';
import '../../../../domain/enums/content_type_enum.dart';
import '../../../common/default_divider.dart';

class CourseTestScreen extends StatelessWidget {
  const CourseTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Страница курса'),
        centerTitle: true,
      ),
      body: const Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 16.0,
            ),
            child: CourseContentHeader(
              title: '1. Основы подбора цветов',
              contentType: CourseContentType.test,
            ),
          ),
          DefaultDivider(),
          paddingVerticalMedium,
          TestWidget(),
        ],
      ),
    );
  }
}
