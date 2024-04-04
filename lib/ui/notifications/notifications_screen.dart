import 'package:coursor_tiktok/ui/themes/theme.dart';
import 'package:flutter/material.dart';

import '../../test_data.dart';
import '../common/default_appbar.dart';
import 'widgets/notification_widget.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(title: 'Уведомления'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Новые',
              style: headlineXSmall.copyWith(
                color: AppColors.veryLightGrey,
                fontWeight: FontWeight.w600,
                fontSize: 13.0,
              ),
            ),
          ),
          paddingVerticalMedium,
          Column(
            children: _getNotifications(false),
          ),
          paddingVerticalMedium,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Прочитанные',
              style: headlineXSmall.copyWith(
                color: AppColors.veryLightGrey,
                fontWeight: FontWeight.w600,
                fontSize: 13.0,
              ),
            ),
          ),
          paddingVerticalMedium,
          Column(
            children: _getNotifications(true),
          ),
        ],
      ),
    );
  }

  _getNotifications(bool read) {
    var children = <Widget>[];
    for (var notification in testNotificationsList) {
      if (notification.read == read) {
        children.add(
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: NotificationWidget(notification: notification),
              ),
              const Divider(
                color: AppColors.veryLightGrey,
                thickness: 2.0,
              ),
              paddingVerticalSmall,
            ],
          ),
        );
      }
    }
    return children;
  }
}
