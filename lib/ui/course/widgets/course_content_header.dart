import 'package:coursor_tiktok/domain/enums/content_type_enum.dart';
import 'package:flutter/material.dart';

import '../../themes/theme.dart';

class CourseContentHeader extends StatelessWidget {
  final String title;
  final CourseContentType contentType;

  const CourseContentHeader({
    super.key,
    required this.title,
    required this.contentType,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              getHeaderText(),
              style: context.text.appDescription.copyWith(fontSize: 15.0),
            ),
            paddingVerticalMedium,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.timelapse_outlined,
                  color: AppColors.lightGrey,
                ),
                paddingHorizontalSmall,
                Text(
                  'Открыто 24.02.2023' '\nБессрочно',
                  style: context.text.appDescription.copyWith(
                    fontSize: 10.0,
                    color: AppColors.lightGrey,
                  ),
                ),
              ],
            )
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert),
        ),
      ],
    );
  }

  String getHeaderText() {
    late String type;
    switch (contentType) {
      case CourseContentType.education:
        type = 'Теория';
      case CourseContentType.test:
        type = 'Тест';
      default:
        type = '';
    }
    return '$type $title';
  }
}
