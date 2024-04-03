part of 'search_courses_cubit.dart';

@immutable
sealed class SearchCoursesState {
}

final class SearchCoursesInitial extends SearchCoursesState {}

final class CoursesLoaded extends SearchCoursesState {
  final List<Course> courses;
  CoursesLoaded({required this.courses});
}

final class CoursesLoading extends SearchCoursesState {}

final class CoursesError extends SearchCoursesState {}