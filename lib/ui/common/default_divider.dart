import 'package:flutter/material.dart';

import '../themes/theme.dart';

class DefaultDivider extends StatelessWidget {
  const DefaultDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      thickness: 2.0,
      color: AppColors.veryLightGrey,
    );
  }
}
