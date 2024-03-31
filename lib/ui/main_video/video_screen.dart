import 'package:coursor_tiktok/ui/themes/theme.dart';
import 'package:flutter/material.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            gradient: context.gradient.containerBackgroundGradient,
          ),
          child: const Text('svnjskd'),
        ),
      ),
    );
  }
}
