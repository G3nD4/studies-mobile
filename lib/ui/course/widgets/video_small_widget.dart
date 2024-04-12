import 'package:coursor_tiktok/ui/themes/theme.dart';
import 'package:flutter/material.dart';

class PreviewVideoSmallWidget extends StatelessWidget {
  final String text;

  const PreviewVideoSmallWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        throw UnimplementedError('Implement transition to main video screen');
      },
      child: Container(
        width: MediaQuery.of(context).size.width * (1 / 4.3),
        height: MediaQuery.of(context).size.width * (1 / 4.3),
        decoration: BoxDecoration(
          color: AppColors.grey,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Center(
            child: Text(
          text,
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 20.0,
          ),
        )),
      ),
    );
  }
}
