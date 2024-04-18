import 'package:coursor_tiktok/routing/route_generator.dart';
import 'package:coursor_tiktok/ui/common/profile_header.dart';
import 'package:coursor_tiktok/ui/themes/theme.dart';
import 'package:flutter/material.dart';

import '../../common/course_bubble.dart';
import '../../common/default_appbar.dart';
import '../../common/default_divider.dart';

class AdminProfileScreen extends StatelessWidget {
  const AdminProfileScreen({super.key});

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
          const DefaultDivider(),
          paddingVerticalMedium,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: _profileBody(context),
          ),
          const DefaultDivider(),
          paddingVerticalMedium,
          _createCourseButton(context),
        ],
      ),
    );
  }

  _createCourseButton(BuildContext context) {
    return AppButtons.defaultOutlineButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.add,
            color: context.color.unselectedLabel,
            size: MediaQuery.of(context).size.height * 0.02,
          ),
          paddingHorizontalSmall,
          Text(
            'Создать курс',
            style: context.text.labelStyle,
          ),
        ],
      ),
      onPressed: () {
        Navigator.of(context).pushNamed(editCourseRoute);
      },
    );
  }

  _profileHeader(BuildContext context) {
    return Column(
      children: [
        const ProfileHeader(
          title: 'Adel Shagaliev',
          subtitle: '@G3nD4',
        ),
        paddingVerticalMedium,
        Center(
          child: Text(
            'Курсов создано: 2',
            style: context.text.labelStyle.copyWith(
              color: AppColors.grey,
              fontSize: 13.0,
            ),
          ),
        ),
      ],
    );
  }

  _profileBody(BuildContext context) {
    return Column(
      children: [
        Text(
          'Мои курсы',
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
          ],
        ),
      ],
    );
  }
}
