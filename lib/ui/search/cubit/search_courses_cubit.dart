import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/models/course_model.dart';

part 'search_courses_state.dart';

class SearchCoursesCubit extends Cubit<SearchCoursesState> {
  bool expanded = false;
  final List<Course> courses = [];

  SearchCoursesCubit() : super(SearchCoursesInitial());

  void getCourses({
    String? title,
    int limit = 15,
    int offset = 0,
  }) {
    emit(CoursesLoading());
    // тестовая заглушка
    for (int i = 0; i < 5; i++) {
      courses.add(Course(
        id: i,
        title: 'Course $i',
        description: 'Description $i',
      ));
    }
    emit(CoursesLoaded(courses: courses));
  }

  // для кнопки "Показать еще"
  void expand() {
    expanded = true;
    emit(CoursesLoaded(courses: courses));
  }

  void collapse() {
    expanded = false;
    emit(CoursesLoaded(courses: courses));
  }
}
