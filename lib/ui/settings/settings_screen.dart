import 'package:coursor_tiktok/ui/common/default_appbar.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: 'Настройки'),
      body: Center(),
    );
  }
}
