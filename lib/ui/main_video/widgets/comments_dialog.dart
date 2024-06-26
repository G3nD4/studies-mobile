import 'package:flutter/material.dart';
import 'package:bottom_sheet/bottom_sheet.dart';

import '../../../domain/models/comment_model.dart';
import '../../themes/theme.dart';
import 'comment_bubble.dart';

class CommentsDialog {
  final BuildContext context;

  CommentsDialog(this.context);

  Future<void> show() async {
    showStickyFlexibleBottomSheet(
      minHeight: 0,
      initHeight: 0.5,
      maxHeight: 0.8,
      headerHeight: 64,
      context: context,
      headerBuilder: (BuildContext context, double offset) {
        return Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.4,
            height: 6.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(45),
              color: AppColors.veryLightGrey,
            ),
          ),
        );
      },
      anchors: [0, 0.5, 0.8],
      bodyBuilder: (BuildContext context, double bottomSheetOffset) =>
          SliverChildListDelegate([
        CommentBubble(
          comment: Comment(
            id: 3,
            authorName: 'Михаил Зимин',
            commentText: 'Не грузятся видео !!!',
            time: DateTime.now().subtract(const Duration(hours: 3)),
          ),
          answers: const [],
        ),
        paddingVerticalMedium,
        CommentBubble(
          comment: Comment(
            id: 0,
            authorName: 'Лев Никитин',
            commentText: 'Крутое видео !!!',
            time: DateTime.now().subtract(const Duration(minutes: 30)),
          ),
          answers: [
            Answer(
              id: 1,
              authorName: 'Михаил Зимин',
              commentText: 'Оно не грузится!!!',
              time: DateTime.now().subtract(const Duration(minutes: 20)),
              initialCommentAuthorName: 'Лев Никитин'
            ),
            Answer(
              id: 2,
              authorName: 'Антон Никитин',
              commentText: 'КОММЕНТАРИЙ !!!',
              time: DateTime.now().subtract(const Duration(minutes: 13)),
              initialCommentAuthorName: 'Михаил Зимин'
            ),
          ],
        ),
      ]),
    );
  }
}
