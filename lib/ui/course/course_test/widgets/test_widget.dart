import 'package:coursor_tiktok/test_data.dart';
import 'package:coursor_tiktok/ui/course/course_test/logic/cubit/course_test_cubit.dart';
import 'package:coursor_tiktok/ui/course/course_test/widgets/answers/answer_widget/single_answer_windget.dart';
import 'package:coursor_tiktok/ui/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'answers/answer_filed_widgets/single_answer_field_widget.dart';
import 'test_controls.dart';

class TestWidget extends StatelessWidget {
  const TestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CourseTestCubit>(
      create: (context) => CourseTestCubit(testTest),
      child: const TestWidgetView(),
    );
  }
}

class TestWidgetView extends StatefulWidget {
  const TestWidgetView({super.key});

  @override
  State<TestWidgetView> createState() => _TestWidgetViewState();
}

class _TestWidgetViewState extends State<TestWidgetView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.width,
          padding: paddingMedium,
          decoration: BoxDecoration(
            gradient: context.gradient.containerBackgroundGradient,
            borderRadius: BorderRadius.circular(25),
          ),
          child: BlocBuilder<CourseTestCubit, CourseTestState>(
            builder: (context, state) {
              late final String title;
              late final String descriptionOrQuestion;
              List<String>? answers;
              if (state is CourseTestInitial) {
                title = state.title;
                descriptionOrQuestion = state.description;
              } else if (state is CourseTestLoaded) {
                title = state.question.headerText;
                descriptionOrQuestion = state.question.questionText;
                answers = state.question.answers;
              } else {
                throw Exception('Unknown state');
              }
              return Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: context.text.appDescription.copyWith(
                      color: AppColors.white,
                      fontSize: 15.0,
                    ),
                  ),
                  paddingVerticalMedium,
                  Text(
                    descriptionOrQuestion,
                    style: context.text.appDescription.copyWith(
                      color: AppColors.white,
                      fontSize: 15.0,
                    ),
                  ),
                  if (answers != null)
                  SingleAnswerWidget(answersText: answers),
                ],
              );
            },
          ),
        ),
        paddingVerticalMedium,
        const TestControls(),
      ],
    );
  }
}
