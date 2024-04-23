import 'package:bloc/bloc.dart';
import 'package:coursor_tiktok/domain/models/course_test_question_model.dart';
import 'package:meta/meta.dart';


part 'course_test_state.dart';


class CourseTestCubit extends Cubit<CourseTestState> {
  CourseTestCubit() : super(CourseTestInitial());
}
