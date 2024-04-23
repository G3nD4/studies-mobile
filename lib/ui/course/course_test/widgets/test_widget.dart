import 'package:coursor_tiktok/ui/course/course_test/logic/cubit/course_test_cubit.dart';
import 'package:coursor_tiktok/ui/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestWidget extends StatelessWidget {
  const TestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CourseTestCubit>(
      create: (context) => CourseTestCubit(),
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
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.width,
      padding: paddingMedium,
      decoration: BoxDecoration(
        gradient: context.gradient.containerBackgroundGradient,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<CourseTestCubit, CourseTestState>(
            builder: (context, state) {
              return Text(
                state.toString(),
                style: context.text.appDescription.copyWith(
                  color: AppColors.white,
                  fontSize: 15.0,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
