import 'package:coursor_tiktok/routing/route_generator.dart';
import 'package:flutter/material.dart';
import '../../themes/theme.dart';

class TestShortWidget extends StatelessWidget {
  const TestShortWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(courseTestRoute);
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          border: Border.all(),
        ),
        child: Padding(
          padding: paddingMedium,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Тест 1. Основы подбора цветов >>',
                style: context.text.labelStyle,
              ),
              Text(
                'Пройдено',
                style: context.text.labelStyle.copyWith(fontSize: 13.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
