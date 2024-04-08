import 'package:coursor_tiktok/ui/common/circle_avatar.dart';
import 'package:coursor_tiktok/ui/themes/theme.dart';
import 'package:flutter/material.dart';

import '../../common/course_bubble.dart';
import '../../common/default_appbar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(title: 'Профиль'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: _profileHeader(context),
          ),
          paddingVerticalMedium,
          const Divider(
            thickness: 2.0,
            color: AppColors.veryLightGrey,
          ),
          paddingVerticalMedium,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: _profileBody(context),
          ),
        ],
      ),
    );
  }

  _profileHeader(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const DefaultCircleAvatar(
              radius: 40.0,
            ),
            paddingHorizontalMedium,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Adel Shagaliev',
                  style: context.text.labelStyle,
                ),
                paddingVerticalSmall,
                Text(
                  '@G3nD4',
                  style: context.text.labelStyle.copyWith(
                    color: AppColors.lightGrey,
                    fontSize: 13.0,
                  ),
                ),
              ],
            ),
          ],
        ),
        paddingVerticalMedium,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Курсов пройдено: 15',
              style: context.text.labelStyle.copyWith(
                color: AppColors.grey,
                fontSize: 13.0,
              ),
            ),
            Text(
              'Курсы в процессе: 10',
              style: context.text.labelStyle.copyWith(
                color: AppColors.grey,
                fontSize: 13.0,
              ),
            ),
          ],
        ),
      ],
    );
  }

  _profileBody(BuildContext context) {
    return Column(
      children: [
        Text(
          'Доступные курсы',
          style: context.text.appDescription,
        ),
        paddingVerticalMedium,
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CourseBubble(title: 'Flutter', description: 'Course' * 5),
            paddingVerticalMedium,
            CourseBubble(title: 'Flutter', description: 'Course' * 15),
            paddingVerticalMedium,
            CourseBubble(title: 'Flutter', description: 'Course' * 5),
            paddingVerticalMedium,
            CourseBubble(title: 'Flutter', description: 'Course' * 5),
          ],
        ),
      ],
    );
  }
}
