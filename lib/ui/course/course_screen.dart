import 'package:coursor_tiktok/domain/models/course_model.dart';
import 'package:coursor_tiktok/ui/common/default_appbar.dart';
import 'package:coursor_tiktok/ui/common/default_divider.dart';
import 'package:coursor_tiktok/ui/common/profile_header.dart';
import 'package:coursor_tiktok/ui/themes/theme.dart';
import 'package:flutter/material.dart';

import 'widgets/course_videos_list.dart';

class CourseScreen extends StatelessWidget {
  final Course course;

  const CourseScreen({
    super.key,
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(
        title: 'Страница курса',
        implyLeading: true,
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: paddingMedium,
            child: _buildHeader(context),
          ),
          const DefaultDivider(),
          aboutCourse(context),
          const DefaultDivider(),
          paddingVerticalSmall,
          const CourseVideosList(),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      children: [
        const ProfileHeader(
          title: 'My Course',
          subtitle: 'by @G3nD3',
        ),
        const SizedBox(height: 24.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppButtons.defaultButton(
              onPressed: () {},
              color: context.color.selectedLabel,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Редактировать курс',
                  style: context.text.labelStyle.copyWith(
                    fontSize: 12.0,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
            AppButtons.defaultButton(
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Управление курсом',
                  style: context.text.labelStyle.copyWith(fontSize: 12.0),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget aboutCourse(BuildContext context) {
    return Padding(
      padding: paddingMedium,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('О курсе', style: context.text.labelStyle),
          paddingVerticalSmall,
          Text(
            course.description,
            style: context.text.labelStyle,
          ),
          paddingVerticalMedium,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Зачислено 5230',
                style: context.text.labelStyle.copyWith(
                  fontSize: 13.0,
                  color: AppColors.lightGrey,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.flag,
                    color: AppColors.lightGrey,
                  ),
                  Text(
                    'Завершило 5230',
                    style: context.text.labelStyle.copyWith(
                      fontSize: 13.0,
                      color: AppColors.lightGrey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.access_time_rounded,
                color: AppColors.lightGrey,
              ),
              const SizedBox(width: 11.0),
              Text(
                'Курс создан 24.02.2023',
                style: context.text.labelStyle.copyWith(
                  fontSize: 13.0,
                  color: AppColors.lightGrey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
