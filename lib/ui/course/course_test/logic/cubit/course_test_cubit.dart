import 'package:bloc/bloc.dart';
import 'package:coursor_tiktok/domain/models/course_test_question_model.dart';
import 'package:meta/meta.dart';

import '../../../../../domain/models/course_test_model.dart';

part 'course_test_state.dart';

class CourseTestCubit extends Cubit<CourseTestState> {
  int currentQuestion = -1;
  final Test test;

  CourseTestCubit(this.test)
      : super(CourseTestInitial(test.title, test.description));

  finish () {}

  nextQuestion() {
    if (currentQuestion > test.questions.length - 2) return;
    emit(CourseTestLoaded(
      test.questions[++currentQuestion],
      isLastQuestion: currentQuestion == test.questions.length - 1,
    ));
  }

  previousQuestion() {
    if (currentQuestion > 0) {
      emit(CourseTestLoaded(
        test.questions[--currentQuestion],
        isLastQuestion: false,
      ));
    } else {
      emit(CourseTestInitial(test.title, test.description));
    }
  }
}
