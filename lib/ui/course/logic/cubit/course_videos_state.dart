part of 'course_videos_cubit.dart';

@immutable
sealed class CourseVideosState {
  const CourseVideosState();
}

final class CourseVideosLoading extends CourseVideosState {}

final class CourseVideosLoaded extends CourseVideosState {
  final List<String> videos;
  
  const CourseVideosLoaded({required this.videos});
}

final class CourseVideosError extends CourseVideosState {
  final String message;

  const CourseVideosError(this.message);
}
