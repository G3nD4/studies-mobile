class NotificationModel {
  final int id;
  final String title;
  final String? description;
  final DateTime dateTime;
  final bool read;

  NotificationModel({
    required this.id,
    required this.title,
    this.description,
    required this.dateTime,
    this.read = false,
  });
}