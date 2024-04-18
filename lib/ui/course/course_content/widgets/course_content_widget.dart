import 'package:flutter/material.dart';

class CourseContentWidget extends StatelessWidget {
  const CourseContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
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
