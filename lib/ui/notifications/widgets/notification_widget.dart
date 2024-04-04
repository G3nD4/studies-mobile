import 'package:coursor_tiktok/domain/models/notification_model.dart';
import 'package:coursor_tiktok/ui/themes/theme.dart';
import 'package:flutter/material.dart';

class NotificationWidget extends StatelessWidget {
  final NotificationModel notification;

  const NotificationWidget({super.key, required this.notification});

  String get dateTimeText {
    late final String date;
    late final String time;

    date =
        '${dateWithLeadingZero(notification.dateTime.day)}.${dateWithLeadingZero(notification.dateTime.month)}.${notification.dateTime.year}';
    time =
        '${dateWithLeadingZero(notification.dateTime.hour)}:${dateWithLeadingZero(notification.dateTime.minute)}';

    return '$date $time';
  }

  String dateWithLeadingZero(int value) {
    if (value < 10) {
      return '0$value';
    }
    return value.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              notification.title,
              style: context.text.labelStyle,
            ),
            Text(
              notification.description ?? '',
              style: headlineSmall.copyWith(fontSize: 12.0),
            ),
          ],
        ),
        Text(
          dateTimeText,
          style: headlineXSmall.copyWith(
            color: Colors.grey,
            fontSize: 12.0,
          ),
        ),
      ],
    );
  }
}
