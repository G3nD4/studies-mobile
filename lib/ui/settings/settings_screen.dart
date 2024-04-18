import 'package:coursor_tiktok/ui/common/default_appbar.dart';
import 'package:flutter/material.dart';

import '../themes/theme.dart';
import 'widgets/app_settings_widget.dart';
import 'widgets/change_profile_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(title: 'Настройки'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          paddingVerticalMedium,
          ChangeProfileWidget(),
          paddingVerticalMedium,
          // Text(
          //   'Приложение',
          //   style: context.text.appDescription,
          // ),
          const AppSettingsWidget(),
        ],
      ),
    );
  }
}
