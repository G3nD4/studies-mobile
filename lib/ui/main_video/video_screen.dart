import 'package:coursor_tiktok/ui/main_video/cubit/main_video_player_cubit.dart';
import 'package:coursor_tiktok/ui/main_video/widgets/controls/main_controls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/video_player_widget.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => MainVideoPlayerCubit()..loadNext(),
        child: Stack(
          children: [
            Positioned.fill(
              child: BlocBuilder<MainVideoPlayerCubit, MainVideoPlayerState>(
                builder: (context, state) {
                  if (state is MainVideoPlayerLoaded) {
                    return PageView(
                      scrollDirection: Axis.vertical,
                      children: [
                        VideoPlayerWidget(
                          color: Colors.green,
                          fileBytes: state.file,
                        ),
                        VideoPlayerWidget(
                          color: Colors.red,
                          fileBytes: state.file,
                        ),
                        VideoPlayerWidget(
                          color: Colors.white,
                          fileBytes: state.file,
                        ),
                      ],
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
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
