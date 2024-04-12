import 'package:coursor_tiktok/ui/themes/theme.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/cubit/course_videos_cubit.dart';
import 'video_small_widget.dart';

class CourseVideosList extends StatelessWidget {
  const CourseVideosList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CourseVideosCubit>(
      create: (context) => CourseVideosCubit()..nextPage(),
      child: BlocBuilder<CourseVideosCubit, CourseVideosState>(
        builder: (context, state) {
          if (state is CourseVideosLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.lightGrey,
                strokeWidth: 2.0,
              ),
            );
          } else if (state is CourseVideosError) {
            return Center(
              child: Text(state.message),
            );
          }
          return CourseVideosListView(
            videos: (state as CourseVideosLoaded).videos,
          );
        },
      ),
    );
  }
}

class CourseVideosListView extends StatefulWidget {
  final List<String> videos;

  const CourseVideosListView({super.key, required this.videos});

  @override
  State<CourseVideosListView> createState() => _CourseVideosListViewState();
}

class _CourseVideosListViewState extends State<CourseVideosListView> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      EasyDebounce.debounce(
        'corse-videos-debounce',
        const Duration(milliseconds: 1500),
        () {
          context.read<CourseVideosCubit>().nextPage();
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GridView.builder(
        shrinkWrap: true,
        controller: _scrollController,
        itemCount: widget.videos.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 8.0,
        ),
        itemBuilder: (context, i) {
          return PreviewVideoSmallWidget(text: widget.videos[i]);
        },
      ),
    );
  }
}
