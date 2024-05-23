import 'package:coursor_tiktok/domain/models/comment_model.dart';
import 'package:coursor_tiktok/ui/common/circle_avatar.dart';
import 'package:coursor_tiktok/ui/themes/theme.dart';
import 'package:flutter/material.dart';

import '../../../data/time_to_string_converter.dart';
import '../../../domain/enums/time_convert_type.dart';

class CommentBubble extends StatelessWidget {
  final Comment comment;

  const CommentBubble({
    super.key,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        paddingHorizontalSmall,
        const DefaultCircleAvatar(
          radius: 20.0,
        ),
        paddingHorizontalSmall,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              comment.authorName,
              style: context.text.appDescription.copyWith(fontSize: 13),
            ),
            paddingVerticalSmall,
            Text(
              comment.commentText,
              style: context.text.appDescription.copyWith(fontSize: 11),
            ),
            footer(context),
          ],
        ),
      ],
    );
  }

  Widget footer(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(padding: EdgeInsets.zero),
            child: Text(
              'Ответить',
              style: context.text.appDescription.copyWith(
                fontSize: 9,
                color: AppColors.lightGrey,
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(padding: EdgeInsets.zero),
            child: Text(
              'Удалить',
              style: context.text.appDescription.copyWith(
                fontSize: 9,
                color: AppColors.pink,
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(padding: EdgeInsets.zero),
            child: Text(
              'Заблокировать',
              style: context.text.appDescription.copyWith(
                fontSize: 9,
                color: AppColors.pink,
              ),
            ),
          ),
          paddingHorizontalSmall,
          Text(
            '${TimeToStringConverter().convert(comment.time, TimeConvertType.comment)} назад',
            style: context.text.appDescription.copyWith(
              fontSize: 9,
              color: AppColors.lightGrey,
            ),
          ),
        ],
      );
}
