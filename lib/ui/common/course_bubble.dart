import 'package:coursor_tiktok/ui/common/circle_avatar.dart';
import 'package:coursor_tiktok/ui/themes/theme.dart';
import 'package:flutter/material.dart';

import '../../routing/route_generator.dart';

class CourseBubble extends StatelessWidget {
  final String title;
  final String? description;
  const CourseBubble({
    super.key,
    required this.title,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(courseScreenRoute);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const DefaultCircleAvatar(),
          paddingHorizontalMedium,
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.text.labelStyle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                paddingVerticalSmall,
                Text(
                  description ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: context.text.labelStyle,
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
    );
  }
}
