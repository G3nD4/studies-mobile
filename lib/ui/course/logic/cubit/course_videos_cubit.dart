import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'course_videos_state.dart';

class CourseVideosCubit extends Cubit<CourseVideosState> {
  CourseVideosCubit() : super(CourseVideosLoading());
  int offset = 1;
  int limit = 10;
  final List<String> videos = [];

  nextPage() async {
    emit(CourseVideosLoading());
    await Future.delayed(const Duration(seconds: 1));
    ++offset;
    videos.addAll(List.generate(limit, (index) => index.toString()));
    emit(CourseVideosLoaded(videos: videos));
  }

  refresh() async {
    videos.clear();
    offset = 1;
    await nextPage();
  }
}
