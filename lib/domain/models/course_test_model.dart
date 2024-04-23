import 'course_test_question_model.dart';

class Test {
  final int id;
  final List<TestQuestion> questions;
  final String description;
  final String title;
  final String farewell;

  Test({
    required this.id,
    required this.questions,
    required this.description,
    required this.title,
    required this.farewell,
  });
}
