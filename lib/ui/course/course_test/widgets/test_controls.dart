import 'package:coursor_tiktok/ui/course/course_test/logic/cubit/course_test_cubit.dart';
import 'package:coursor_tiktok/ui/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestControls extends StatelessWidget {
  const TestControls({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppButtons.defaultOutlineButton(
          child: Text(
            '<< Назад',
            style: context.text.labelStyle.copyWith(color: AppColors.grey),
          ),
          onPressed: () {
            BlocProvider.of<CourseTestCubit>(context).previousQuestion();
          },
        ),
        paddingHorizontalMedium,
        BlocBuilder<CourseTestCubit, CourseTestState>(
            builder: (context, state) {
          if (state is CourseTestLoaded) {
            if (state.isLastQuestion) {
              return AppButtons.defaultOutlineButton(
                child: Text(
                  'Завершить',
                  style:
                      context.text.labelStyle.copyWith(color: AppColors.grey),
                ),
                onPressed: () {
                  BlocProvider.of<CourseTestCubit>(context).finish();
                },
              );
            }
          }
          return AppButtons.defaultOutlineButton(
            child: Text(
              'Далее >>',
              style: context.text.labelStyle.copyWith(color: AppColors.grey),
            ),
            onPressed: () {
              BlocProvider.of<CourseTestCubit>(context).nextQuestion();
            },
          );
        }),
      ],
    );
  }
}
