import 'package:coursor_tiktok/ui/common/circle_avatar.dart';
import 'package:coursor_tiktok/ui/themes/theme.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? imageUrl;

  const ProfileHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
              title,
              style: context.text.labelStyle,
            ),
            paddingVerticalSmall,
            Text(
              subtitle,
              style: context.text.labelStyle.copyWith(
                color: AppColors.lightGrey,
                fontSize: 13.0,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
