import 'package:coursor_tiktok/ui/themes/theme.dart';
import 'package:flutter/material.dart';

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
          onPressed: () {},
        ),
        paddingHorizontalMedium,
        AppButtons.defaultOutlineButton(
          child: Text(
            'Далее >>',
            style: context.text.labelStyle.copyWith(color: AppColors.grey),
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
