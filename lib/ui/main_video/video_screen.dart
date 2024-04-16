import 'package:coursor_tiktok/ui/main_video/cubit/main_video_player_cubit.dart';
import 'package:coursor_tiktok/ui/main_video/widgets/controls/main_controls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../themes/theme.dart';
import 'widgets/video_player_widget.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => MainVideoPlayerCubit(),
        child: Stack(
          children: [
            Positioned.fill(
              // TODO: Сделать разноцветные прогресс индикаторы
              child: PageView(
                scrollDirection: Axis.vertical,
                children: const [
                  VideoPlayerWidget(
                    color: Colors.green,
                  ),
                  VideoPlayerWidget(
                    color: Colors.red,
                  ),
                  VideoPlayerWidget(
                    color: Colors.white,
                  ),
                ],
              ),
              // GestureDetector(
              //   onVerticalDragEnd: (details) {},
              //   child: Container(
              //     color: AppColors.black,
              //     child: const Center(
              //         child: CircularProgressIndicator(
              //       color: AppColors.purple,
              //     )),
              //   ),
              // ),
            ),
            const Align(
              alignment: Alignment.centerRight,
              child: MainVideoControls(),
            ),
          ],
        ),
      ),
    );
  }
}
