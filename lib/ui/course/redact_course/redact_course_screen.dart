import 'package:coursor_tiktok/ui/common/circle_avatar.dart';
import 'package:coursor_tiktok/ui/common/default_appbar.dart';
import 'package:coursor_tiktok/ui/themes/theme.dart';
import 'package:flutter/material.dart';

class RedactCourseScreen extends StatefulWidget {
  const RedactCourseScreen({super.key});

  @override
  State<RedactCourseScreen> createState() => _RedactCourseScreenState();
}

class _RedactCourseScreenState extends State<RedactCourseScreen> {
  late final TextEditingController titleController;
  late final TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(
        title: 'Редактировать курс',
        implyLeading: true,
      ),
      body: Padding(
        padding: paddingMedium,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            paddingVerticalMedium,
            const Center(
              child: DefaultCircleAvatar(radius: 40.0),
            ),
            paddingVerticalMedium,
            TextFormField(
              controller: titleController,
              decoration: AppInputDecorations.defaultInputDecoration(
                fillColor: AppColors.grey.withOpacity(0.2),
                hintStyle: context.text.labelStyle.copyWith(),
                hintText: 'Название',
              ),
            ),
            paddingVerticalMedium,
            TextFormField(
              controller: descriptionController,
              maxLines: 10,
              decoration: AppInputDecorations.defaultInputDecoration(
                fillColor: AppColors.grey.withOpacity(0.2),
                hintStyle: context.text.labelStyle.copyWith(),
                hintText: 'О курсе',
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'закрыть курс',
                style: context.text.appDescription.copyWith(
                  fontSize: 15.0,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
