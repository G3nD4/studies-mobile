import 'package:coursor_tiktok/ui/themes/theme.dart';
import 'package:flutter/material.dart';

import '../common/course_bubble.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: paddingMedium,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CourseBubble(title: 'Flutter', description: 'Course' * 5),
            paddingVerticalSmall,
            CourseBubble(title: 'Flutter', description: 'Course' * 15),
            paddingVerticalSmall,
            CourseBubble(title: 'Flutter', description: 'Course' * 5),
            paddingVerticalSmall,
            CourseBubble(title: 'Flutter', description: 'Course' * 5),
          ],
        ),
      ),
    );
  }
}
