import 'domain/models/notification_model.dart';

final List<NotificationModel> testNotificationsList = [
  NotificationModel(
    id: 1,
    title: 'Уведомление 1',
    description: 'Описание уведомления 1',
    dateTime: DateTime.now().subtract(const Duration(hours: 1)),
  ),
  NotificationModel(
    id: 2,
    title: 'Уведомление 2',
    dateTime: DateTime.now().subtract(const Duration(hours: 2)),
  ),
  NotificationModel(
    id: 3,
    title: 'Уведомление 3',
    description: 'Описание уведомления 3',
    dateTime: DateTime.now().subtract(const Duration(hours: 3)),
  ),
  NotificationModel(
    id: 4,
    title: 'Уведомление 4',
    dateTime: DateTime.now().subtract(const Duration(hours: 4)),
    read: true,
  ),
  NotificationModel(
    id: 5,
    title: 'Уведомление 5',
    description: 'Описание уведомления 5',
    dateTime: DateTime.now().subtract(const Duration(hours: 5)),
    read: true,
  ),
  NotificationModel(
    id: 6,
    title: 'Уведомление 6',
    description: 'Описание уведомления 6',
    dateTime: DateTime.now().subtract(const Duration(hours: 6)),
    read: true,
  ),
];
