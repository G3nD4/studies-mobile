import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'course_videos_state.dart';

class MediaLoaderCubit extends Cubit<CourseVideosState> {
  MediaLoaderCubit() : super(CourseVideosLoading());
  int offset = 1;
  int limit = 10;
  final List<String> videos = [];

  nextPage() async {
    // emit(CourseVideosLoading());
    await Future.delayed(const Duration(seconds: 1));
    ++offset;
    videos.addAll(List.generate(limit, (index) => index.toString()));
    try {
      emit(CourseVideosLoaded(videos: videos));
    } catch (e) {
      log('Most probably, user has left this page');
    }
  }

  refresh() async {
    videos.clear();
    offset = 1;
    await nextPage();
  }
}
