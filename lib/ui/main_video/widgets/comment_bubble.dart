import 'package:coursor_tiktok/domain/models/comment_model.dart';
import 'package:coursor_tiktok/ui/common/circle_avatar.dart';
import 'package:coursor_tiktok/ui/themes/theme.dart';
import 'package:flutter/material.dart';

import '../../utils/text_trimmer.dart';
import '../../utils/time_to_string_converter.dart';
import '../../../domain/enums/time_convert_type.dart';

class CommentBubble extends StatelessWidget {
  final Comment comment;
  final List<Answer> answers;

  const CommentBubble({
    super.key,
    required this.comment,
    required this.answers,
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
            Row(
              children: [
                Text(
                  comment.authorName,
                  style: context.text.appDescription.copyWith(fontSize: 13),
                ),
                if (comment is Answer)
                  Text(
                    TextTrimmer().trimText(' ответ ${(comment as Answer).initialCommentAuthorName}', 17),
                    style: context.text.appDescription.copyWith(
                      fontSize: 10,
                      color: AppColors.lightGrey,
                    ),
                  ),
              ],
            ),
            paddingVerticalSmall,
            Text(
              comment.commentText,
              style: context.text.appDescription.copyWith(fontSize: 11),
            ),
            footer(context),
            answersList(context),
          ],
        ),
      ],
    );
  }

  Widget answersList(BuildContext context) {
    if (answers.isEmpty) {
      return const SizedBox();
    }
    return Column(
      children: answers
          .map((comment) => CommentBubble(
                comment: comment,
                answers: const [],
              ))
          .toList(),
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
          paddingHorizontalSmall,
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(padding: EdgeInsets.zero),
            child: Text(
              'Пожаловаться',
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
