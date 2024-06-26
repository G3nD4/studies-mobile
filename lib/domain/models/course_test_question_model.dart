import 'package:coursor_tiktok/domain/models/correct_answer.dart';

import '../enums/test_answer_type_enum.dart';

class TestQuestion {
  final int id;
  final String headerText;
  final String questionText;
  final TestAnswerType answerType;
  final List<String> answers;
  final CorrectAnswer correctAnswerIndices;

  TestQuestion({
    required this.id,
    required this.headerText,
    required this.questionText,
    required this.answerType,
    required this.answers,
    required this.correctAnswerIndices,
  });
}
