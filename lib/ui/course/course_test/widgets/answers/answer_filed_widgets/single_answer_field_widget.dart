import 'package:coursor_tiktok/ui/themes/theme.dart';
import 'package:flutter/material.dart';

class SingleAnswerFieldWidget extends StatefulWidget {
  final String text;

  const SingleAnswerFieldWidget({super.key, required this.text});

  @override
  State<SingleAnswerFieldWidget> createState() => _SingleAnswerFieldWidgetState();
}

class _SingleAnswerFieldWidgetState extends State<SingleAnswerFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Checkbox(
          onChanged: (value) {},
          checkColor: AppColors.white,
          side: BorderSide.none,
          fillColor: MaterialStateProperty.all(AppColors.white),
          shape: const CircleBorder(),
          value: false,
        ),
        Text(
          widget.text,
          style: context.text.labelStyle.copyWith(color: AppColors.white),
        ),
      ],
    );
  }
}
