import 'package:flutter/material.dart';

class CourseContentWidget extends StatelessWidget {
  const CourseContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Content' * 50,
      maxLines: 50,
    );
  }
}
