import 'package:coursor_tiktok/ui/themes/theme.dart';
import 'package:flutter/material.dart';

import 'module_short_widget.dart';
import 'test_short_widget.dart';

class CourseModulesList extends StatelessWidget {
  const CourseModulesList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          ModuleShortWidget(),
          paddingVerticalMedium,
          TestShortWidget(),
        ],
      ),
    );
  }
}
