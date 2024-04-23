import 'package:coursor_tiktok/ui/course/course_test/logic/cubit/course_test_cubit.dart';
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<CourseTestCubit, CourseTestState>(
            builder: (context, state) {
              return Text(state.toString());
            },
          ),
        ],
      ),
    );
  }
}
