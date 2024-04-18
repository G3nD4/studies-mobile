import 'package:coursor_tiktok/ui/common/default_appbar.dart';
import 'package:coursor_tiktok/ui/themes/theme.dart';
import 'package:flutter/material.dart';

class CourseManagementScreen extends StatelessWidget {
  const CourseManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double buttonHeight = MediaQuery.of(context).size.height * 0.064;

    return Scaffold(
      appBar: const DefaultAppBar(
        title: 'Управление курсом',
        implyLeading: true,
      ),
      body: Padding(
        padding: paddingMedium,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildButton(
              context,
              buttonHeight,
              'Создать теорию >>',
              () {},
            ),
            paddingVerticalMedium,
            _buildButton(
              context,
              buttonHeight,
              'Создать ролик >>',
              () {},
            ),
            paddingVerticalMedium,
            _buildButton(
              context,
              buttonHeight,
              'Создать тест >>',
              () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(
    BuildContext context,
    double buttonHeight,
    String text,
    void Function() onPressed,
  ) =>
      AppButtons.defaultOutlineButton(
        onPressed: () {},
        child: SizedBox(
          height: buttonHeight,
          child: Center(
            child: Text(
              'Создать теорию >>',
              style: context.text.appDescription.copyWith(
                fontSize: 15.0,
              ),
            ),
          ),
        ),
      );
}
