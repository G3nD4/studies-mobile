import 'package:coursor_tiktok/ui/main_video/widgets/comments_dialog.dart';
import 'package:coursor_tiktok/ui/themes/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainVideoControls extends StatelessWidget {
  const MainVideoControls({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.favorite,
            size: 36.0,
            color: AppColors.purple,
          ),
        ),
        paddingVerticalMedium,
        IconButton(
          onPressed: () async {
            CommentsDialog(context).show();
          },
          icon: const Icon(
            CupertinoIcons.chat_bubble, //bubble_right,
            size: 36.0,
            color: AppColors.grey,
          ),
        ),
        paddingVerticalSmall,
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.more_horiz_outlined,
            size: 36.0,
            color: AppColors.grey,
          ),
        ),
      ],
    );
  }
}
