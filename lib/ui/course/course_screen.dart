import 'package:coursor_tiktok/ui/common/default_appbar.dart';
import 'package:flutter/material.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(
        title: 'Страница курса',
        implyLeading: true,
      ),
      body: Column(
        children: [
          
        ],
      ),
    );
  }
}