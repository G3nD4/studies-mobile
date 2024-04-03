import 'package:flutter/material.dart';

import '../common/default_appbar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: DefaultAppBar(title: 'Профиль'),
      body: Center(),
    );
  }
}