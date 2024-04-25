part of 'course_test_cubit.dart';

@immutable
sealed class CourseTestState {}

final class CourseTestInitial extends CourseTestState {
  final String title;
  final String description;

  CourseTestInitial(this.title, this.description);
}

final class CourseTestLoaded extends CourseTestState {
  final TestQuestion question;
  final bool isLastQuestion;

  CourseTestLoaded(this.question, {required this.isLastQuestion});
}
