import 'package:flutter/material.dart';

import '../../themes/theme.dart';

class VideoPlayerWidget extends StatelessWidget {
  final Color color;

  const VideoPlayerWidget({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.black,
      child: Center(
          child: CircularProgressIndicator(
        color: color,
      )),
    );
  }
}