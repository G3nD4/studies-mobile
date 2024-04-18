import 'package:coursor_tiktok/ui/themes/theme.dart';
import 'package:flutter/material.dart';

class CourseContentWidget extends StatelessWidget {
  const CourseContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: AppColors.studyCardColor,
        borderRadius: BorderRadius.circular(25.0),
      ),
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: ListView(
          shrinkWrap: true,
          children: const [
            Text(
              'Внезапно, многие известные личности представляют собой не что иное, как квинтэссенцию победы маркетинга над разумом и должны быть своевременно верифицированы. И нет сомнений, что диаграммы связей призывают нас к новым свершениям, которые, в свою очередь, должны быть функционально разнесены на независимые элементы.\n\nВнезапно, многие известные личности представляют собой не что иное, как квинтэссенцию победы маркетинга над разумом и должны быть своевременно верифицированы. И нет сомнений, что диаграммы связей призывают нас к новым свершениям, которые, в свою очередь, должны быть функционально разнесены на независимые элементы.',
              maxLines: 50,
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
