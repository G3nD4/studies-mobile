import 'package:flutter/material.dart';

import '../common/default_appbar.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: 'Уведомления'),
      body: Container(),
    );
  }
}