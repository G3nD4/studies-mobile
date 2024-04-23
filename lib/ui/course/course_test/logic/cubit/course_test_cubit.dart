import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../domain/enums/test_answer_type_enum.dart';

part 'course_test_state.dart';


class CourseTestCubit extends Cubit<CourseTestState> {
  CourseTestCubit() : super(CourseTestInitial());
}
