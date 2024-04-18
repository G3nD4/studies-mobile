import 'package:coursor_tiktok/ui/themes/theme.dart';
import 'package:flutter/material.dart';

class CourseContentWidget extends StatelessWidget {
  const CourseContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: context.color.appContainerBackground,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: ListView(
          shrinkWrap: true,
          children: [
            Text(
              'Content' * 200,
              maxLines: 50,
            ),
          ],
        ),
      ),
    );
  }
}
