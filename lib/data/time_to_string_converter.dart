import 'package:coursor_tiktok/domain/enums/time_convert_type.dart';

class TimeToStringConverter {
  String convert(DateTime time, TimeConvertType type) {
    switch (type) {
      case TimeConvertType.comment:
        return _convertAsCommentTime(time);
      default:
        throw UnimplementedError('Such type in not implemented');
    }
  }

  String _convertAsCommentTime(DateTime time) {
    final Duration timeToConvert = DateTime.now().difference(time);
    if (timeToConvert.inHours > 0) {
      return '${timeToConvert.inHours}ч';
    } else if (timeToConvert.inMinutes > 0) {
      return '${timeToConvert.inMinutes}мин';
    }
    return '${timeToConvert.inSeconds}с';
  }
}
