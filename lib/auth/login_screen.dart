import 'package:flutter/material.dart';

import '../ui/themes/theme.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.65,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          AppShadows.containerInnerLightShadow,
        ],
        color: AppColors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Column(
        children: [
          Text('sjvhjsvld'),
        ],
      ),
    );
  }
}
