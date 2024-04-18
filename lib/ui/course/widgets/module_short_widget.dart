import 'package:coursor_tiktok/routing/route_generator.dart';
import 'package:coursor_tiktok/ui/themes/theme.dart';
import 'package:flutter/material.dart';

class ModuleShortWidget extends StatefulWidget {
  final Color color;

  const ModuleShortWidget({super.key, required this.color});

  @override
  State<ModuleShortWidget> createState() => _ModuleShortWidgetState();
}

class _ModuleShortWidgetState extends State<ModuleShortWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(courseContentRoute);
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(25.0),
          gradient: AppGradients.containerBackgroundGradient,
        ),
        child: Padding(
          padding: paddingMedium,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Теория 1. Основы подбора цветов >>',
                style: context.text.labelStyle.copyWith(color: AppColors.white),
              ),
              Text(
                'Пройдено',
                style: context.text.labelStyle.copyWith(
                  fontSize: 13.0,
                  color: AppColors.veryLightGrey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
